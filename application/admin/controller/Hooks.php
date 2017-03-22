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
use app\admin\model\Hooks as HooksModel;

/**
 * 插件钩子控制器
 * @author nethuige<511205380@qq.com>
 * @version v1.0
 */
class Hooks extends Base
{

    /**
     * 钩子页
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
                $where = getRichWhere($request,["title","description"]);
            }else{
                //快速搜索
                $where = getWhere($scolumnText,$searchModel,$searchText);
            }
            $list = HooksModel::where($where)->page($pageNumber,$pageSize)->order($order)->select();
            $count = HooksModel::where($where)->count();
            $res = ["rows"=>$list,"total"=>$count];
            return $res;
        }
    }
    /**
     * 创建钩子
     */
    public function create(Request $request)
    {
        if($request->isPost()){
            $hooksModel = new HooksModel($_POST);
            $hooksModel->allowField(true)->save();
            $id = $hooksModel->id;
            if($id){
                $res = ["data"=>$id,"status"=>true,"msg"=>"添加成功"];
            }else{
                $res = ["data"=>"","status"=>false,"msg"=>"添加失败"];
            }
            return json($res);
        }
    }
    /**
     * 编辑钩子
     */
    public function edit(Request $request){
        if ($request->isGet()){
            $id = $request->param('id');
            $hooksModel = HooksModel::get($id);
            return $hooksModel;
        }else if($request->isPost()){
            $id = $request->param('id');
            $hooksModel = new HooksModel();
            $effect = $hooksModel->allowField(true)->save($_POST,['id' => $id]);
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
        $effect = HooksModel::destroy($id);
        if($effect){
            $res = ['status'=>true,'msg'=>'删除成功'];
        }else{
            $res = ['status'=>false,'msg'=>'删除失败'];
        }
        return $res;
    }
}
