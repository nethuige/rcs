<?php
// +----------------------------------------------------------------------
// | RCS
// +----------------------------------------------------------------------
// | Copyright (c) 2017 nethuige All rights reserved.
// +----------------------------------------------------------------------
// | Author: nethuige <511205380@qq.com>
// +----------------------------------------------------------------------
namespace app\admin\controller;

use \think\Controller;
use \think\Db;
use \think\View;
use \think\Request;
use \think\Session;
use \think\Loader;
use \think\Config;
use \think\auth\Auth;
use app\admin\model\Database as DatabaseModel;

/**
 * 数据库控制器
 * @author nethuige<511205380@qq.com>
 * @version v1.0
 */
class Database extends Base
{

    /**
     * 数据库备份页面
     * @param Request $request
     * @return array|mixed
     */
    public function backup(Request $request)
    {
        if ($request->isGet()) {
            return $this->fetch();
        } else if ($request->isPost()) {
            $list = Db::query('SHOW TABLE STATUS');
            $list = array_map('array_change_key_case', $list);
            return ['rows' => $list, 'total' => count($list)];
        }
    }

    /**
     * 数据库还原页面
     * @param Request $request
     * @return array|mixed
     */
    public function restore(Request $request)
    {
        if ($request->isGet()) {
            return $this->fetch();
        } else if ($request->isPost()) {
            //列出备份文件列表
            $config = Config::get('database_backup');
            $path = $config['path'];
            $flag = \FilesystemIterator::KEY_AS_FILENAME;
            $glob = new \FilesystemIterator($path,  $flag);
            $list = array();
            foreach ($glob as $name => $file) {
                if(preg_match('/^\d{8,8}-\d{6,6}-\d+\.sql(?:\.gz)?$/', $name)){
                    $name = sscanf($name, '%4s%2s%2s-%2s%2s%2s-%d');
                    $date = "{$name[0]}-{$name[1]}-{$name[2]}";
                    $time = "{$name[3]}:{$name[4]}:{$name[5]}";
                    $info['name'] = "{$name[0]}{$name[1]}{$name[2]}-{$name[3]}{$name[4]}{$name[5]}";
                    $part = $name[6];
                    if(isset($list["{$date} {$time}"])){
                        $info['part'] = max($info['part'], $part);
                        $info['size'] = $info['size'] + $file->getSize();
                    } else {
                        $info['part'] = $part;
                        $info['size'] = $file->getSize();
                    }
                    $extension        = strtoupper(pathinfo($file->getFilename(), PATHINFO_EXTENSION));
                    $info['compress'] = ($extension === 'SQL') ? '-' : $extension;
                    $info['time']     = "{$date} {$time}";
                    $list[] = $info;
                }
            }
            return ['rows' => $list, 'total' => count($list)];
        }
    }

    /**
     * 数据库备份操作
     * @param Request $request
     * @return array
     */
    public function backupStart(Request $request)
    {
        $id = $request->param('id');
        $start = $request->param('start');
        $tables = $request->param('tables');
        if ($tables != "") {
            //初始化流程
            //$tables = ['tb_auth_group', 'tb_company', 'tb_auth_group_access']; //表名
            if(mb_strpos($tables,',')!==false){
                $tables = explode(',',$tables);
            }else{
                $tables = [$tables];
            }
            //读取备份配置
            $config = Config::get("database_backup");
            //检查是否有正在执行的任务
            $lock = "{$config['path']}backup.lock";
            if (is_file($lock)) {
                return ['status' => false, 'msg' => '检测到有一个备份任务正在执行，请稍后再试！'];
            } else {
                //创建锁文件
                file_put_contents($lock, time());
            }
            //检查备份目录是否可写
            if (!is_writeable($config['path'])) {
                return ['status' => false, 'msg' => '备份目录不存在或不可写，请检查后重试！'];
            }
            Session::set('backup_config', $config);
            //生成备份文件信息
            $file = array(
                'name' => date('Ymd-His'),
                'part' => 1,
            );
            Session::set('backup_file', $file);
            //缓存要备份的表
            Session::set('backup_tables', $tables);
            //创建备份文件
            $databaseModel = new DatabaseModel($file, $config);
            if (false !== $databaseModel->create()) {
                return ['msg' => '初始化成功', 'status' => true, "data" => ['id' => 0, 'start' => 0]];
            } else {
                return ['status' => false, 'msg' => '初始化失败，备份文件创建失败！'];
            }
        } else if (is_numeric($id) && is_numeric($start)) {
            //备份流程
            $tables = Session::get('backup_tables');
            //备份指定表
            $databaseModel = new DatabaseModel(Session::get('backup_file'), Session::get('backup_config'));
            $start = $databaseModel->backup($tables[$id], $start);
            if (false === $start) { //出错
                return ['status' => false, 'msg' => '备份出错'];
            } elseif (0 === $start) { //下一表
                if (isset($tables[++$id])) {
                    return ["msg" => "{$tables[$id]}表备份完成","status"=>true, "data"=>["id" => $id, "start" => 0]];
                } else {
                    //备份完成，清空缓存
                    unlink(Session::get('backup_config.path') . 'backup.lock');
                    Session::get('backup_tables', null);
                    Session::get('backup_file', null);
                    Session::get('backup_config', null);
                    return ["msg" => "全部备份完成","status"=>true];
                }
            } else {
                $rate = floor(100 * ($start[0] / $start[1]));
                return ["msg" => "正在备份...({$rate}%)","status"=>true,"data"=>['id' => $id, 'start' => $start[0]]];
            }
        }
    }

