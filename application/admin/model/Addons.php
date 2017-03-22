<?php
namespace app\admin\model;

use think\Model;
use traits\model\SoftDelete;
/**
 * 插件模型
 * @author nethuige<511205380@qq.com>
 * @version v1.0
 */
class Addons extends Model
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