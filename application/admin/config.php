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
    // auth配置
    'auth'  => [
        'auth_on'           => 1, // 权限开关
        'auth_type'         => 1, // 认证方式，1为实时认证；2为登录认证。(有没有登录系统,有就通过)
        'auth_group'        => 'auth_group', // 用户组数据不带前缀表名
        'auth_group_access' => 'auth_group_access', // 用户-用户组关系不带前缀表名
        'auth_rule'         => 'auth_rule', // 权限规则不带前缀表名
        'auth_user'         => 'user', // 用户信息不带前缀表名
    ],
    //数据库备份
    'database_backup'=>[
        //数据库备份路径
        'path' => ROOT_PATH .'data' . DS,
        //数据库备份卷大小
        'part' => 20971520,
        //数据压缩
        'compress' => true,
        //压缩级别
        'leavel' => 9,
    ],

];