<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>卖家登录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
</head>
<body class="login-content" >
<div class="login-bg">
    <div class="login-cont w1200">
        <div class="form-box">
            <form class="layui-form" action="/sellerLogin" method="post">
                <legend>卖家登录</legend>
                <div class="layui-form-item">
                    <div class="layui-inline name">
                        <div class="layui-input-inline">
                            <input type="text" name="s_name" id="s_name" lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <div class="layui-input-inline">
                            <input type="password" id="s_password" name="s_password" lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item login-btn">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit="" lay-filter="formdemo" >登录</button>
                        <a href="/bLogin" class="layui-btn link-btn">我是买家</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script>
    //Demo
    layui.use('form', function(){
        var form = layui.form;

        //监听提交
        form.on('submit(formDemo)', function(data){
            layer.msg(JSON.stringify(data.field));
            return false;
        });
    });
</script>
</body>
</html>
