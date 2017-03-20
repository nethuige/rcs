<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件

/**
* 获取查询条件
* @param string column 列名
* @param string mode   查询模式
* @param string value  值
*/
function getWhere($column,$mode,$value){
	$where = [];
	if(trim($column)!="" && $mode!=""){
		if($mode=='1'){
			$where[$column] = ['like',"%{$value}%"];
		}else{
			$where[$column] = $value;
		}
	}
	return $where;
}
/**
* 获取高级搜索查询条件
* 支持*号模糊查询
* @param string request request对象
* @param string fields   需要获取的字段数组
*/
function getRichWhere($request,$fields){
	$where = [];
	foreach($fields as $key=>$val){
		if(mb_strpos($request->param($val),'*')!==false){
			//like模糊查询
			$v = str_replace('*', '%', $request->param($val));
			$arr = ['like',$v];
		}else{
			//精确查询
			$arr = ['=',$request->param($val)];
		}
		!empty($request->param($val)) && $where[$val] = $arr;
	}
	return $where;
}

/**
* 将下划线命名转换为驼峰式命名
*/
function UnderlineToHump($str,$ucfirst = true)
{
    $str = ucwords(str_replace('_', ' ', $str));
    $str = str_replace(' ','',lcfirst($str));
     return $ucfirst ? ucfirst($str) : $str;
}

/*将驼峰法命名转换为下划线*/
function HumpToUnderLine($str){
	$str=lcfirst($str);
	$arr = preg_split("/(?=[A-Z])/",$str);
	array_walk($arr,function(&$val,$key){$val = strtolower($val);});
	return implode('_',$arr);
}

/**
 * 把返回的数据集转换成Tree
 * access public
 * @param array $list 要转换的数据集
 * @param string $pid parent标记字段
 * @param string $level level标记字段
 * return array
 */
function list_to_tree($list, $pk='id',$pid = 'pid',$child = '_child',$root=0) {
    // 创建Tree
    $tree = array();
    if(is_array($list)) {
        // 创建基于主键的数组引用
        $refer = array();
        foreach ($list as $key => $data) {
            $refer[$data[$pk]] =& $list[$key];
        }
        foreach ($list as $key => $data) {
            // 判断是否存在parent
            $parentId = $data[$pid];
            if ($root == $parentId) {
                $tree[] =& $list[$key];
            }else{
                if (isset($refer[$parentId])) {
                    $parent =& $refer[$parentId]; //父节点
                    $parent[$child][] =& $list[$key]; //子节点
                }
            }
        }
    }
    return $tree;
}