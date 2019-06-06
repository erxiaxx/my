<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"  media="all">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>

    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>


<table class="layui-hide" id="test" lay-filter="test"></table>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="detail">查看</a>
</script>



<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>
    layui.use('table', function(){
        var table = layui.table,
            form = layui.form;

        table.render({
            elem: '#test'
            ,url:'/seller/selectOrder'
            ,toolbar: '#toolbarDemo'
            ,cellMinWidth: 80
            ,cols: [[
                {type: 'checkbox', fixed: 'left'}
                ,{field:'o_id', title:'订单ID', width:120, fixed: 'left', unresize: true, sort: true}
                ,{field:'b_name', title:'买家', templet: '#usernameTpl'}
                ,{field:'o_price', title:'订单成交价格'}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
            ]]
            ,page: false
            ,done:function () {
                $("[data-field = 'o_state']").css("display","none")
            }
        });



        //监听行工具事件
        table.on('tool(test)', function(obj){
            var data = obj.data;
            //console.log(obj)
            if(obj.event === 'detail'){
                layer.confirm('查看订单详细信息', function(index){

                });
            } else if(obj.event === 'edit'){
                layer.prompt({
                    formType: 2
                    ,value: data.email
                }, function(value, index){
                    obj.update({
                        email: value
                    });
                    layer.close(index);
                });
            }
        });
    });
</script>

</body>
</html>