<?php
namespace app\admin\model;

use think\Model;
use traits\model\SoftDelete;
/**
* 用户组模型
* @author nethuige<511205380@qq.com>
* @version v1.0
*/
class AuthGroup extends Model
{
	
	use SoftDelete;
	  //状态获取器
    protected function getStatusAttr($value)
    {
        $status = ["禁用","启用"];
        return $status[$value];
    }
}
?>