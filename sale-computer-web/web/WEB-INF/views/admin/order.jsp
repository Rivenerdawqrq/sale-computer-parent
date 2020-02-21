<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hj   li
  Date: 2020/2/9
  Time: 23:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订单管理</title>
    <script src="/static/js/jquery-3.4.1.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>
    <link rel="stylesheet" href="/static/layui/layui.css" media="all"/>
    <link rel="stylesheet" href="/static/bootstrap/css/bootstrap.css"/>
    <script src="/static/layui/layui.js"></script>

</head>
<body class="layui-layout-body" style="overflow-y:auto; overflow-x:auto;height:800px;">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo" style="cursor: pointer"><span class="glyphicon glyphicon-home" style="color: #b9def0"></span>管理端</div>
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item layui-this">
                <a href="#" style="text-decoration: none;">订单管理</a>
            </li>
            <span class="layui-nav-bar"></span></ul>
    </div>
</div>
<div id="all" style="width: 1000px" >
    <table class="table">
        <tr>
            <td>订单编号</td>
            <td>购买用户</td>
            <td>状态</td>
            <td>价钱</td>
            <td>操作</td>
        </tr>

        <c:forEach items="${list}" var="c">
            <tr data-id="${c.orderId}">
                <td>${c.orderId}</td>
                <td>${c.accountName}</td>
                <td><c:choose>
                    <c:when test="${c.state==1}">未发货</c:when>
                    <c:otherwise>已发货</c:otherwise>
                </c:choose>
                </td>
                <td>${c.price}</td>
                <td><button class="fahuo">发货</button></td>

            </tr>
        </c:forEach>
    </table>

</div>
<script>
    $(function () {
        $(".layui-logo").click(function () {
            window.location.href = "/admin/home";
        })
        fahuo()
    })
    function fahuo() {
        $(".fahuo").click(function () {
            var jQuery = $(this).closest("tr").attr("data-id");
            $.ajax({
                type:"POST",
                url:"/admin/deliver",
                data:{
                    orderId:jQuery
                }
            }).done(function (res) {
                if (res=="ok"){
                    location.reload()
                }
            })
        })
    }

</script>
</body>
</html>
