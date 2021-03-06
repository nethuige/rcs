<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:60:"G:\EPP4\RCS\public/../application/admin\view\user\index.html";i:1489737796;}*/ ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户信息</title>
    <meta name="keywords" content="用户信息">
    <meta name="description" content="用户信息">
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
        initTable();
        //高级搜索
        Common.CreateRichSearch({
            tid:"#rich-search-popover",
            bid:"#rich-search-btn",
            sid:"#rich-search-submit-btn",
            cid:"#rich-search-hide-btn",
            fid:"#rich-search-form",
            initok:function(){
               Common.GetComList({"url":"<?php echo url('company/getComList'); ?>","id":".comcode","pageisze":10}); //取归属公司 
            },
            success:function(searchParams){
                //重新渲染table，避免在指定分页下搜索时页码不变1的问题
                initTable(function(params){
                    $.extend(params,searchParams);
                    return params;
                });
            }
        });
        //删除
        $("body").on("click",".del-btn",function(){
            var id = $(this).data("id");
            var index = layer.confirm('确定要删除吗？', {
                  title:'系统提示',
                  btn: ['确定','取消']
                }, function(){
                    var params = {id:id};
                    $.post("<?php echo url('user/delete'); ?>",params,function(data){
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
                        $.post("<?php echo url('user/delete'); ?>",params,function(data){
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
    });
    //初始化表格
    function initTable(setParams) {
        $table = $('#result-table');
        $table.bootstrapTable('destroy'); //销毁旧表格
        $table.bootstrapTable({
            url: "<?php echo url('user/index'); ?>",
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
                $.each(row, function (key, value) {
                    if (value != undefined) {
                        var lablel = "";
                        for (var i in columnsObj) {
                            if (key == columnsObj[i].field) {
                                lablel = columnsObj[i].title; //显示中文标签
                                break;
                            }
                        }
                        if(lablel=="头像"){
                            html.push('<p><b>' + lablel + ':</b><img style="width:32px;height:32px;" src="__UPLOAD__/'+value+'"></p>');
                        }else{
                            html.push('<p><b>' + lablel + ':</b> ' + value + '</p>');
                        }
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
                field: 'face',
                title: '头像',
                align: 'center',
                formatter:function(value,row,index){
                    return '<img style="width:32px;height:32px;" src="__UPLOAD__/'+value+'">';
                }
            }, {
                field: 'username',
                title: '用户名',
                align: 'center',
            }, {
                field: 'usercode',
                title: '工号',
                align: 'center',
            }, {
                field: 'comname',
                title: '归属公司',
                align: 'center',
                visible:false,
            }, {
                field: 'comcode',
                title: '归属代码',
                align: 'center',
            }, {
                field: 'mobile',
                title: '手机',
                align: 'center',
            }, {
                field: 'tel',
                title: '座机',
                align: 'center',
            }, {
                field: 'email',
                title: '邮箱',
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
                field: 'last_login_time',
                title: '最后一次登录时间',
                align: 'center',
                formatter:function(value,row,index){
                    return value==0 ?  '': value;
                }
            }, {
                field: 'last_login_ip',
                title: '最后一次登录Ip',
                align: 'center',
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
                    return '<div class="btn-group"><a href="<?php echo url('user/edit'); ?>?id='+row.id+'" class="btn btn-outline btn-xs btn-default"><i class="fa fa-edit"></i> 编辑</a> <a href="javascript:void(0);" class="btn btn-outline btn-xs btn-default del-btn" data-id="'+row.id+'"><i class="fa fa-times"></i> 删除</a></div>';
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
                    <h5>用户信息 <small class="m-l-sm">用户列表</small></h5>
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
                                <a class="btn btn-primary" href="<?php echo url('user/create'); ?>"><i class="fa fa-plus"></i> 添加</a>
                                <a class="btn btn-danger" id="del-btn" href="javascript:void(0)"><i class="fa fa-times"></i> 批量删除</a>
                                <a class="btn btn-warning" id="rich-search-btn" href="javascript:void(0)"><i class="fa fa-search"></i> 高级搜索</a>
                                            
                            </div>
                            <table id="result-table"></table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--高级搜索-->
<div id="rich-search-popover" style="display: none;">
    <form role="form" id="rich-search-form" class="form-inline">
        <div class="col-md-12">
            <div class="form-group">
                <label>用户名：</label>
                <input type="text" id="username" name="username" placeholder="" class="form-control">
            </div>

            <div class="form-group">
                <label>工号：</label>
                <input type="text" id="usercode" name="usercode" placeholder="" class="form-control">
            </div>
        </div>
        <div class="col-md-12" style="margin-top:10px;">
            <div class="form-group">
                <label>手机：</label>
                <input type="text" id="mobile" name="mobile" placeholder="" class="form-control">
            </div>
            <div class="form-group">
                <label>电话：</label>
                <input type="text" id="tel" name="tel" placeholder="" class="form-control">
            </div>
        </div>
        <div class="col-md-12" style="margin-top:10px;">
            <div class="form-group" style="width:100%">
                <label>归属公司：</label>
                <select class="form-control comcode" name="comcode" style="width:100%;"></select>
            </div>
        </div>
        <div class="col-md-12" style="margin-top:10px;">
            <div class="form-group">
                <label>邮箱：</label>
                <input type="text" id="email" name="email" placeholder="" class="form-control">
            </div>
        </div>
        <div class="col-md-12" style="margin-top:10px;">
            <div class="form-group">
                <div class="col-md-12">
                    <a href="javascript:void(0);" class="btn btn-primary" id="rich-search-submit-btn" type="button">搜索</a>
                    <button style="outline: none;" type="reset" class="btn btn-danger" type="button">重置</button>
                    <a href="javascript:void(0);" class="btn btn-white" id="rich-search-hide-btn" type="button">关闭</a>
                </div>
            </div>
        </div>
    </form>
</div>
<script src="__PUBLIC__/js/content.min.js?v=1.0.0"></script>
</body>
</html>