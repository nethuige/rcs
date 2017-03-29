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
use app\admin\model\ClaimsReplevy as ClaimsReplevyModel;

/**
 * 理赔阶段追偿控制器
 * @author nethuige<511205380@qq.com>
 * @version v1.0
 */
class ClaimsReplevy extends Base
{

    /**
     * 案件维护页
     */
    public function maintain(Request $request)
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
            $list = ClaimsReplevyModel::where($where)->page($pageNumber,$pageSize)->order($order)->select();
            $count = ClaimsReplevyModel::where($where)->count();
            $res = ["rows"=>$list,"total"=>$count];
            return $res;
        }
    }
    /**
     * 案件查询
     */
    public function query(Request $request)
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
            $list = ClaimsReplevyModel::where($where)->page($pageNumber,$pageSize)->order($order)->select();
            $count = ClaimsReplevyModel::where($where)->count();
            $res = ["rows"=>$list,"total"=>$count];
            return $res;
        }
    }
    /**
     * 创建案件
     */
    public function create(Request $request)
    {
        if ($request->isGet()){
            return $this->fetch();
        }else if($request->isPost()){
            $claimsReplevyModel = new ClaimsReplevyModel($_POST);
            $claimsReplevyModel->allowField(true)->save();
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
     * 编辑案件
     */
    public function edit(Request $request){
        if ($request->isGet()){
            $id = $request->param('id');
            $claimsReplevyModel = ClaimsReplevyModel::get($id);
            return $claimsRecoveryModel;
        }else if($request->isPost()){
            $id = $request->param('id');
            $claimsReplevyModel = new ClaimsReplevyModel();
            $effect = $claimsReplevyModel->allowField(true)->save($_POST,['id' => $id]);
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
        $effect = ClaimsReplevyModel::destroy($id);
        if($effect){
            $res = ['status'=>true,'msg'=>'删除成功'];
        }else{
            $res = ['status'=>false,'msg'=>'删除失败'];
        }
        return $res;
    }

}
