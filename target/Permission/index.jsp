<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>权限管理系统</title>
    <%@include file="static/common/common.jsp" %>
    <style>
        .pull-right>.dropdown-menu {
            left: -171px;
            top: -20px;
            right: 50px;
        }
    </style>
</head>
<body class="easyui-layout">
<%--顶部--%>
<div data-options="region:'north'" style="height:100px; background: #4292b7;color: #ffffff">
    <div class="pull-left text-center" style="width: 300px;height: 100%;border-right: 1px solid #ffffff;">
        <h2 style="margin-top: 30px">权限管理系统</h2>
    </div>
    <div class="pull-right dropdown" style="margin-right: 30px;margin-top: 27px;">
        <div style="width: 40px;height: 40px;" id="dLabel" data-toggle="dropdown">
            <img src="./static/images/user.png" style="width: 40px;height: 40px;border-radius: 20px">
        </div>

        <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
            <li role="presentation"><%--显示当前登录用户名--%>
                <a href="#" role="menuitem" tabindex="-1">用户名 : <shiro:principal property="username"/></a>
            </li>
            <li role="presentation" class="divider"></li>
            <%--取消认证  跳转到 登录页面  在shiro配置文件当中  配置   /logout = logout --%>
            <li role="presentation">
                <a role="menuitem" tabindex="-1" href="${pageContext.request.contextPath}/logout">注销</a>
            </li>
        </ul>

    </div>
</div>
<%--底部--%>
<div data-options="region:'south'">

</div>
<%--左侧菜单--%>
<div data-options="region:'west',split:true" style="width:300px;">
    <div id="aa" class="easyui-accordion" data-options="fit:true">
        <div title="菜单" data-options="iconCls:'icon-save',selected:true" style="overflow:auto;padding:10px;">
            <!--tree-->
            <ul id="tree"></ul>
        </div>
        <div title="公告" data-options="iconCls:'icon-reload'" style="padding:10px;">
        </div>
    </div>
</div>
<%--右侧主区域--%>
<div data-options="region:'center'" style="background:#eee;">
    <!--标签-->
    <div id="tabs" style="overflow: hidden"></div>
</div>
<script type="text/javascript" src="./static/js/index.js"></script>
<script>
    $(function () {
        $('.dropdown-toggle').dropdown()
    })
</script>
</body>
</html>
