<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>商品列表页</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
</head>
<body class="buytoday-content">
    <div id="list-cont">
        <div class="product-list-box">
            <div class="product-list w1200">
                <div style="height: 30px;"></div>
                <div class="list-cont">
                    <div class="item-box layui-clear">
                        <c:forEach items="${goods}" var="g" varStatus="status">
                            <div class="item">
                                            <img src="${g.go_pic}" alt="" style="width: 260px;height: 260px;">
                                            <div class="text-box">
                                                <p class="title">${g.go_name}</p>
                                                <p>${g.ga_name}  ${g.s_name} Lv.${g.s_level}</p>
                                                <p class="plic">
                                                    <span class="ciur-pic">￥${g.go_price}</span>
                                                    <span class="Ori-pic"><%--￥208.00--%></span>
                                                    <span class="discount" onclick="addCart(${g.go_id},1,${g.go_price});">加入购物车</span>
                                                </p>
                                            </div>
                                        </div>
                        </c:forEach>
                    </div>
                    <div id="demo0" style="text-align: center;"></div>
                </div>
            </div>
        </div>
    </div>
    <!-- 模版引擎导入 -->
    <!-- <script type="text/html" id="demo">
                  {{# layui.each(d.menu.milk.content,function(index,item){}}
                    <div class="item">
                      <div class="img">
                        <a href="javascript:;"><img src="{{item.img}}"></a>
                      </div>
                      <div class="text">
                        <p class="title"></p>
                        <p class="price">
                          <span class="pri">{{item.pri}}</span>
                          <span class="nub">{{item.nub}}</span>
                        </p>
                      </div>
                    </div>
                  {{# }); }}
                </script> -->

<script>

    layui.config({
        base: '${pageContext.request.contextPath}/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
    }).use(['mm','laypage','jquery'],function(){
        var laypage = layui.laypage,$ = layui.$;
        mm = layui.mm;
        laypage.render({
            elem: 'demo0'
            ,count: 100 //数据总数
        });


        $('body').on('click','*[data-content]',function(){
            $(this).addClass('active').siblings().removeClass('active')
            var dataConte = $(this).attr('data-content');
            $('*[cont]').each(function(i,item){
                var itemCont = $(item).attr('cont');
                console.log(item)
                if(dataConte === itemCont){
                    $(item).removeClass('layui-hide');
                }else{
                    $(item).addClass('layui-hide');
                }
            })
        })
        // 模版引擎导入
        //  var html = demo.innerHTML;
        //  var listCont = document.getElementById('list-cont');
        //  // console.log(layui.router("#/about.html"))
        // mm.request({
        //     url: '../json/buytoday.json',
        //     success : function(res){
        //       console.log(res)
        //       listCont.innerHTML = mm.renderHtml(html,res)
        //     },
        //     error: function(res){
        //       console.log(res);
        //     }
        //   })

    });

    function addCart(go_id,go_num,count_price){
        $.ajax({
            url : "/addCart",
            type : 'post',
            dataType : 'json',
            data : {go_id:go_id, go_num:go_num, count_price:count_price },
            async : false,
            error : function() {
                console.log("get error!!!")
            },
            success : function(data) {
                if(data.result==1){
                    alert("加入成功！");
                }else{
                    alert("请先登录！");
                }
            }
        });
    }
</script>

</body>
</html>
