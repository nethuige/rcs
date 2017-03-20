<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:66:"G:\EPP4\RCS\public/../application/admin\view\auth_group\index.html";i:1489743829;}*/ ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户组管理</title>
    <meta name="keywords" content="用户组管理">
    <meta name="description" content="用户组管理">
	<link rel="shortcut icon" href="favicon.ico">
    <link href="__PUBLIC__/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="__PUBLIC__/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="__PUBLIC__/css/animate.min.css" rel="stylesheet">
    <link href="__PUBLIC__/css/style.min.css?v=4.0.0" rel="stylesheet">
    <script src="__PUBLIC__/js/jquery.min.js?v=2.1.4"></script>
    <script src="__PUBLIC__//js/bootstrap.min.js?v=3.3.5"></script>
    <!-- Morris -->
    <link href="__PUBLIC__/css/plugins/morris/morris-0.4.3.min.css" rel="stylesheet">
    <!--bootstrap table-->
    <link href="__PUBLIC__/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <!--重写bt,实现按列搜索，以及搜索模式-->
    <script src="__PUBLIC__/js/bootstrap-table.js"></script> 
    <!--<script src="js/plugins/bootstrap-table/bootstrap-table.min.js"></script>-->
    <script src="__PUBLIC__/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
    <script src="__PUBLIC__/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
    <!--layer-->
    <script src="__PUBLIC__/js/plugins/layer/layer.min.js"></script>
     <!--select2-->
    <link href="__PUBLIC__/css/plugins/select2/select2.min.css" rel="stylesheet">
    <script src="__PUBLIC__/js/plugins/select2/select2.full.min.js"></script>
    <script src="__PUBLIC__/js/plugins/select2/i18n/zh-CN.js"></script>
     <!--switchery-->
    <link href="__PUBLIC__/css/plugins/switchery/switchery.css" rel="stylesheet">
    <script src="__PUBLIC__/js/plugins/switchery/switchery.js"></script> 
    <!--toastr-->
    <link href="__PUBLIC__/css/plugins/toastr/toastr.min.css" rel="stylesheet">
    <script src="__PUBLIC__/js/plugins/toastr/toastr.min.js"></script>
    <!--common-->
	<script src="__PUBLIC__/js/common.js"></script>
    <style type="text/css">
    </style>
	<script>
    var $table;
    $(function () {
        var statusSwitch = Common.InitSwitch("#status"); //是否启用switch
        initTable();
        //删除
        $("body").on("click",".del-btn",function(){
            var id = $(this).data("id");
            var index = layer.confirm('确定要删除吗？', {
                  title:'系统提示',
                  btn: ['确定','取消']
                }, function(){
                    var params = {id:id};
                    $.post("<?php echo url('auth_group/delete'); ?>",params,function(data){
                        layer.close(index);
                        if(data.status){
                            toastr.success(data.msg,"系统提示");
                            $table.bootstrapTable('refresh', { silent: true });
                        }else{
                            toastr.error(data.msg,"系统提示");
                        }
                    });
                }
            );
        });
        //批量删除
        $("#del-btn").on("click",function(){
            var rows = $table.bootstrapTable('getSelections');
            if (rows.length == 0) {
                toastr.warning("请选择要操作的行","系统提示");
            } else {
                var index = layer.confirm('确定要删除吗？', {
                      title:'系统提示',
                      btn: ['确定','取消']
                    }, function(){
                        var deleteId = [];
                        for (var i in rows) {
                            deleteId.push(rows[i].id);
                        }
                        var params = {id: deleteId.join(',') };
                        $.post("<?php echo url('auth_group/delete'); ?>",params,function(data){
                            layer.close(index);
                            if(data.status){
                                toastr.success(data.msg,"系统提示");
                                $table.bootstrapTable('refresh', { silent: true });
                            }else{
                                toastr.error(data.msg,"系统提示");
                            }
                        });
                    }
                );
            }
        });
        //新建用户组
        $("body").on("click",".create-btn",function(){
            document.getElementById("form1").reset();//重置表单
            Common.SetSwitch(statusSwitch,true); //默认启用
            var that = $(this);
            var layerIndex = layer.open({
              type: 1,
              title:'新建用户组',
              skin: 'layui-layer', //加上边框
              area: ['450px'], //宽,高自适应
              maxmin: true,
              closeBtn:1,
              content: $("#auth_group-form"),
              btn: ['提交'],
              yes: function(index, layero){
                    if($("#form1 #title").val()==""){
                        toastr.warning("请填写用户组名称","系统提示");
                        return false;
                    }
                    var params = $("#form1").serializeObject();
                    params.status = params.status==""?0:1;
                    $.post("<?php echo url('auth_group/create'); ?>",params,function(data){
                        if(data.status){
                            layer.close(layerIndex);
                            toastr.success(data.msg,"系统提示");
                            $table.bootstrapTable('refresh', { silent: true });
                        }else{
                            toastr.error(data.msg,"系统提示");
                        }
                    }); 
                }
            }); 
        });
        //编辑用户组
        $("body").on("click",".edit-btn",function(){
            var id = $(this).data("id");
            var params = {id:id}
            $.get("<?php echo url('auth_group/edit'); ?>",params,function(data){
                $("#form1").setForm(data); //扩展方法,一键设置表单值
                //switch插件另外设置
                data.status=='启用' ? Common.SetSwitch(statusSwitch,true) :  Common.SetSwitch(statusSwitch,false);
            }); 
            var layerIndex = layer.open({
              type: 1,
              title:'编辑用户组',
              skin: 'layui-layer', //加上边框
              area: ['450px'], //宽,高自适应
              maxmin: true,
              closeBtn:1,
              content: $("#auth_group-form"),
              btn: ['提交'],
              yes: function(index, layero){
                    if($("#form1 #title").val()==""){
                        toastr.warning("请填写用户组名称","系统提示");
                        return false;
                    }
                    var params = $("#form1").serializeObject();
                    params.id = id;
                    params.status = params.status==""?0:1;
                    $.post("<?php echo url('auth_group/edit'); ?>",params,function(data){
                        if(data.status){
                            layer.close(layerIndex);
                            toastr.success(data.msg,"系统提示");
                            $table.bootstrapTable('refresh', { silent: true });
                        }else{
                            toastr.error(data.msg,"系统提示");
                        }
                    }); 
                }
            }); 
        });
        //配置规则
        $("body").on("click",".rule-config-btn",function() {
           location.href="<?php echo url('auth_group/ruleConfig'); ?>"; 
        });
    });
    //初始化表格
    function initTable(setParams) {
        $table = $('#result-table');
        $table.bootstrapTable('destroy'); //销毁旧表格
        $table.bootstrapTable({
            url: "<?php echo url('auth_group/index'); ?>",
            method: 'post',
            toolbar: '#toolbar',    //工具按钮用哪个容器
            iconSize: "outline",
            striped: false,      //是否显示行间隔色
            cache: false,      //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,     //是否显示分页（*）
            sidePagination: "server",   //分页方式：client客户端分页，server服务端分页（*）
            pageNumber: 1,  //初始化加载第一页，默认第一页
            pageSize: 10,      //每页的记录行数（*）
            pageList: [10, 30, 50, 100],  //可供选择的每页的行数（*）
            sortable: true, //启用排序
            sortName: "id", //初始排序列名
            sortOrder: "desc",     //初始排序方式
            queryParamsType: 'search', //默认值为 'limit' ,在默认情况下 传给服务端的参数为：offset,limit,sort
            // 设置为 ''  在这种情况下传给服务器的参数为：pageSize,pageNumber
            //自定义传参
            queryParams:function(params){
                if(setParams==undefined) return params;
                return setParams(params);
            },
            /*queryParams: function (params) {
                return {
                    pageSize: params.pageSize,
                    pageNumber: params.pageNumber,
                    sortOrder: params.sortOrder,
                    sortName: params.sortName,
                    searchText: params.searchText,
					scolumnText:params.scolumnText,
					searchModel:params.searchModel,
                };
            },*///前端调用服务时，会默认传递上边提到的参数，如果需要添加自定义参数，可以自定义一个函数返回请求参数
            search: true,      //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
            strictSearch: true, //严格搜索模式
            searchOnEnterKey: true, //将执行的搜索方法,直到回车键被按下。
            showRefresh: true,     //是否显示刷新按钮
            showColumns: true,     //是否显自定义显示列
            minimumCountColumns: 2,    //最少允许的列数
            clickToSelect: false,    //是否启用点击选中行
            showToggle: true, //是否显示切换表格显示按钮
            showExport: true, //是否显示导出数据显示按钮
            detailView: true, //是否启用显示详细视图
            detailFormatter: function (index, row) {
                var html = [];
                var columnsObj = this.columns[0];
                console.log(row);
                $.each(row, function (key, value) {
                    if (value != undefined) {
                        var lablel = "";
                        for (var i in columnsObj) {
                            if (key == columnsObj[i].field) {
                                lablel = columnsObj[i].title; //显示中文标签
                                break;
                            }
                        }
                        html.push('<p><b>' + lablel + ':</b> ' + value + '</p>');
                    }
                });
                return html.join('');
            },
            idField: 'id',
            columns: [{
                checkbox: true,
            }, {
                field: 'id',
                title: 'id',
                align: 'center',
                sortable: true,
                visible:false,
            }, {
                field: 'title',
                title: '用户组名称',
                align: 'center',
            }, {
                field: 'description',
                title: '用户组描述',
                align: 'center',
            }, {
                field: 'rules',
                title: '规则',
                align: 'center',
                visible:false,
            }, {
                field: 'status',
                title: '状态',
                align: 'center',
                formatter:function(value,row,index){
                    return value=='禁用'?'<span class="label">禁用</span>':'<span class="label label-primary">启用</span>'
                }
            }, {
                field: 'create_time',
                title: '创建时间',
                align: 'center',
                visible:false,
            }, {
                field: 'update_time',
                title: '更新时间',
                align: 'center',
                visible:false,
            }, {
                field: '',
                title: '操作',
                align: 'center',
                formatter:function(value,row,index){
                    return '<div class="btn-group"><a href="javascript:void(0);" data-id="'+row.id+'" class="btn btn-outline btn-xs btn-default edit-btn"><i class="fa fa-edit"></i> 编辑</a> <a href="javascript:void(0);" class="btn btn-outline btn-xs btn-default del-btn" data-id="'+row.id+'"><i class="fa fa-times"></i> 删除</a></div>';
                }
            }
            ],
            formatSearch: function () {
                return "快速搜索";
            },
        });
    }
    
