<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>买家注册</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
</head>
<body class="login-content" >
<div class="login-bg">
    <div class="login-cont w1200">
        <div class="form-box" style="height: 500px">
            <form class="layui-form" action="/buyerRegister" method="post">
                <legend>买家注册</legend>
                <div class="layui-form-item">
                    <div class="layui-inline name">
                        <div class="layui-input-inline">
                            账号<input type="text" name="b_name" id="b_name" lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <div class="layui-input-inline">
                           密码<input type="password" id="b_password" name="b_password" lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <div class="layui-input-inline">
                            确认<input type="password" id="re_password" name="re_password" lay-verify="repass" placeholder="确认密码" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <div class="layui-input-inline">
                            手机<input type="tel" id="b_phone" name="b_phone" lay-verify="required|phone" placeholder="请输入手机号" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item login-btn">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit="" lay-filter="formdemo">注册</button>
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
        var form = layui.form
            ,layer = layui.layer;


        //监听提交
        form.on('submit(formDemo)', function(data){
            layer.msg(JSON.stringify(data.field));
            return false;
        });
    });
</script>
</body>
</html>
