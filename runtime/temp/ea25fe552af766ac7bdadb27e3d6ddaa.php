<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:61:"G:\EPP4\RCS\public/../application/admin\view\login\index.html";i:1489938453;}*/ ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>追偿案管理系统 - 登录</title>
    <meta name="keywords" content="追偿案管理系统">
    <meta name="description" content="追偿案管理系统">
    <link rel="shortcut icon" href="__PUBLIC__/favicon.ico">
    <link href="__PUBLIC__/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="__PUBLIC__/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="__PUBLIC__/css/animate.min.css" rel="stylesheet">
    <link href="__PUBLIC__/css/style.min.css?v=4.0.0" rel="stylesheet">
    <base target="_blank">
    <script src="__PUBLIC__/js/jquery.min.js?v=2.1.4"></script>
    <script src="__PUBLIC__/js/bootstrap.min.js?v=3.3.5"></script>
    <!--layer-->
    <script src="__PUBLIC__/js/plugins/layer/layer.min.js"></script>
    <!--[if lt IE 8]>
    <meta http-equiv="refresh" content="0;ie.html"/>
    <![endif]-->
    <script>if (window.top !== window.self) {
        window.top.location = window.location;
    }</script>
    <script>
        $(function () {
            //登录系统
            $("#login-btn").on("click", function () {
                var username = $("#username").val();
                var password = $("#password").val();
                if ($.trim(username) == "") {
                    layer.alert("请输入账号", {title: "系统提示"});
                    return false;
                } else if ($.trim(password) == "") {
                    layer.alert("请输入密码", {title: "系统提示"});
                    return false;
                }
                var params = {username: username, password: password};
                $.post("<?php echo url('login/index'); ?>", params, function (data) {
                    if (data.status) {
                        location.href = "<?php echo url('index/index'); ?>";
                    } else {
                        layer.alert(data.msg, {icon: 2, title: "系统提示"});
                    }
                });
            });
            //忘记密码
            $("#forget-btn").on("click", function () {
                layer.prompt({title: "请输入绑定的省版邮箱地址"}, function (value, index, elem) {
                    var content = "我们已经发生一封重置密码的邮件到 <span style='color:red'>" + value + "</span> 邮箱，请按邮件内容操作进行重置";
                    layer.close(index);
                    layer.alert(content, {title: "系统提示"}, function (index) {
                        layer.close(index);
                    });

                });
            })
        });
    </script>
</head>
<body class="gray-bg">
<div class="middle-box text-center loginscreen  animated fadeInDown">
    <div>
        <div>
            <h1 class="logo-name" style="font-size:60px;letter-spacing:1px;">PICC</h1>
        </div>
        <div style="font-size:30px;">追偿案管理系统</div>
        <form class="m-t" role="form" action="" id="login-form">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="工号/用户名/手机" required="" id="username"
                       name="username">
            </div>
            <div class="form-group">
                <input type="password" class="form-control" placeholder="密码" required="" id="password" name="password">
            </div>
            <button type="button" class="btn btn-primary block full-width m-b" id="login-btn">登 录</button>
            <p class="text-muted text-center"><a href="javascript:void(0);" id="forget-btn">
                <small>忘记密码了？</small>
            </a>
            </p>
        </form>
    </div>
</div>
</body>
</html>