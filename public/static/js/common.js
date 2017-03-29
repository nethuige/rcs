//iframe下layer对象
//var layer = parent.layer;

//Jquery扩展

//解决serializeObject radio/checkbox/select未选中时无法解析其属性
$.fn.serializeObject = function () {
    var o = {};
    var a = this.serializeArray();
    $.each(a, function () {
        if (o[this.name] !== undefined) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    var $obj = $('input[type=radio],input[type=checkbox],select', this);
    $.each($obj, function () {
        if (!o.hasOwnProperty(this.name)) {
            o[this.name] = '';
        }
    });
    return o;
};

//json对象直接赋值给form表单
$.fn.setForm = function (jsonValue) {
    var obj = this;
    $.each(jsonValue, function (name, ival) {

        var $oinput = obj.find("input[name='" + name + "']");
        if ($oinput.attr("type") == "radio" || $oinput.attr("type") == "checkbox") {
            $oinput.each(function () {
                if (Object.prototype.toString.apply(ival) == '[object Array]') {//是复选框，并且是数组
                    for (var i = 0; i < ival.length; i++) {
                        if ($(this).val() == ival[i])
                            $(this).attr("checked", "checked");
                    }
                } else {
                    if ($(this).val() == ival)
                        $(this).attr("checked", "checked");
                }
            });
        } else if ($oinput.attr("type") == "textarea") {//多行文本框
            obj.find("[name='" + name + "']").html(ival);
        } else {
            obj.find("[name='" + name + "']").val(ival);
        }
    });
}

//插件配置
var PluginsConfig = {
    //toastr 默认配置
    toastr: function () {
        toastr.options = {
            "closeButton": true,
            "debug": false,
            "progressBar": false,
            "positionClass": "toast-top-right",
            "onclick": null,
            "showDuration": "400",
            "hideDuration": "1000",
            "timeOut": "2000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        }
    },
    init: function () {
        this.toastr();
    }
}
PluginsConfig.init();


//通用方法
var Common = {
    //获取邮箱类型
    GetEmailType: function (email) {
        if (email.substr(-19) == '@fuj.piccnet.com.cn') {
            return 1;
        } else if (email.substr(-12) == '@picc.com.cn') {
            return 2;
        } else {
            return 0;
        }
    },
    //字节格式化
    FormatBytes: function (bytes) {
        if (bytes === 0) return '0 B';
        var k = 1024;
        sizes = ['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];
        i = Math.floor(Math.log(bytes) / Math.log(k));
        return (bytes / Math.pow(k, i)).toPrecision(4) + ' ' + sizes[i];
        //toPrecision(3) 后面保留一位小数，如1.0GB
        //return (bytes / Math.pow(k, i)).toPrecision(3) + ' ' + sizes[i];
    },
    //JSON日期格式化
    JsonDateFormat: function (jsondate, type) {
        if (jsondate == null) {
            return "";
        }
        var date = new Date(parseInt(jsondate.replace("/Date(", "").replace(")/", ""), 10));
        if (type == undefined) {
            date = this.GetDate(date);
        } else if (type == "time") {
            date = this.GetDateTime(date);
        }
        return date;
    },
    //日期格式化
    GetDate: function (date) {
        var year = date.getFullYear();
        var month = date.getMonth() + 1;
        var day = date.getDate();
        return year + "-" + month + "-" + day;
    },
    //时间格式化
    GetDateTime: function (date) {
        var year = date.getFullYear();
        var month = date.getMonth() + 1;
        var day = date.getDate();
        var hh = date.getHours();
        var mm = date.getMinutes();
        var ss = date.getSeconds();
        return year + "-" + month + "-" + day + " " + hh + ":" + mm + ":" + ss;
    },
    //调用一个默认配置的删除确认框
    DelConfirm: function (callback) {
        swal({
            title: "您确定要删除这条信息吗",
            text: "删除后将无法恢复，请谨慎操作！",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            cancelButtonText: "取消",
            confirmButtonText: "确定",
            closeOnConfirm: false
        }, function () {
            callback();
        });
    },
    //调用一个默认配置的禁用确认框
    DisabledConfirm: function (callback) {
        swal({
            title: "您确定禁用吗",
            text: "请谨慎操作！",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            cancelButtonText: "取消",
            confirmButtonText: "确定",
            closeOnConfirm: false
        }, function () {
            callback();
        });
    },

    /*
     * 显示一个模态框
     * size：modal-lg/modal-sm
     */
    ShowModal: function (config) {
        if ($(config.id)[0] != undefined) {
            $(config.id).modal({"show": true});
        } else {
            config.size = config.size == undefined ? "" : config.size;
            config.button = config.button == undefined ? "" : config.button;
            var html = '<div class="modal inmodal fade" id="' + config.id.replace("#", "") + '" tabindex="-1" role="dialog" aria-hidden="true">' +
                '<div class="modal-dialog"' + config.size + '>' +
                '<div class="modal-content">' +
                '<div class="modal-header">' +
                '<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>' +
                '<h4 class="modal-title">' + config.title + '</h4>' +
                '</div>' +
                '<div class="modal-body">' +
                config.content +
                '</div>' +
                '<div class="modal-footer">' +
                config.button +
                '<button type="button" class="btn btn-white" onclick="Common.CloseModal(\'' + config.id + '\',' + config.closecallback + ')">关闭</button>' +
                '</div>' +
                '</div>' +
                '</div>' +
                '</div>';
            $("body").append(html);
            //$(selector).modal({ "remote": remoteUrl });
            $(config.id).modal({"show": true});
        }
    },
    //关闭模态框
    CloseModal: function (id, callback) {
        $(id).modal("hide");
        if (callback != undefined) callback();
    },

    //layer加载层封装
    ShowLoading: function (text) {
        var index = layer.msg(text, {icon: 16, shade: [0.5, '#000'], time: 0});
        return index;
    },

    //渲染页面所有switch
    //selector：switch选择器
    InitAllSwitch: function (selector) {
        var elems = Array.prototype.slice.call(document.querySelectorAll(selector));
        elems.forEach(function (html) {
            var switchery = new Switchery(html);
        });
    },
    //创建单个switch对象
    //selector：switch选择器
    InitSwitch: function (selector) {
        var switchery = new Switchery($(selector)[0]);
        return switchery;
    },
    //改变switch状态 switchery:switchery对象
    SetSwitch: function (switchery, status) {
        if ((status && !switchery.isChecked()) || (!status && switchery.isChecked())) {
            switchery.setPosition(true);
            switchery.handleOnchange(true);
        }
    },
    //使用select2获取远程数据
    //id:select2元素id，url:请求地址，pagesize:每页数量
    GetSelect2Remote: function (config) {
        pagesize = config.pagesize == undefined && 10;
        var select2Obj = $(config.id).select2({
            placeholder: "请选择",
            allowClear: true,
            language: 'zh-CN',
            ajax: {
                url: config.url,
                cache: true,
                delay: 250,
                data: function (params) {
                    return {
                        q: params.term, //搜索词
                        page_limit: pagesize, //每页数
                        page: params.page, //当前页
                    };
                },
                processResults: function (data, params) {
                    params.page = params.page || 1;
                    return {
                        results: data.rows,
                        pagination: {
                            more: (params.page * pagesize) < data.total
                        }
                    };
                },
            },
            escapeMarkup: function (markup) {
                return markup;
            },
            minimumInputLength: 0,
            templateResult: function (repo) {
                if (repo.loading) return repo.text;
                if(config.iconpath==undefined){
                    var markup = '<div><strong>' + repo.text + '</strong></div>' +
                        '<div>' + repo.id + '</div>';
                }else{
                    var markup = '<div>'+
                                    '<img style="margin-right:10px;width:38px;' +
                        'height:38px;border-radius:38px;float:left;border:1px solid #ccc;" ' +
                                            'src="'+config.iconpath+'/'+repo.face+'"/>'+
                                 '</div>'+
                                 '<div style="">'+
                                        '<strong>' + repo.text + '</strong>'+
                                        '<span style="margin-left:3px;line-height:20px;">' +
                                         '<'+repo.id+'></span>'+
                                 '</div>'+
                                 '<div>'+
                                    '<span><i class="fa fa-map-marker"></i> '+repo.comname+'</span>' +
                                 '</div>'+
                                 '<div style="clear:both;width:0;height:0;"></div>';

                    return markup;
                }
                //if (repo.loading) return repo.text;
                //var markup = '<div><strong>' + repo.text + '</strong></div><div>' + repo.id + '</div>';
                //var markup = '<div><strong>' + repo.comname + '</strong></div><div>' + repo.id + '</div>';
                return markup;
            }, //搜索结果显示
            templateSelection: function (repo) {
                //return repo.comname || repo.text;
                if (!repo.id) { return repo.text; }
                if(config.iconpath==undefined) return repo.text;
                return '<span><img src="'+config.iconpath+'/'+repo.face+'" ' +
                    'style="width:20px;height:20px;border-radius:20px;margin-top:-3px;" /> '
                    + repo.text + '</span>';
            } //选择结果显示
        });
        return select2Obj;
    },
    //创建一个高级搜索(popover)
    //tid:作为搜素表单内容的目标元素id选择器,bid:显示高级搜索表单按钮id,sid:提交搜索按钮id
    //cid:关闭搜索按钮id,fid:搜索表单id
    //initok：初始化popver完成回调,success:提交搜索后回调，并注入表单serializeObject对象
    CreateRichSearch: function (config) {
        var content = $(config.tid).html();
        $(config.tid).remove();
        $(config.bid).popover({
            placement: 'right',
            title: "高级搜索__如需模糊查询请使用星(*)号",
            content: content,
            container: "body",
            trigger: 'manual', //手动触发
            html: true, //解析html标签
        });
        //初始化/显示 popover
        $(config.bid).on("click", function () {
            if ($(".popover").html() != undefined) {
                $(".popover").show();
            } else {
                $(config.bid).popover('show');
                config.initok != undefined && config.initok();
            }
        });
        //关闭popover
        $("body").on("click", config.cid, function () {
            $(".popover").hide();
            //$('#rich-search').popover('hide');
        });
        //提交搜索
        $("body").on("click", config.sid, function () {
            var searchParams = $(config.fid).serializeObject();
            $(".popover").hide();
            config.success != undefined && config.success(searchParams);
        })
    }

}