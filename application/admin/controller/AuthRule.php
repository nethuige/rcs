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
use app\admin\model\AuthRule as AuthRuleModel;
use app\admin\model\AuthGroup as AuthGroupModel;

/**
* 规则控制器
* @author nethuige<511205380@qq.com>
* @version v1.0
*/
class AuthRule extends Base
{

	/**
	* 规则页
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
				$where = getRichWhere($request,["title","name"]);
			}else{
				//快速搜索
				$where = getWhere($scolumnText,$searchModel,$searchText);
			}
			$list = AuthRuleModel::where($where)->page($pageNumber,$pageSize)->order($order)->select();
			$count = AuthRuleModel::where($where)->count();
			$res = ["rows"=>$list,"total"=>$count];
			return $res;
		}
   	}
   	/**
	* 创建规则
   	*/
   	public function create(Request $request)
    {
		if($request->isPost()){
			$AuthRuleModel = new AuthRuleModel($_POST);
			$AuthRuleModel->allowField(true)->save();
			$id = $AuthRuleModel->id;
			if($id){
				$res = ["data"=>$id,"status"=>true,"msg"=>"添加成功"];
			}else{
				$res = ["data"=>"","status"=>false,"msg"=>"添加失败"];
			}	
			return json($res);
		}
   	}
   	/**
	* 编辑规则
   	*/
   	public function edit(Request $request){
		if ($request->isGet()){
			$id = $request->param('id');
			$authRuleModel = AuthRuleModel::get($id);
			return $authRuleModel;
		}else if($request->isPost()){
			$id = $request->param('id');
			$authRuleModel = new AuthRuleModel();
			$effect = $authRuleModel->allowField(true)->save($_POST,['id' => $id]);
			if($effect){
				$res['status'] = true;
				$res['msg'] = "保存成功";
			}else{
				$res['status'] = false;
				$res['msg'] = "保存失败";
			}
			return $res;
		}
   	}
   	/*
	* 软删除(支持批量)
   	*/
   	public function delete(Request $request){
   		$id = $request->param("id");
   		$effect = AuthRuleModel::destroy($id);
   		if($effect){
			$res = ['status'=>true,'msg'=>'删除成功'];
		}else{
			$res = ['status'=>false,'msg'=>'删除失败'];
		}
		return $res;
   	}
   	/**
	* 配置规则
   	*/
   	public function ruleConfig(Request $request){
		if ($request->isGet()){
			return $this->fetch();
		}else if($request->isPost()){
			$id = $request->param("groupid");
			//去掉[系统]节点
            $rule_arr = explode(',',$request->param("rules"));
            $key = array_search(0, $rule_arr);
            $key !== false && array_splice($rule_arr, $key, 1);
            $data['rules'] =  implode(',',$rule_arr);
			$authGroupModel = new AuthGroupModel();
			$effect = $authGroupModel->save($data,['id' => $id]);
			if($effect){
				$res['status'] = true;
				$res['msg'] = "保存成功";
			}else{
				$res['status'] = false;
				$res['msg'] = "保存失败";
			}
			return $res;
		}
   	}

    /**
     * 根据用户组id获取规则树
     * @param Request $request
     * @return array|false|\PDOStatement|string|\think\Collection
     */
   	public function getRuleTree(Request $request){
   		//规则树
   		$list = AuthRuleModel::field("id,title text,pid parent")->order("sort asc")->select();
   		$list_id = array_column($list->toArray(),'id'); //获取id列
   		//用户组拥有的规则
   		$id = $request->param("id"); //用户组id
	   	if(isset($id)){
	   		$groupModel = AuthGroupModel::get($id);
	   		if(!empty($groupModel)){
	   			$rules_id = explode(',', $groupModel['rules']);
	   			for($i=0;$i<count($rules_id);$i++){
	   				$list_index = array_keys($list_id,$rules_id[$i]); //匹配规则id列对应的索引
		   			!empty($list_index) && $list[$list_index[0]]['state'] = ["opened"=>true,"selected"=>true]; //设置节点选中
		   		}
	   		}
   		}
   		$list[] = array("id"=>0,"text"=>"追偿案管理系统","icon"=>"fa fa-desktop","parent"=>"#");
		return $list;
   	}

}
