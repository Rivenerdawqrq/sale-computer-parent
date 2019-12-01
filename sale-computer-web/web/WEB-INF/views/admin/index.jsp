<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hj   li
  Date: 2019/11/16
  Time: 22:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>管理端</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>
    <script src="/static/js/layuipeizhi.js"></script>
    <link rel="stylesheet" href="/static/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="/static/layui/layui.css"/>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">管理端</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="/admin/add">添加商品</a></li>
            <li class="layui-nav-item"><a href="">订单管理</a></li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    管理员
                </a>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合1layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    &nbsp; &nbsp; &nbsp;品牌
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">华为</a></dd>
                        <dd><a href="javascript:;">苹果</a></dd>
                        <dd><a href="javascript:;">小米</a></dd>
                        <dd><a href="">超链接</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <table class="layui-table">
                <thead class="layui-table-header">
                <tr>
                    <td>编号</td>
                    <td>名字</td>
                    <td>价格</td>
                    <td>库存</td>
                    <td>状态</td>
                    <td>品牌编号</td>
                    <td>操作</td>
                </tr>
                </thead>
                <c:forEach var="c" items="${pageInfo.list}">
                    <tr>
                        <td>${c.computerId}</td>
                        <td>${c.computerName}</td>
                        <td>${c.computerPrice}</td>
                        <td>${c.computerAmount}</td>
                        <td><c:choose>
                            <c:when test="${c.computerState > 0}">上架</c:when>
                            <c:otherwise>下架</c:otherwise>
                        </c:choose></td>
                        <td>${c.computerBrandId}</td>
                        <td>
                        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
                        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a></td>
                    </tr>
                </c:forEach>
            </table>

            <ul class="pagination">
                <li><a href="/admin/list?pageNum=1">首页</a> </li>
                <li><a href="/admin/list?pageNum=${pageInfo.prePage}">上一页</a> </li>

                <c:forEach items="${pageInfo.navigatepageNums}" var="c">
                    <li><a href="/admin/list?pageNum=${c}">${c}</a></li>
                </c:forEach>

                <li><a href="/admin/list?pageNum=${pageInfo.nextPage}">下一页</a> </li>
                <li><a href="/admin/list?pageNum=${pageInfo.pages}">尾页</a> </li>
            </ul>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        您来管理商品啦？
    </div>
</div>
<script src="/static/layui/layui.js" type="text/javascript"></script>
<script>

</script>
</body>
</html>
