<%--
  Created by IntelliJ IDEA.
  User: hj   li
  Date: 2019/11/23
  Time: 15:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加商品</title>
    <link rel="stylesheet" href="/static/;/layui.css"/>
</head>
<body>
<form class="layui-form" action="/admin/insert">
    <input name="computerName" required="required">${computerName}<!---->
    <input name="computerPrice" required="required">
</form>
</body>
</html>
