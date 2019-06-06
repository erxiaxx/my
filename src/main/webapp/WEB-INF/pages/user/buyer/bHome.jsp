<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>买家主页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo"></div>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">${b_name}</a>
            </li>
            <li class="layui-nav-item">
                <a href="/bExit">退出登录</a>
            </li>
            <li class="layui-nav-item">
                <a href="/buyer/toMall">返回商城</a>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item"><a href="/buyer/queryOrder" target="buyer-content">查询订单</a></li>
                <li class="layui-nav-item"><a href="/buyer/dealHistory" target="buyer-content">交易记录</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <iframe src="/buyer/welcome" width="100%" height="100%" frameborder="no" border="0" scrolling="auto" name="buyer-content"></iframe>
    </div>

    <div class="layui-footer" style="text-align: center">
        <!-- 底部固定区域 -->
        毕设，非商业用途，基于layui框架 &copy; layui.com erxiaxx.top
    </div>
</div>
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
</script>
</body>
</html>
