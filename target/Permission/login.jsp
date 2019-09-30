<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>权限管理系统</title>
    <link href="./static/css/base.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/plugins/bootstrap/css/bootstrap.min.css">
    <link href="https://cdn.bootcss.com/bootstrap-validator/0.5.3/css/bootstrapValidator.css" rel="stylesheet">
    <link rel="stylesheet" href="static/plugins/toastr/toastr.min.css">
    <style>
        body {
            background-color: #eeeeee;
        }

        .loginContainer {
            position: absolute;
            left: 50%;
            top: 50%;
            width: 380px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 0 10px #cccccc;
            margin-left: -190px;
            margin-top: -150px;
            box-sizing: border-box;
        }

        .form-horizontal .form-group {
            margin: 30px 30px;
            position: relative;
        }

        .form-control {
            padding-left: 35px;
        }

        h1 {
            margin-top: 40px;
        }
    </style>
</head>
<body>
<div class="loginContainer">
    <h1 class="text-primary text-center">权限管理系统</h1>
    <form class="form-horizontal" id="form">
        <div class="form-group has-feedback">
            <i class="iconfont form-control-feedback" style="left: 4px;"></i>
            <input type="text" class="form-control" value="" name="username" placeholder="请用户名"
                   required>
        </div>
        <div class="form-group has-feedback">
            <i class="iconfont form-control-feedback" style="left: 4px; "></i>
            <input type="password" class="form-control" value="" name="password" placeholder="请输入密码" required>
        </div>
        <div class="form-group">
            <button type="button" id="loginBtn" data-loading-text="Loading..." class="btn btn-primary btn-block">登录
            </button>
        </div>
    </form>
</div>

<script src="static/plugins/easyui/jquery.min.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/static/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap-validator/0.5.3/js/bootstrapValidator.min.js"></script>
<script src="static/plugins/toastr/toastr.min.js"></script>
<script>
    $(function () {

//参数设置，若用默认值可以省略以下面代

        toastr.options = {

            "closeButton": true, //是否显示关闭按钮

            "debug": false, //是否使用debug模式

            "positionClass": "toast-top-center",//弹出窗的位置

            "showDuration": "300",//显示的动画时间

            "hideDuration": "1000",//消失的动画时间

            "timeOut": "3000", //展现时间

            "extendedTimeOut": "1000",//加长展示时间

            "showEasing": "swing",//显示时的动画缓冲方式

            "hideEasing": "linear",//消失时的动画缓冲方式

            "showMethod": "fadeIn",//显示时的动画方式

            "hideMethod": "fadeOut" //消失时的动画方式

        };
        $("#loginBtn").click(function () {
            /*Ajax发送请求, 是没有办法跳转服务当中的请求
            * 只能通过在浏览器当中来跳转
            * */
            var $btn = $(this).button('loading')
            $.post("/login", $("#form").serialize(), function (data) {
                /*把data  json格式的字符串  转成 json 数据*/
                data = $.parseJSON(data);
                if (data.success) {
                    toastr.success("登陆成功")
                    /*跳转到首页*/
                    window.location.href = "/index.jsp"
                } else {
                    toastr.info("很抱歉,登陆失败");
                    $("input").val("");
                }
                $btn.button('reset')
            });
        });
        $("#form").bootstrapValidator({
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                username: {//字段名
                    message: "用户名验证",
                    validators: {
                        notEmpty: {//不能为空
                            message: '请输入用户名'
                        },
                        //长度校验
                        stringLength: {
                            min: 3,
                            max: 11,
                            message: '字符长度必须在4位到10位之间'
                        },
                        regexp: { //正则表达式
                            regexp: /^[a-zA-Z0-9_]+$/,
                            message: '用户名只能包含大写、小写、数字和下划线'
                        },
                        // different: {  //比较
                        //     field: 'username', //需要进行比较的input name值
                        //     message: '密码不能与用户名相同'
                        // },
                        // identical: {  //比较是否相同
                        //     field: 'password',  //需要进行比较的input name值
                        //     message: '两次密码不一致'
                        // },
                        // remote: { // ajax校验，获得一个json数据（{'valid': true or false}）
                        //     url: '',       //验证地址
                        //     message: '用户已存在',   //提示信息
                        //     type: 'POST',          //请求方式
                        //     data: function (validator) {  //自定义提交数据，默认为当前input name值
                        //         return {
                        //             act: 'is_registered',
                        //             username: $("input[name='username']").val()
                        //         };
                        //     },
                        //     callback: {//用于select的校验
                        //         message: '请选择分支机构',
                        //         callback: function (value, validator) {//这里可以自定义value的判断规则
                        //             return value !== 0;
                        //         }
                        //     }
                        // }

                    }
                },
                password: {
                    message: "密码验证",
                    validators: {
                        notEmpty: {
                            message: "请输入密码"
                        },
                        stringLength: {
                            min: 4,
                            max: 10,
                            message: "长度在4到10之间"
                        },
                        regexp: {
                            regexp: /^[a-z0-9A-Z]+$/,
                            message: "密码只能是大写小写和数字"
                        }
                    }
                }
            },
            /**
             * 指定提交的按钮，例如：'.submitBtn' '#submitBtn'
             * 当表单验证不通过时，该按钮为disabled
             */
            submitButtons: 'button[type="button"]',
        })
        //获取当前表单验证状态
        // flag = true/false
        // var flag = $(formName).data(“bootstrapValidator”).isValid();
    });
</script>
</body>
</html>
