<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="cn">
<head>
    <meta charset="UTF-8">
    <title>购物车</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
</head>
<body>
<div class="content content-nav-base shopcart-content">
    <div class="cart w1200">
        <div class="cart-table-th">
            <div class="th th-chk">
                <div class="select-all">
                    <div class="cart-checkbox">
                        <input class="check-all check" id="allCheckked" type="checkbox" value="true">
                    </div>
                    <label>&nbsp;&nbsp;全选</label>
                </div>
            </div>
            <div class="th th-item">
                <div class="th-inner">
                    商品
                </div>
            </div>
            <div class="th th-price">
                <div class="th-inner">
                    单价
                </div>
            </div>
            <div class="th th-amount">
                <div class="th-inner">
                    数量
                </div>
            </div>
            <div class="th th-sum">
                <div class="th-inner">
                    小计
                </div>
            </div>
            <div class="th th-op">
                <div class="th-inner">
                    操作
                </div>
            </div>
        </div>
        <div class="OrderList">
            <div class="order-content" id="list-cont">
                <c:if test="${msg!=null}">
                    <div class="item-content layui-clear" style="text-align: center;font-size: 18px;">
                            ${msg}
                    </div>
                </c:if>
                <c:forEach items="${cart}" var="p" varStatus="status" >
                    <ul class="item-content layui-clear">
                        <li class="th th-chk">
                            <div class="select-all">
                                <div class="cart-checkbox">
                                    <input class="CheckBoxShop check" id="${status}" type="checkbox" num="all" name="select-all" value="true">
                                </div>
                            </div>
                        </li>
                        <li class="th th-item">
                            <div class="item-cont">
                                <a href="javascript:;"><img src="${p.go_pic}" alt=""></a>
                                <div class="text">
                                    <div class="title">${p.go_name}</div>
                                        <%--<p><span>粉色</span>  <span>130</span>cm</p>--%>
                                </div>
                            </div>
                        </li>
                        <li class="th th-price">
                            <span class="th-su">${p.count_price}</span>
                        </li>
                        <li class="th th-amount">
                            <div class="box-btn layui-clear">
                                <div class="less layui-btn">-</div>
                                <input class="Quantity-input" type="" name="" value="${p.go_num}" disabled="disabled">
                                <div class="add layui-btn">+</div>
                            </div>
                        </li>
                        <li class="th th-sum">
                            <span class="sum">${p.go_num*p.count_price}</span>
                        </li>
                        <li class="th th-op">
                            <span class="layui-btn" style="background: #cfb2f6" onclick="addOrder(${p.go_id},${p.go_num},${p.go_num*p.count_price});">创建订单</span>
                        </li>
                    </ul>
                </c:forEach>
            </div>
        </div>

        <div class="FloatBarHolder layui-clear">
            <div class="th th-chk">
                <div class="select-all">
                    <div class="cart-checkbox">
                        <input class="check-all check" id="" name="select-all" type="checkbox"  value="true">
                    </div>
                    <label>&nbsp;&nbsp;已选<span class="Selected-pieces">0</span>件</label>
                </div>
            </div>
            <div class="th batch-deletion">
                <span class="batch-dele-btn">批量删除</span>
            </div>
            <%--<div class="th Settlement">--%>
                <%--<button class="layui-btn" onclick="addOrder(${p.go_id},${p.go_num},${p.go_num*p.count_price});">结算</button>--%>
            <%--</div>--%>
            <div class="th total">
                <p>应付：<span class="pieces-total">0</span></p>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    layui.config({
        base: '${pageContext.request.contextPath}/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
    }).use(['mm','jquery','element','car'],function(){
        var mm = layui.mm,$ = layui.$,element = layui.element,car = layui.car;
        car.init();
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

    function addOrder(go_id,go_num,o_price){
        $.ajax({
            url : "/addOrder",
            type : 'post',
            dataType : 'json',
            data : {go_id:go_id, go_num:go_num, o_price:o_price },
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