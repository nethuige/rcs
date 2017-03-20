<?php
$root = request()->root();
define('__ROOT__',str_replace('/index.php','',$root));
return [
	// 应用调试模式
    'app_debug'              => true,
     // 应用Trace
    'app_trace'              => true,
    // 视图输出字符串内容替换
    'view_replace_str'       => [
        '__PUBLIC__' => __ROOT__.'/static',
        '__UPLOAD__' => __ROOT__.'/uploads',
        '__JSON__' => __ROOT__.'/json',
    ],
    //上传文件保存基路径
    'upload_path' => ROOT_PATH .'public' . DS . 'uploads'.DS,
];