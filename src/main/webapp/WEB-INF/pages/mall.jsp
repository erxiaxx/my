<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>商城</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
</head>
<body id="list-cont">
<c:if test="${empty b_name}">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#log").hide();
        });
    </script>
</c:if>
<c:if test="${!empty b_name}">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#nolog").hide();
        });
        var error = '${error}';
        if(error != '')
            alert(error);

        var success = '${success}';
        if(success != '')
            alert(success);
    </script>
</c:if>
    <div class="site-nav-bg">
        <div class="site-nav w1200">
            <p class="sn-back-home">
                <i class="layui-icon layui-icon-home"></i>
                <a href="/hello" target="mall-content">首页</a>
            </p>
            <div class="sn-quick-menu">
                <div class="login" id="nolog"><a href="/register">注册</a>   丨   <a href="/bLogin">登录</a></div>
                <div class="login" id="log"><a href="/buyer/bHome">${b_name}</a>   丨   <a href="/bExit">退出</a></div>
                <div class="sp-cart"><a href="/shopCar" target="mall-content">购物车</a></div>
                <div class=""></div>
            </div>
        </div>
    </div>


    <div class="header">
        <div class="headerLayout w1200">
            <div class="headerCon">
                <h1 class="mallLogo">
                    <img src="${pageContext.request.contextPath}/img/logo.png">
                </h1>
                <div class="mallSearch">
                    <form action="/commodity" class="layui-form" target="mall-content">
                        <input type="text" name="goods" id="search_goods" required lay-verify="required" autocomplete="off" class="layui-input" placeholder="请输入需要的商品">
                        <button class="layui-btn">
                            <i class="layui-icon layui-icon-search"></i>
                        </button>
                        <input type="hidden" name="" value="">
                    </form>
                </div>
            </div>
        </div>
    </div>


    <div class="content">
        <div class="main-nav">
            <div class="inner-cont0">
                <div class="inner-cont1 w1200">
                    <div class="inner-cont2">
                        <a href="/commodity" target="mall-content">所有商品</a>
                        <a href="/about" target="mall-content">关于我们</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="iframe-con">
            <iframe src="/hello" width="100%" height="780px" frameborder="no" border="0" scrolling="auto" name="mall-content"></iframe>
        </div>
    </div>

    <div class="footer">
        毕设，非商业用途，基于layui框架 &copy; layui.com erxiaxx.top
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
