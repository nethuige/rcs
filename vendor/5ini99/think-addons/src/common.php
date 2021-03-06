<?php
// +----------------------------------------------------------------------
// | thinkphp5 Addons [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2016 http://www.zzstudio.net All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: Byron Sampson <xiaobo.sun@qq.com>
// +----------------------------------------------------------------------

use think\Hook;
use think\Config;
use think\Loader;
use think\Db;

/**
 * 插件公共方法
 * @author nethuige<511205380@qq.com>
 */
// 插件目录
define('ADDON_PATH', ROOT_PATH . 'addons' . DS);

// 定义路由
\think\Route::any('addons/execute/:route', "\\think\\addons\\Route@execute");

// 如果插件目录不存在则创建
if (!is_dir(ADDON_PATH)) {
    @mkdir(ADDON_PATH, 0777, true);
}

// 注册类的根命名空间
\think\Loader::addNamespace('addons', ADDON_PATH);

// 闭包初始化行为,将行为绑定到[base_ctrl_init]标签位
// 将 插件类和钩子的绑定 的行为 绑定到 控制器开始标签位(action_begin)
// 流程：控制器开始->插件类绑定(add)到钩子->钩子监听(listen)，调用对应钩子下的所有插件
// Hook::add必须是在Hook::listen之前才会生效
Hook::add('base_ctrl_init', function () {
    // 获取系统配置
    $data = Config::get('app_debug') ? [] : cache('hooks');
    $hoos_list = Db::name("hooks")->where('status',1)->select(); //钩子列表
    $addons_list = Db::name("addons")->where('status',1)->select()->toArray(); //插件列表
    if (empty($data)) {
        // 初始化钩子[初始化行为]
        foreach ($hoos_list as $key => $val) {
            $addons_name = $val['addons'];
            $hook_name = $val['name'];
            //插件是否为启用
            if(!empty(array_keys(array_column($addons_list,'name'),$addons_name))){
                //插件已启用
                if (is_string($addons_name)) {
                    $addons_name = explode(',', $addons_name);
                } else {
                    $addons_name = (array)$addons_name;
                }
                $addons[$hook_name] = array_filter(array_map('get_addon_class', $addons_name));
                Hook::add($hook_name, $addons[$hook_name]); //插件类和钩子进行绑定
                cache('hooks', $addons);
            }
        }
    } else {
        Hook::import($data, false);
    }
});


/**
 * 处理插件钩子(其实就是给行为添加一个标签位)
 * @param string $hook 钩子名称
 * @param mixed $params 传入参数给插件
 * @return void
 */
function hook($hook, $params = [])
{
    \think\Hook::listen($hook, $params);
}

/**
 * 获取插件类的类名
 * @param $name 插件名
 * @param string $type 返回命名空间类型
 * @param string $class 当前类名
 * @return string
 */
function get_addon_class($name, $type = 'hook', $class = null)
{
    $name = \think\Loader::parseName($name);
    // 处理多级控制器情况
    if (!is_null($class) && strpos($class, '.')) {
        $class = explode('.', $class);
        foreach ($class as $key => $cls) {
            $class[$key] = \think\Loader::parseName($cls, 1);
        }
        $class = implode('\\', $class);
    } else {
        $class = \think\Loader::parseName(is_null($class) ? $name : $class, 1);
    }
    switch ($type) {
        case 'controller':
            $namespace = "\\addons\\" . $name . "\\controller\\" . $class;
            break;
        default:
            $namespace = "\\addons\\" . $name . "\\" . $class;
    }
    return class_exists($namespace) ? $namespace : '';
}

/**
 * 获取插件类的配置文件数组
 * @param string $name 插件名
 * @return array
 */
function get_addon_config($name)
{
    $class = get_addon_class($name);
    if (class_exists($class)) {
        $addon = new $class();
        return $addon->getConfig();
    } else {
        return [];
    }
}

/**
 * 插件显示内容里生成访问插件的url
 * @param $url
 * @param array $param
 * @return bool|string
 * @param bool|string $suffix 生成的URL后缀
 * @param bool|string $domain 域名
 */
function addon_url($url, $param = [], $suffix = true, $domain = false)
{
    $url = parse_url($url);
    $case = config('url_convert');
    $addons = $case ? Loader::parseName($url['scheme']) : $url['scheme'];
    $controller = $case ? Loader::parseName($url['host']) : $url['host'];
    $action = trim($case ? strtolower($url['path']) : $url['path'], '/');

    /* 解析URL带的参数 */
    if (isset($url['query'])) {
        parse_str($url['query'], $query);
        $param = array_merge($query, $param);
    }

    // 生成插件链接新规则
    $actions = "{$addons}-{$controller}-{$action}";

    return url("addons/execute/{$actions}", $param, $suffix, $domain);
}