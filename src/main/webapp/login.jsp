<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>权限管理系统</title>
    <link href="./static/css/base.css" rel="stylesheet">
    <link rel="stylesheet" href="static/plugins/bootstrap/bootstrap.min.css">
    <style>
        body{
            background-color: #eeeeee;
        }
        .loginContainer{
            position: absolute;
            left: 50%;
            top: 50%;
            width: 380px;
            height: 300px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 0 10px #cccccc;
            margin-left: -190px;
            margin-top: -150px;
            box-sizing: border-box;
        }
        .form-horizontal .form-group{
            margin: 30px 30px;
        }
        .form-control-feedback{
            left: 3px;
        }
        .form-control{
            padding-left: 35px;
        }
    </style>
</head>
<body>
<div class="loginContainer">
    <h1 class="text-primary text-center">权限管理系统</h1>
    <form class="form-horizontal" id="form">
        <div class="form-group has-feedback">
            <i class="iconfont form-control-feedback"></i>
            <input type="text" class="form-control" value="swp" name="username" placeholder="请用户名">
        </div>
        <div class="form-group has-feedback">
            <i class="iconfont form-control-feedback"></i>
            <input type="password" class="form-control" value="1234" name="password"  placeholder="请输入密码">
        </div>
        <div class="form-group">
            <button type="button" id="loginBtn" class="btn btn-primary btn-block">登录</button>
        </div>
    </form>
</div>
<script src="static/plugins/easyui/jquery.min.js"></script>
<script src="static/plugins/bootstrap/bootstrap.min.js"></script>
<script>
    $(function () {
        $("#loginBtn").click(function () {
            /*Ajax发送请求, 是没有办法跳转服务当中的请求
            * 只能通过在浏览器当中来跳转
            * */
            $.post("/login",$("#form").serialize(),function (data) {
                /*把data  json格式的字符串  转成 json 数据*/
                data = $.parseJSON(data);
                if (data.success){
                    /*跳转到首页*/
                    window.location.href = "/index.jsp"
                } else {
                    alert(data.msg);
                }
            });
        });
    });
</script>
</body>
</html>
