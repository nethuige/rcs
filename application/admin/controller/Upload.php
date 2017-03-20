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
* 上传控制器
* @author nethuige<511205380@qq.com>
* @version v1.0
*/
class Upload extends Base
{

	//上传头像
    public function uploadFace(Request $request)
    {
    	//上传到临时文件夹
	    $file = $request->file('file');
	    $path = Config::get('upload_path');
	    $info = $file->validate(['size'=>1 * 1024*1024,'ext'=>'gif,jpg,jpeg,bmp,png'])->move($path.'temp');
	    if($info){
	        $res = ['status'=>true,'msg'=>"上传成功","filename"=>$info->getSaveName()];
	        return json($res); //系统返回json的是ajax，此处还得自己json转换
	    }else{
	    	$error = $file->getError();
	    	return false;
	    }
   	}
}
