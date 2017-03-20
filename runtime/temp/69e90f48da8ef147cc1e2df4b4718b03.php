<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:70:"G:\EPP4\RCS\public/../application/admin\view\auth_rule\ruleconfig.html";i:1489852042;}*/ ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>配置规则</title>
    <meta name="keywords" content="配置规则">
    <meta name="description" content="配置规则">
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
    <!--switchery-->
    <link href="__PUBLIC__/css/plugins/switchery/switchery.css" rel="stylesheet">
    <script src="__PUBLIC__/js/plugins/switchery/switchery.js"></script> 
    <!--toastr-->
    <link href="__PUBLIC__/css/plugins/toastr/toastr.min.css" rel="stylesheet">
    <script src="__PUBLIC__/js/plugins/toastr/toastr.min.js"></script>
    <!--jstree-->
    <link href="__PUBLIC__/css/plugins/jsTree/style.min.css" rel="stylesheet">
    <script src="__PUBLIC__/js/plugins/jsTree/jstree.min.js"></script>
    <script src="__PUBLIC__/js/common.js"></script>
    <style type="text/css">
        .jstree-node{
            font-size:14px;
        }
        .jstree-open>.jstree-anchor>.fa-folder:before{content:"\f07c"}.jstree-default .jstree-icon.none{width:0}
    </style>
    <script>
    var ruleJstree; //规则树对象
    var groupJstree; //用户组树对象
    $(function () {
        //初始化规则
        $.post("<?php echo url('auth_rule/getRuleTree'); ?>",{},function(data){
            getRuleTree(data);
        });
        //加载用户组树
        groupJstree = $("#jstree2").jstree({
             "plugins" : [
                "types"
            ],
            'core': {
                "check_callback": true,//在对树进行改变时，check_callback是必须设置为true
                'expand_selected_onload' : true, //选中项蓝色底显示 
                'data':{
                    'url': "<?php echo url('auth_group/getGroupTree'); ?>",
                }
            },
            "types": {
                "default": {
                    "icon": "fa fa-user"
                }
            }
        });
        //用户组选中
        groupJstree.on("activate_node.jstree", function (obj, e) {
            // 获取当前节点
            var currentNode = e.node;
            //console.log(currentNode);
            $("#groupname").text(currentNode.text);
            $.post("<?php echo url('auth_rule/getRuleTree'); ?>",{id:currentNode.id},function(data){
                getRuleTree(data);
            });
        });
        //保存配置
        $("#save-btn").on("click",function(){
            var rules = ruleJstree.jstree("get_selected").join(',');//获取所有选中节点Id
            var groupid = groupJstree.jstree("get_selected");
            if(groupid[0]==undefined){toastr.warning('请选择用户组',"系统提示");return false;}
            var params = {groupid:groupid[0],rules:rules};
            $.post("<?php echo url('auth_rule/ruleConfig'); ?>",params,function(data){
                if(data.status){
                    toastr.success(data.msg,"系统提示");
                }else{
                    toastr.error(data.msg,"系统提示");
                }
            });
        });
        
    });
    //动态加载规则树
    function getRuleTree(data){
        if(ruleJstree)ruleJstree.jstree(true).destroy();
        ruleJstree = $("#jstree1").jstree({
             "plugins" : [
                "checkbox",
                /*"contextmenu",*/
                /*"dnd",*//*拖拽*/
                "massload",/*懒加载*/
                "search",
                /*"sort",
                "state",
                "types",
                "unique",
                "wholerow",
                "changed",
                "conditionalselect"*/
            ],
            'core': {
                "check_callback": true,//在对树进行改变时，check_callback是必须设置为true
                "themes": {
                    "responsive": false
                },
                'data':data,
                'expand_selected_onload' : true, //选中项蓝色底显示 
            },
            'checkbox' : {  
                // 禁用级联选中  
                'three_state' : true,       
                'cascade' : 'down' //有三个选项，up, down, undetermined; 使用前需要先禁用three_state  
            },
            "types": {
                "default": {
                    "icon": "fa fa-file"
                }
            }
        });
        //加载完毕，规则树展开
        ruleJstree.on("loaded.jstree", function(e, data) {  
            ruleJstree.jstree("open_all");  //展开全部  
        });
        return ruleJstree;
    }
</script>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
    <!--面板-->
    <div class="row">
        <div class="col-sm-3">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>用户组 <small class="m-l-sm">用户组列表</small></h5>
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
                    <div id="jstree2">
                       
                    </div>
                </div>
            </div>
        </div>
         <div class="col-sm-9">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5><span id="groupname" style="color:#1AB394;"></span> <small class="m-l-sm">规则列表</small></h5>
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
                    <div class="row">
                        <div class="col-md-12">
                            <!--数据-->
                            <div id="jstree1">
                               
                            </div>
                        </div>
                        <div class="col-md-12" style="border-top:1px dashed #ececec;padding-top:10px;margin-top:10px;text-align: right;">
                            <a class="btn btn-primary create-btn" href="javascript:void(0);" id="save-btn"><i class="fa fa-ok"></i> 保存配置</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="__PUBLIC__/js/content.min.js?v=1.0.0"></script>
</body>
</html>