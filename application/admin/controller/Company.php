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
use app\admin\model\Company as CompanyModel;
/**
* 归属公司控制器
* @author nethuige<511205380@qq.com>
* @version v1.0
*/
class Company extends Base
{
    
   	/**
	* 获取归属公司
	* @param string q 搜索词
	* @param string page_limit 每页数量
	* @param string page 页码
	* @return json res 归属公司列表
   	*/
   	public function getComList(Request $request){
		$q = $request->param('q');
		$page_limit = $request->param('page_limit');
		$page = $request->param('page');
		$where = ["status"=>1,"comcode|comname"=>["like","%{$q}%"]];
		$list = CompanyModel::where($where)->field(['comname'=>'text','comcode'=>'id'])->page($page,$page_limit)->select();
		$count = CompanyModel::where($where)->count();
		$res = ["rows"=>$list,"total"=>$count];
		return $res;
   	}
}
