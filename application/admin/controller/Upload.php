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
use app\admin\model\Files as FilesModel;
/**
* 上传控制器
* @author nethuige<511205380@qq.com>
* @version v1.0
*/
class Upload extends Base
{

    /**
     * 上传头像
     * @param Request $request
     * @return bool|\think\response\Json
     */
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

    /**
     * 上传文件
     * @param Request $request
     * @return bool|\think\response\Json
     */
    public function uploadFile(Request $request)
    {
        //上传到临时文件夹
        $file = $request->file('file');
        $path = Config::get('upload_path');
        $info = $file->validate(['size'=>50 * 1024*1024,'ext'=>'doc,docx,pdf'])->move($path.'files');
        if($info){
            $filesModel = new FilesModel;
            $filesModel->usercode = $this->userinfo->usercode;
            $filesModel->username = $this->userinfo->username;
            $filesModel->title = $info->getFilename();
            $filesModel->filename = $info->getSaveName();
            $filesModel->size = $info->getSize();
            $filesModel->ext = $info->getExtension();
            $filesModel->path = $info->getRealPath();
            $filesModel->md5 = $info->hash('md5');
            $filesModel->save();
            if($filesModel->id){
                $res = ['status'=>true,'msg'=>"上传成功","file"=>[
                        "id" => $filesModel->id,
                        "name" =>$filesModel->filename
                    ]
                ];
                return json($res); //系统返回json的是ajax请求，此处还得自己json转换
            }else{
                return false;
            }
        }else{
            $error = $file->getError();
            return false;
        }
    }
}
