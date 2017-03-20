<?php
namespace app\admin\model;

use think\Model;
use think\Config;
use traits\model\SoftDelete;
/**
* 用户模型
* @author nethuige<511205380@qq.com>
* @version v1.0
*/
class User extends Model
{
	use SoftDelete;
	
	//如果是直接赋值可以不需要数据完成，修改器就能生效
	//如果是$userModel = new UserModel($_POST);
	//这种通过外部提交赋值给模型的需要设置数据完成修改器才会生效
	protected $auto = ['face','password'];

	//状态获取器
    protected function getStatusAttr($value)
    {
    	$status = ["禁用","启用"];
        return $status[$value];
    }

	//头像修改器
 	protected function setFaceAttr($value)
    {
    	if(mb_strpos($value, 'picture')!==false){
			//未修改头像
			return $value;
		}else{
			//头像文件处理
			if(!empty($value) && mb_strpos($value, DS)!==false){
				$path = Config::get('upload_path');
				$filename = explode(DS, $value)[1]; //取出文件名
				$temp_path = $path.'temp'.DS.$value; //源文件
				$total_path = $path.'picture'.DS.$filename; //目标文件
				copy($temp_path,$total_path); //从临时目录中复制到头像目录
				return 'picture/'.$filename;
			}else{
				return 'picture/default.jpg';
			}
		}
    }
    //密码修改器
    protected function setPasswordAttr($value)
    {
        return md5($value);
    }
}
?>