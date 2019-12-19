<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/12
  Time: 8:49
  To change this template use File | Settings | File Templates.
  ****
        此页面添加到添加商品的页面
  ****
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:forEach var="c" items="${allBrand}">
    <option value="${c.brandId}">${c.brandName}</option>
</c:forEach>
