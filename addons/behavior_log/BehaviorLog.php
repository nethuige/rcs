<?php
// +----------------------------------------------------------------------
// | RCS
// +----------------------------------------------------------------------
// | Copyright (c) 2017 NetHuige All rights reserved.
// +----------------------------------------------------------------------
// | Author: nethuige <511205380@qq.com>
// +----------------------------------------------------------------------
namespace addons\behavior_log;  // 注意命名空间规范

use think\Addons;
use think\Db;
use addons\behavior_log\model\BehaviorLog as BehaviorLogModel;

/**
 * 行为日志插件
 * @author nethuige
 */

class BehaviorLog extends  Addons
{
    // 该插件的基础信息(安装插件时需写入数据库)
    public $info = [
        'name' => 'ActionLog',   // 插件标识
        'title' => '行为日志',  // 插件名称
        'description' => '记录用户访问行为',    // 插件简介
        'status' => 1,  // 状态
        'author' => 'nethuige',
        'version' => '1.0'
    ];

    /**
     * 插件安装方法
     * @return bool
     */
    public function install()
    {
        return true;
    }

    /**
     * 插件卸载方法
     * @return bool
     */
    public function uninstall()
    {
        return true;
    }

    /**
     * 实现的baseCtrlHook钩子方法
     * @return mixed
     */
    public function baseCtrlHook($param)
    {
        $behaviorModel = new BehaviorLogModel;
        $behaviorModel->usercode = $param['userinfo']['usercode'];
        $behaviorModel->username = $param['userinfo']['username'];
        $behaviorModel->module = $param['request']->module();
        $behaviorModel->controller = $param['request']->controller();
        $behaviorModel->action = $param['request']->action();
        if(!empty($param['request']->param())){
            $behaviorModel->params = json_encode($param['request']->param());
        }
        $behaviorModel->method = $param['request']->method();
        $behaviorModel->ip = $param['request']->ip();
        $behaviorModel->is_ajax = $param['request']->isAjax();
        $behaviorModel->save();
       // print_r($param['request']->dispatch());
        //print_r("我是行为日志插件");
        // 调用钩子时候的参数信息
        //print_r($param->controller());
        // 当前插件的配置信息，配置信息存在当前目录的config.php文件中，见下方
       // print_r($this->getConfig());
        // 可以返回模板，模板文件默认读取的为插件目录中的文件。模板名不能为空！
        //return $this->fetch('info');
    }

}