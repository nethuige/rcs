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
use \think\Config;
use \think\Cache;
use app\admin\model\Addons as AddonsModel;

/**
 * 插件控制器
 * @author nethuige<511205380@qq.com>
 * @version v1.0
 */
class Addons extends Base
{

    /**
     * 插件页
     */
    public function index(Request $request)
    {
        if ($request->isGet()){
            //遍历插件文件夹，找出所有插件
            //....
            return $this->fetch();
        }
    }

}
