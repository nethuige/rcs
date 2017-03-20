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
use think\auth\Auth;
use app\admin\model\User as UserModel;

/**
 * 登录控制器
 * @author nethuige<511205380@qq.com>
 * @version v1.0
 */
class Login extends Controller
{
    /**
     * 登录认证
     * @param Request $request
     * @return array|mixed
     */
    public function index(Request $request)
    {
        if ($request->isGet()) {
            Session::has("user") && Session::delete("user");
            return $this->fetch();
        } else if ($request->isPost()) {
            $username = $request->param('username');
            $password = $request->param('password');
            $where = ["username|usercode|mobile" => $username, "password" => md5($password)];
            $user = UserModel::where($where)->find();
            if (empty($user)) {
                $res = ["status" => false, "msg" => "账号或密码错误"];
            } else if ($user['status'] == "禁用") {
                $res = ["status" => false, "msg" => "账户已被禁用"];
            } else {
                //验证通过,开始验证权限
                $auth = new Auth();
                $checkReust = $auth->check("system_login_check", $user['id']);
                if ($checkReust) {
                    $user['groups'] = $auth->getGroups($user['id']);
                    Session::set("user", $user); //保存用户对象到session
                    $res = ["status" => true, "msg" => "登录成功"];
                } else {
                    //无登录权限或不满足登录权限规则
                    $res = ["status" => false, "msg" => "您无登录权限或不满足登录条件"];
                }
            }
            return $res;
        }
    }

}
