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

/**
 * 将list_to_tree的树还原成列表
 * @param  array $tree  原来的树
 * @param  string $child 孩子节点的键
 * @param  string $order 排序显示的键，一般是主键 升序排列
 * @param  array  $list  过渡用的中间数组，
 * @return array        返回排过序的列表数组
 */
function tree_to_list($tree, $child = '_child', $order='id', &$list = array()){
    if(is_array($tree)) {
        $refer = array();
        foreach ($tree as $key => $value) {
            $reffer = $value;
            if(isset($reffer[$child])){
                unset($reffer[$child]);
                tree_to_list($value[$child], $child, $order, $list);
            }
            $list[] = $reffer;
        }
        $list = list_sort_by($list, $order, $sortby='asc');
    }
    return $list;
}
/**
 * 格式化字节大小
 * @param  number $size      字节数
 * @param  string $delimiter 数字和单位分隔符
 * @return string            格式化后的带单位的大小
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
function format_bytes($size, $delimiter = '') {
    $units = array('B', 'KB', 'MB', 'GB', 'TB', 'PB');
    for ($i = 0; $size >= 1024 && $i < 5; $i++) $size /= 1024;
    return round($size, 2) . $delimiter . $units[$i];
}

/**
 * 时间戳格式化
 * @param int $time
 * @return string 完整的时间显示
 * @author huajie <banhuajie@163.com>
 */
function time_format($time = NULL,$format='Y-m-d H:i'){
    $time = $time === NULL ? NOW_TIME : intval($time);
    return date($format, $time);
}