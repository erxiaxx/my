<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String nameStr = request.getParameter("s_name");//用request得到
    request.setAttribute("nameAttr", nameStr);
%>
<html>
<head>
    <title>二维码</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
</head>
<body>
<c:if test="${nameAttr != null}">
    <div style="text-align: center; width: 400px;height: 630px;background: url(${pageContext.request.contextPath}/img/Qr/${nameAttr}.jpg) no-repeat;background-size: 400px 630px"> </div>
</c:if>
<%--<div style="text-align: center; width: 400px;height: 630px;background: url(${pageContext.request.contextPath}/img/Qr/admin.jpg) no-repeat 400px 630px"> </div>--%>

</body>
</html>
