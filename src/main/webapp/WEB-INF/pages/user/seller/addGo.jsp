<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"  media="all">
</head>
<body>
<form class="layui-form layui-form-pane">
    <div class="layui-form-item">
        <label class="layui-form-label">商品名称</label>
        <div class="layui-input-inline">
            <input type="text" name="go_name" lay-verify="required" placeholder="请输入商品名称" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">商品价格</label>
        <div class="layui-input-inline">
            <input type="text" name="go_price" lay-verify="required" placeholder="请输入商品价格" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">选择游戏</label>
        <div class="layui-input-block">
            <select name="ga_name" id="ga_id" lay-filter="game">
                <option value="1" selected="">游戏A</option>
                <option value="2">游戏B</option>
                <option value="3">游戏C</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item" style="text-align: center">
        <input type="button" class="layui-btn layui-btn-normal" lay-submit lay-filter="submit" value="提交">
        <input type="reset" class="layui-btn layui-btn-normal" value="重置">
    </div>
</form>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script type="text/javascript">
    layui.use('form', function(){
        var form = layui.form;

        form.on('submit(submit)', function(data){
            //console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
            var goObject = data.field;
            goObject.ga_id = $("#ga_id").find("option:selected").val();
            var goods = JSON.stringify(goObject);
            $.ajax({
                url:"/seller/addGoods",
                contentType:"application/json;charset=UTF-8",
                data:goods,
                type:"post",
                dataType:"text",
                success:function (data) {
                    if(data == "ok"){
                        alert("添加成功");
                        window.close();
                    }else {
                        alert("添加失败");
                    }
                }
            });

            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });
    });
</script>
</body>
</html>
