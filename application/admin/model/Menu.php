<?php
namespace app\admin\model;

use think\Model;
use traits\model\SoftDelete;
/**
* 菜单模型
* @author nethuige<511205380@qq.com>
* @version v1.0
*/
class Menu extends Model
{
	//使用软删除功能
	//默认情况下查询的数据不包含软删除数据，如果需要包含软删除的数据，可以使用下面的方式查询
	use SoftDelete;

	//protected  $deleteTime = 'delete_time'; //软删除字段(时间戳类型,默认值为NULL)

	//设置返回数据集的对象名,collection返回数据集对象，放空返回数组
	//如果是数据集查询的话有两种情况，由于默认的数据集返回结果的类型是一个数组，因此无法调用toArray方法，必须先转成数据集对象然后再使用toArray方法，系统提供了一个collection助手函数实现数据集对象的转换
    //protected  $resultSetType = 'collection';

    //数据完成
    /*protected $auto = ['name', 'ip'];
    protected $insert = ['status' => 1];  
    protected $update = ['update_time']; */

    // 定义全局的查询范围
    //如果你的模型定义了base基础查询，请确保添加软删除的基础查询条件。
    /*protected function base($query)
    {
        
    }*/

    //状态获取器
    protected function getStatusAttr($value)
    {
        $status = ["禁用","启用"];
        return $status[$value];
    }
    //是否显示获取器
    protected function getShowAttr($value)
    {
        $show = ["隐藏","显示"];
        return $show[$value];
    }
    //更新时间
    /*protected function setUpdateTimeAttr()
    {
        return date("Y-m-d H:i:s");
    }*/


}
?>