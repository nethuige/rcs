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
use app\admin\model\Menu as MenuModel;
/**
* 首页控制器
* @author nethuige<511205380@qq.com>
* @version v1.0
*/
class Index extends Base
{
    /**
     * 后台框架页面
     * @return mixed
     */
    public function index()
    {

        $user = Session::get("user");
        $userinfo["username"] = $user['username'];
        $userinfo["face"] = $user['face'];
        $userinfo["group"] = $user['groups'][0];
        $menu = $this->getUserMenu($user['id']);
        $this->assign("userinfo", $userinfo);
        $this->assign("menu", $menu);
        return $this->fetch();
    }

    /**
     * 系统主页
     */
    public function home()
    {
        return $this->fetch();
    }
 	/**
	* 获取指定用户的首页菜单
	* @param array menuTree 菜单树 array("title"=>"","url"=>"",icon=>"","_child"=>array("title"=>...))
	* @param bool show_icon 是否显示菜单图标，因为UI审美问题，只建议顶级菜单显示图标即可
	* @return string 菜单html
    */
    public function getUserMenu($uid){
		//取系统全部菜单
    	$menuModel = MenuModel::where(["status"=>1,"show"=>1])->order("sort asc")->select()->toArray();
    	//根据用户授权的规则，取出用户对于的菜单
    	$auth = new Auth();
    	foreach($menuModel as $key=>$val){
			$checkResult = $auth->check($val['url'],$uid); //菜单url关联规则标识
	    	if($checkResult){
	    		$menuList[] = $val;
	    	}
    	}
	 	$menuTree = list_to_tree($menuList);
	 	$html = $this->createMenu($menuTree);
	 	return $html;
    }

    /**
	* 首页菜单-生成无限极别菜单
	* @param array menuTree 菜单树 array("title"=>"","url"=>"",icon=>"","_child"=>array("title"=>...))
	* @param bool show_icon 是否显示菜单图标，因为UI审美问题，只建议顶级菜单显示图标即可
	* @return string 菜单html
    */
    protected function createMenu($menuTree){
    	$html = [];
	 	foreach($menuTree as $key=>$val){
	 		$html[] = '<li>';
	 		if(empty($val['_child'])){
	 			$html[] = '<a class="J_menuItem" href="'.url($val['url']).'">';
                !empty($val['icon']) && $html[] = '<i class="'.$val['icon'].'"></i>';
                $html[] = '<span class="nav-label">'.$val['title'].'</span></a>';
	 		}else{
	 			$html[] = '<a href="#">';
	 			!empty($val['icon']) &&  $html[] = '<i class="'.$val['icon'].'"></i>';
 				$html[] = '<span class="nav-label">'.$val['title'].'</span>';
 				$html[] = '<span class="fa arrow"></span></a>';
 				$html[] = '<ul class="nav nav-second-level">';
	 			$html[] = $this->createMenu($val['_child']);
	 			$html[] = '</ul>';
	 		}
            $html[] = '</li>';
	 	}
	 	$html = implode('', $html);
	 	return $html;
    }

}
