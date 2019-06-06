<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>订单查询</title>
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
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="detail">付款</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="update">确认支付</a>
</script>



<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>
    layui.use('table', function(){
        var table = layui.table,
            form = layui.form;

        table.render({
            elem: '#test'
            ,url:'/buyer/selectOrder'
            ,toolbar: '#toolbarDemo'
            ,cellMinWidth: 80
            ,cols: [[
                {type: 'checkbox', fixed: 'left'}
                ,{field:'o_id', title:'订单ID', width:120, fixed: 'left', unresize: true, sort: true}
                ,{field:'s_name', title:'卖家', templet: '#usernameTpl'}
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
            if(obj.event === 'detail'){
                layer.confirm('是否进行付款', function(){
                    //Qrcode--二维码
                    var a = '/buyer/disQr?s_name='+data.s_name;
                    layer.open({
                        type: 2,
                        title:"请扫码支付",
                        area:['400px','630px'],
                        content: a //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
                    });
                });
            } else if(obj.event === 'update'){
                layer.confirm('是否确认支付', function(index){
                    $.ajax({
                        url:"/buyer/updateState",
                        data:{"o_id":data.o_id},
                        type:"post",
                        dataType:"text",
                        success:function (data) {
                            if(data == "ok"){
                                alert("确认成功");
                                window.location.reload();
                            }else {
                                alert("确认失败");
                            }
                        }
                    });
                });
            }
        });
    });
</script>

</body>
</html>