</script>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
    <!--面板-->
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>用户组管理 <small class="m-l-sm">用户组列表</small></h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content">
                    <!--数据-->
                    <div class="row">
                        <div class="col-sm-12">
                            <div id="toolbar">
                                <a class="btn btn-primary create-btn" href="javascript:void(0);"><i class="fa fa-plus"></i> 添加</a>
                                <a class="btn btn-danger" id="del-btn" href="javascript:void(0)"><i class="fa fa-times"></i> 批量删除</a>  
                            </div>
                            <table id="result-table"></table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--新建/编辑用户组-->
<div id="auth_group-form" style="display: none;">
    <div style="width:380px;margin:15px auto;">
        <form class="form-horizontal" id="form1">
            <div class="form-group">
                <label for="title" class="col-sm-4 control-label">用户组名称：</label>
                <div class="col-sm-8">
                  <input type="text" class="form-control" name="title" id="title" placeholder="">
                </div>
            </div>
            <div class="form-group">
                <label for="description" class="col-sm-4 control-label">用户组描述：</label>
                <div class="col-sm-8">
                  <input type="text" class="form-control" name="description" id="description" placeholder="">
                </div>
            </div>
            <div class="form-group">
                <label for="status" class="col-sm-4 control-label">状态：</label>
                <div class="col-sm-8">
                  <input type="checkbox" id="status" name="status" class="js-switch" />
                </div>
            </div>
        </form>
    </div>
</div>
<script src="__PUBLIC__/js/content.min.js?v=1.0.0"></script>
</body>
</html>