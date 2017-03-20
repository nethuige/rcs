<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:61:"G:\EPP4\RCS\public/../application/admin\view\index\index.html";i:1489940782;}*/ ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>追偿案管理系统</title>
    <meta name="keywords" content="追偿案管理系统">
    <meta name="description" content="追偿案管理系统">
    <!--[if lt IE 8]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
    <link rel="shortcut icon" href="favicon.ico">
    <link href="__PUBLIC__/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="__PUBLIC__/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="__PUBLIC__/css/animate.min.css" rel="stylesheet">
    <link href="__PUBLIC__/css/style.min.css?v=4.0.0" rel="stylesheet">
</head>
<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
    <div id="wrapper">
        <!--左侧导航开始-->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close"><i class="fa fa-times-circle"></i>
            </div>
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element">
                            <span><img alt="image" class="img-circle" style="width:64px;height: 64px;"
                                       src="__UPLOAD__/<?php echo $userinfo['face']; ?>"/></span>
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                               <span class="block m-t-xs"><strong class="font-bold">nethuige</strong></span>
                                <span class="text-muted text-xs block"><?php echo $userinfo['group']['title']; ?><b
                                        class="caret"></b></span>
                                </span>
                            </a>
                            <ul class="dropdown-menu animated fadeInRight m-t-xs">
                                 <li><a class="J_menuItem" href="contacts.html">修改密码</a>
                                </li>
                                <li class="divider"></li>
                                <li><a href="login.html">安全退出</a>
                                </li>
                            </ul>
                        </div>
                        <div class="logo-element">PICC
                        </div>
                    </li>
                    <li>
                        <a class="J_menuItem" href="mytask.html">
                            <i class="fa fa-list"></i>
                            <span class="nav-label">我的待办任务</span>
                        </a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-flag"></i> <span class="nav-label">理赔阶段追偿</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="createOrder.html">案件维护</a>
                            </li>
                            <li><a class="J_menuItem" href="declareOrder.html">案件查询</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-magic"></i> <span class="nav-label">赔付后追偿管理</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li> <a href="#"> <span class="nav-label">赔付后追偿管理</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="createOrder.html">案件维护</a>
                            </li>
                            <li><a class="J_menuItem" href="declareOrder.html">案件查询</a>
                            </li>
                        </ul>
                            </li>
                            <li><a class="J_menuItem" href="declareOrder.html">案件查询</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-columns"></i> <span class="nav-label">查询统计</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="createOrder.html">交强险追偿案件统计表</a>
                            </li>
                            <li><a class="J_menuItem" href="declareOrder.html">商业车险追偿案件统计表</a>
                            </li>
                             <li><a class="J_menuItem" href="declareOrder.html">货运险追偿案件统计表</a>
                            </li>
                             <li><a class="J_menuItem" href="declareOrder.html">非车险（非货运）追偿案件统计表</a>
                            </li>
                        </ul>
                    </li>

                    <?php echo $menu; ?>
                </ul>
            </div>
        </nav>
        <!--左侧导航结束-->
        <!--右侧部分开始-->
        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row border-bottom">
                <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                    <div class="navbar-header"><a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
                        <form role="search" class="navbar-form-custom" method="post" action="search_results.html">
                            <div class="form-group">
                                <input type="text" placeholder="请输入您需要查找的内容 …" class="form-control" name="top-search" id="top-search">
                            </div>
                        </form>
                    </div>
                    <ul class="nav navbar-top-links navbar-right">
                        <li class="hidden-xs">
                            <a class="" href="#" aria-expanded="false">
                                信息技术部
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="row content-tabs">
                <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
                </button>
                <nav class="page-tabs J_menuTabs">
                    <div class="page-tabs-content">
                        <a href="javascript:;" class="active J_menuTab" data-id="<?php echo url('index/home'); ?>">系统主页</a>
                    </div>
                </nav>
                <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i>
                </button>
                <div class="btn-group roll-nav roll-right">
                    <button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作<span class="caret"></span>

                    </button>
                    <ul role="menu" class="dropdown-menu dropdown-menu-right">
                        <li class="J_tabShowActive"><a>定位当前选项卡</a>
                        </li>
                        <li class="divider"></li>
                        <li class="J_tabCloseAll"><a>关闭全部选项卡</a>
                        </li>
                        <li class="J_tabCloseOther"><a>关闭其他选项卡</a>
                        </li>
                    </ul>
                </div>
                <a href="login.html" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i> 退出</a>
            </div>
            <div class="row J_mainContent" id="content-main">
                <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="<?php echo url('index/home'); ?>"
                        frameborder="0" data-id="<?php echo url('index/home'); ?>" seamless></iframe>
            </div>
            <div class="footer">
                <div class="pull-right">&copy; 2017 <a href="#" target="_blank">泉州PICC信息技术部 版权所有</a>
                </div>
            </div>
        </div>
        <!--右侧边栏结束-->
    </div>
    <script src="__PUBLIC__/js/jquery.min.js?v=2.1.4"></script>
    <script src="__PUBLIC__/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="__PUBLIC__/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="__PUBLIC__/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="__PUBLIC__/js/plugins/layer/layer.min.js"></script>
    <script src="__PUBLIC__/js/hplus.min.js?v=4.0.0"></script>
    <script src="__PUBLIC__/js/contabs.min.js"></script>
    <script src="__PUBLIC__/js/plugins/pace/pace.min.js"></script>
</body>
</html>