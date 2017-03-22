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
use \think\Session;
use \think\View;
use \think\Config;
use \think\Request;
use \think\Hook;
use \think\auth\Auth;


/**
* 父控制器
* @author nethuige<511205380@qq.com>
* @version v1.0
*/
class Base extends controller
{
    public $userinfo;

	/**
	* 构造函数
	*/
    public function _initialize(){
        //控制器构造执行顺序大于action_begin标签位，在控制器Hook::listen会早于Hook::add
        //由于action_begin标签位无法满足需求，此处创建一个[控制器构造的]行为标签位
        //1.vendor目录下addons插件先Hook::add绑定到base_ctrl_init标签位
        //2.控制器构造函数在创建标签位base_ctrl_init
        Hook::listen('base_ctrl_init');

        //钩子挂载
        $this->userinfo = Session::get("userinfo");
        $request = Request::instance();
        hook("baseCtrlHook",['request'=>$request,'userinfo'=>$this->userinfo]);

    	//Session::clear();
 		/*$request = Request::instance();
    	print_r($request->module()."<br/>".HumpToUnderLine($request->controller())."<br/>".$request->action()."<br/>");
    	$auth = new Auth();
    	$checkResult = $auth->check('system_login_check',2,'and',2);
    	*/
    	/*$request = Request::instance();
    	$user['username'] = "77777";
    	$user['password'] = "e10adc3949ba59abbe56e057f20f883e";
    	$auth = new Auth();
    	$checkResult = $auth->check('system_login_check',18);
        var_dump($checkResult);
        return false;*/
        
    	/*$condition =  "{username}=='[username]' and {password}==md5('[password]')";
    	$condition = "{username}=='' or 1==1";
    	preg_match_all('%.*?\[(.*?)\]%sim', $condition, $arr);
    	if(count($arr[1])>0){
			$request_name = $arr[1];
	    	for($i=0;$i<count($request_name);$i++){
	    		$val = $request->param($request_name[$i]);
	    		$condition = str_replace("[".$request_name[$i]."]",$val, $condition);
	    	}
	    	$command = preg_replace('/\{(\w*?)\}/', '$user[\'\\1\']', $condition);
	    	@(eval('$condition=(' . $command . ');'));
    	}else{
    		$command = preg_replace('/\{(\w*?)\}/', '$user[\'\\1\']', $condition);
	    	@(eval('$condition=(' . $command . ');'));
    	}*/
    	
    	
		//var_dump($checkResult);

    	/*$condition = str_replace('[',$request->param('username') , $condition);

		$command = preg_replace('/\{(\w*?)\}/', '$user[\'\\1\']',$condition);
               
    	print_r($command);*/

    	//增加附加规则登录验证

		/*$controller = request()->controller();
		$controller = request()->controller();
		$action = request()->action();
		$auth = new Auth();
		if(!$auth->check($controller . '-' . $action, session('uid'))){
			$this->error('你没有权限访问');
		}*/

  	}
  	

  	


}
