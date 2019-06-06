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

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="addGoods">新增商品</button>
        <button class="layui-btn layui-btn-sm" lay-event="refresh">刷新</button>

    </div>
</script>

<script type="text/html" id="switchTpl">
    <!-- 这里的 checked 的状态只是演示 -->
    <input type="checkbox" name="go_state" value="{{d.go_id}}" lay-skin="switch" lay-text="销售|打烊" lay-filter="switchDemo" {{ d.go_state == 1? 'checked' : '' }}>
</script>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>


<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>
    layui.use('table', function(){
        var table = layui.table,
            form = layui.form;

        table.render({
            elem: '#test'
            ,url:'/seller/selectGoods'
            ,toolbar: '#toolbarDemo'
            ,cellMinWidth: 80
            ,cols: [[
                {field:'go_id', title:'商品ID', width:80, fixed: 'left', unresize: true, sort: true}
                ,{field:'ga_name', title:'游戏名', width:150, unresize: true}
                ,{field:'go_name', title:'商品名', templet: '#usernameTpl'}
                ,{field:'go_price', title:'商品价格'}
                ,{field:'go_state', title:'销售状态', width:130, templet: '#switchTpl', unresize: true}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:230}
            ]]
            ,page: false
            ,done:function () {
                $("[data-field = 'go_id']").css("display","none")
            }
        });

        //头工具栏事件
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            switch(obj.event){
                case 'addGoods':
                    // var data = checkStatus.data;
                    // layer.alert(JSON.stringify(data));
                    layer.open({
                        type: 2,
                        title:"新增商品",
                        area:['300px','350px'],
                        content: '/seller/addGo' //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
                    });
                    break;
                case 'refresh':
                    window.location.reload();
                    break;
            };
        });

        //监听行工具事件
        table.on('tool(test)', function(obj){
            var data = obj.data;
            //console.log(obj)
            if(obj.event === 'del'){
                layer.confirm('确认该商品删除吗？', function(index){
                    $.ajax({
                        url:"/seller/deleteGoodsById",
                        data:{"go_id":data.go_id},
                        type:"post",
                        dataType:"text",
                        success:function (data) {
                            if(data == "ok"){
                                alert("删除成功");
                                window.location.reload();
                            }else {
                                alert("删除失败");
                            }
                        }
                    });
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

        form.on('switch(switchDemo)', function(data){
            //console.log(data.elem.checked); //开关是否开启，true或者false
            //console.log(data.value); //开关value值，也可以通过data.elem.value得到

            updataState(data.value,data.elem.checked)
        });
    });

    function updataState(go_id,flag) {
        $.ajax({
            url:"/seller/updateState",
            data:{"go_id":go_id,"flag":flag},
            type:"post",
            dataType:"text",
            success:function (data) {
                if(data == "ok"){
                    alert("修改成功");
                    window.location.reload();
                }else {
                    alert("修改失败");
                }
            }
        });
    }
</script>

</body>
</html>

