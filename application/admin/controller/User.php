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
use app\admin\model\User as UserModel;
/**
* 用户控制器
* @author nethuige<511205380@qq.com>
* @version v1.0
*/
class User extends Base
{

	//如果继承think\Controller，则可以使用$this->request或request()助手函数,建议使用注入的方式
	/**
	* 列表数据
	*/
    public function index(Request $request)
    {
		if ($request->isGet()){
			return $this->fetch();
		}else if($request->isPost()){
			$pageNumber = $request->param('pageNumber');
			$pageSize = $request->param('pageSize');
			$sortName = $request->param('sortName');
			$sortOrder = $request->param('sortOrder');
			$scolumnText = $request->param('scolumnText');
			$searchModel = $request->param('searchModel');
			$searchText = $request->param('searchText');
			$order = "{$sortName} {$sortOrder}";
			if($scolumnText==""){
				//高级搜索
				$where = getRichWhere($request,array("usercode","comcode","username","email","tel","mobile"));
			}else{
				//快速搜索
				$where = getWhere($scolumnText,$searchModel,$searchText);
			}
			$list = UserModel::field("password",true)->where($where)->page($pageNumber,$pageSize)->order($order)->select();
			$count = UserModel::where($where)->count();
			$res = ["rows"=>$list,"total"=>$count];
			return $res;
		}
   	}
   	/**
	* 创建用户
   	*/
   	public function create(Request $request)
    {
		if ($request->isGet()){
			return $this->fetch();
		}else if($request->isPost()){
			$userModel = new UserModel($_POST);
			$userModel->allowField(true)->save();
			$id = $userModel->id;
			if($id){
				$res = ['status'=>true,'msg'=>'添加成功','data'=>$id];
			}else{
				$res = ['status'=>false,'msg'=>'添加失败'];
			}	
			return $res;
		}
   	}
   	/**
	* 编辑用户
   	*/
   	public function edit(Request $request){
		if ($request->isGet()){
			$id = $request->param('id');
			$userModel = UserModel::get($id);
			$this->assign("user",$userModel);
			return $this->fetch();
		}else if($request->isPost()){
			$path = Config::get("upload_path");
			$face =  $request->param('face');
			$id = $request->param('id');
			if(!file_exists($path.$face)){
				//删除旧头像(用户修改了头像)
				$user = UserModel::get($id);
				unlink($path.$user['face']);
			}
			$userModel = new UserModel;
			$effect = $userModel->allowField(true)->save($_POST,['id' =>$id]);
			if($effect){
				$res = ['status'=>true,'msg'=>'保存成功'];
			}else{
				$res = ['status'=>false,'msg'=>'保存失败'];
			}
			return $res;
		}
   	}
   	/*
	* 软删除(支持批量)
   	*/
   	public function delete(Request $request){
   		$id = $request->param("id");
   		$effect = UserModel::destroy($id);
   		if($effect){
			$res = ['status'=>true,'msg'=>'删除成功'];
		}else{
			$res = ['status'=>false,'msg'=>'删除失败'];
		}
		return $res;
   	}
    /**
     * 个人信息
     */
    public function myinfo()
    {
        $this->assign("userinfo", $this->userinfo);
        return $this->fetch();
    }

    /**
     * 修改密码
     * @param Request $request
     */
    public function modifyPwd(Request $request){
        $user = Session::get("user");
        $old_password = md5($request->param('old_password'));
        $new_password = $request->param('new_password');
        $userModel = UserModel::where(['password'=>$old_password,'id'=>$user['id']])->select();
        if($userModel->isEmpty()){
            return ["status"=>false,"msg"=>"修改失败,原密码错误"];
        }else{
            $userModel = new UserModel();
            $userModel->save([
                'password'  => $new_password,
            ],['id' => $user['id']]);
            return ["status"=>true,"msg"=>"修改成功"];
        }
    }
    /**
     * 获取用户
     * @param string q 搜索词
     * @param string page_limit 每页数量
     * @param string page 页码
     * @return json res 用户列表
     */
    public function getUserList(Request $request){
        $q = $request->param('q');
        $page_limit = $request->param('page_limit');
        $page = $request->param('page');
        $where = ["status"=>1,"usercode|username"=>["like","%{$q}%"]];
        $list = UserModel::where($where)->field(['username'=>'text','usercode'=>'id','face','comname'])->page($page,$page_limit)->select();
        $count = UserModel::where($where)->count();
        $res = ["rows"=>$list,"total"=>$count];
        return $res;
    }
   	/*
	* 真实删除
   	*/
   	/*public function delete(Request $request){
   		$id = $request->param("id");
   		$path = Config::get('upload_path');
   		if(mb_strpos($id, ',')!==false){
   			//批量删除
   			$ids = explode(',',$request->param("id"));
   			$users = UserModel::where("id","in",$ids)->select();
   			$effect = UserModel::delete($ids);
   			foreach($users as $key=>$val){
   				if(mb_strpos($val['face'], "default")==false && $effect>0){
	   				unlink($path.$val['face']); //移除头像
	   			}
   			}
   		}else{
			$user = UserModel::where("id",$id)->find();
   			$effect = UserModel::delete($id);
			if(mb_strpos($user['face'], "default")==false && $effect>0){
				unlink($path.$user['face']);
			}
   		}
   		if($effect>0){
			$res['status'] = true;
			$res['msg'] = "删除成功";
		}else{
			$res['status'] = false;
			$res['msg'] = "删除失败";
		}
		return $res;
   	}*/
   	
}