    /**
     * 数据库还原操作
     * @param Request $request
     */
    public function restoreStart(Request $request){
        $name = $request->param('name');
        $part = $request->param('part');
        $start = $request->param('start');
        if($name!=""){ //初始化
            //获取备份文件信息
            $name  = $name . '-*.sql*';
            $config = Config::get('database_backup');
            $path = $config['path'].$name;
            $files = glob($path);
            $list  = array();
            foreach($files as $filename){
                $basename = basename($filename);
                $match    = sscanf($basename, '%4s%2s%2s-%2s%2s%2s-%d');
                $gz       = preg_match('/^\d{8,8}-\d{6,6}-\d+\.sql.gz$/', $basename);
                $list[$match[6]] = array($match[6], $filename, $gz);
            }
            ksort($list);
            //检测文件正确性
            $last = end($list);
            if(count($list) === $last[0]){
                Session::set('backup_list', $list); //缓存备份列表
                return ["msg"=>"初始化完成","status"=>true,"data"=>['part'=>1,'start'=>0]];
            } else {
                return ["msg"=>"备份文件可能已经损坏，请检查！","status"=>false];
            }
        } elseif(is_numeric($part) && is_numeric($start)) {
            $config = Config::get('database_backup');
            $path = $config['path'].$name;
            $list  = Session::get('backup_list');
            $db = new DatabaseModel($list[$part],[
                'path'     => $path,
                'compress' => $list[$part][2]]);
            $start = $db->import($start);
            if(false === $start){
                return ["msg"=>"还原数据出错，请检查！","status"=>false];
            } elseif(0 === $start) { //下一卷
                if(isset($list[++$part])){
                    return ["msg"=>"正在还原...#{$part}","status"=>true,"data"=>['part' => $part, 'start' => 0]];
                } else {
                    Session::set('backup_list', null);
                    return ["msg"=>"全部还原完成","status"=>true];
                }
            } else {
                if($start[1]){
                    $rate = floor(100 * ($start[0] / $start[1]));
                    return ["msg"=>"正在还原...#{$part} ({$rate}%)","status"=>true,"data"=>['part' => $part, 'start' => $start[0]]];
                } else {
                    return ["msg"=>"正在还原...#{$part}","status"=>true,"data"=>['part' => $part,'gz'=>1, 'start' => $start[0]]];
                }
            }
        }
    }

    /**
     * 数据库表优化
     * @param Request $request
     * @return array
     */
    public function optimize(Request $request)
    {
        $tables = $request->param("tables"); //表名
        $list = Db::query("OPTIMIZE TABLE `{$tables}`");
        if ($list) {
            $tables = str_replace(",", "<br/>", $tables);
            return ['status' => true, 'msg' => "'{$tables}'<br/>优化完成！"];
        } else {
            return ['status' => false, 'msg' => '数据表优化出错请重试'];
        }
    }

    /**
     * 数据库表修复
     * @param Request $request
     * @return array
     */
    public function repair(Request $request)
    {
        $tables = $request->param("tables"); //表名
        $list = Db::query("REPAIR TABLE `{$tables}`");
        if ($list) {
            $tables = str_replace(",", "<br/>", $tables);
            return ['status' => true, 'msg' => "'{$tables}'<br/>修复完成！"];
        } else {
            return ['status' => false, 'msg' => '数据表修复出错请重试'];
        }
    }

    /**
     * 删除备份
     * @param Request $request
     * @return array
     */
    public function delBackup(Request $request){
        $name = $request->param("name");
        if($name){
            $name  = $name . '-*.sql*';
            $config = Config::get('database_backup');
            $path = $config['path'].$name;
            array_map("unlink", glob($path));
            if(count(glob($path))){
                return ['status' => false, 'msg' => '删除失败，请检查权限！'];
            } else {
                return ['status' => true, 'msg' => '删除成功'];
            }
        } else {
            return ['status' => false, 'msg' => '删除失败'];
        }
    }

}
