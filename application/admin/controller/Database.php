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
use \think\Cache;
use \think\auth\Auth;
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
        if ($request->isGet()){
            return $this->fetch();
        }else if($request->isPost()){
            $list = Db::query('SHOW TABLE STATUS');
            $list  = array_map('array_change_key_case', $list);
            return ['rows'=>$list,'total'=>count($list)];
        }
    }

    /**
     * 数据库表优化
     * @param Request $request
     * @return array
     */
    public function optimize(Request $request){
        $tables = $request->param("tables"); //表名
        $list = Db::query("OPTIMIZE TABLE `{$tables}`");
        if($list){
            $tables = str_replace(",","<br/>",$tables);
            return ['status'=>true,'msg'=>"'{$tables}'<br/>优化完成！"];
        } else {
            return ['status'=>false,'msg'=>'数据表优化出错请重试'];
        }
    }

}
