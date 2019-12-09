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

    <script src="/static/js/jquery-3.4.1.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>
    <script src="/static/layui/layui.js" type="text/javascript"></script>
    <link rel="stylesheet" href="/static/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="/static/layui/layui.css"/>

    <style>
        li>img{
            padding: 5px;
            width: 30px;
            height: 25px;
        }

        dd>a>img{
            width: 35px;
            height: 30px;
            padding: 8px;
        }
    </style>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo"><a href="/admin/index" style="text-decoration: none">
            <img src="/static/layui/images/face/36.gif" style="padding: 10px;"/>
            <span style="color: #dca7a7">管理端</span></a></div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="/admin/add" style="text-decoration: none;">添加商品</a></li>
            <li class="layui-nav-item"><a href="#" style="text-decoration: none;">订单管理</a></li>
            <li class="layui-nav-item"><a href="#"  id="getAll" style="text-decoration: none;">全部商品</a></li>
            <li class="layui-nav-item">
                <a  href="javascript:;" style="text-decoration: none">选择品牌</a>

                <dl class="layui-nav-child" id="choose"> <!-- 二级菜单 -->
                    <c:forEach items="${brand}" var="c">
                        <dd data-id="${c.brandId}" data-name="${c.brandName}"><a  style="text-decoration: none"><img id="${c.brandName}" src="/static/image/${c.brandId}.png">${c.brandName}</a></dd>
            </c:forEach>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <img src="/static/layui/images/face/16.gif"/>
                欢迎您！管理员
                <span class="glyphicon glyphicon-heart-empty"></span>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合1layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a href="#">&nbsp;&nbsp;添加商品</a>
                </li>
            </ul>
        </div>
    </div>
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
                <ul class="layui-tab-title">
                    <li class="layui-this" id="this"></li>
                </ul>
                <div class="layui-tab-content" style="height: 100px;">
                    <div class="layui-tab-item layui-show">
                        <table class="layui-table" id="all">
                            <thead class="layui-table-header">
                            <tr>
                                <td>编号</td>
                                <td>名字</td>
                                <td><span class="glyphicon glyphicon-yen" style="padding: 5px;"></span>价格</td>
                                <td>库存</td>
                                <td>状态</td>
                                <td>品牌编号</td>
                                <td>处理器</td>
                                <td>显卡</td>
                                <td>内存条</td>
                                <td>操作</td>
                            </tr>
                            </thead>
                            <tbody id="tab_body"></tbody>
                        </table>
                        <ul id="pageInfo" class="pagination">
                        </ul>
                    </div>
    </div>
            </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        <img src="/static/layui/images/face/1.gif"/>
        您来管理商品啦？
    </div>
</div>

<%--<script src="/static/js/admin-list.js" type="text/javascript"></script>--%>
    </div>
</div>

<script>

    //注意：选项卡 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function () {
        var element = layui.element;
        //…
    });
    $(document).ready(function () {
        all(1)
        $("#getAll").click(function () {
            all(1)
        });
        byBrand()

    })

    function byBrand() {
        $(".layui-nav-child dd").click(function () {
            var bid = $(this).attr('data-id');
            var brandName = $(this).attr('data-name')

            $.ajax({
                method: "POST",
                url: "/admin/getComputerByBrand",
                data: {
                    pageNum: 1,
                    pageSize: 1,
                    bid: bid
                }
            }).done(function (res) {
                $("#tab_body").html("");
                $("#pageInfo").html("");
                $("#this").html(brandName)
                //往表格添加数据
                res.list.forEach(function (c) {
                    var state = c.computerState;
                    if (state > 0) {
                        state = "上架"
                    } else {
                        state = "下架"
                    }
                    var tab = "<tr><td>" + c.computerId + "</td><td>" + c.computerName + "</td><td>"
                        + c.computerPrice + "</td><td>" + c.computerAmount + "</td><td>" + state + "</td><td id='bid' data-bid="+c.computerBrandId+">"
                        + c.computerBrandId + "</td><td>" + c.cpuType + "</td><td>" + c.gpuType + "</td><td>" + c.ramType + "</td>"
                        + " <td><a class='layui-btn layui-btn-xs' lay-event='edit'>编辑</a>" +
                        "<a class='layui-btn layui-btn-danger layui-btn-xs' lay-event='del'>删除</a></td>"
                    $("#tab_body").append(tab)
                })
                //分页功能
                var data = "<li class='pages' value='1'><a>首页</a></li>" +
                    "<li class='pages' value='" + res.prePage + "'><a>上一页</a></li>";
                res.navigatepageNums.forEach(function (num) {
                    data += "<li class='pages' value='" + num + "'><a>" + num + "</a></li>"
                })
                data += "<li class='pages' value='" + res.nextPage + "'><a>下一页</a></li>" +
                    "<li class='pages' value='" + res.pages + "'><a>尾页</a></li>";
                $("#pageInfo").append(data)
                ddClickByBrand()
            })
        })
    }


    //按牌子分页的方法
    function byBrandPage(pageNum){
        var bid = $("#bid").attr("data-bid")
        $.ajax({
            method: "POST",
            url: "/admin/getComputerByBrand",
            data: {
                pageNum: pageNum,
                pageSize: 1,
                bid: bid
            }
        }).done(function (res) {
            $("#tab_body").html("");
            $("#pageInfo").html("");
            //往表格添加数据
            res.list.forEach(function (c) {

                // var states = null;
                var state = c.computerState;
                if (state > 0) {
                    state = "上架"
                } else {
                    state = "下架"
                }
                var tab = "<tr><td>" + c.computerId + "</td><td>" + c.computerName + "</td><td>"
                    + c.computerPrice + "</td><td>" + c.computerAmount + "</td><td>" + state + "</td><td id='bid' data-bid="+c.computerBrandId+">"
                    + c.computerBrandId + "</td><td>" + c.cpuType + "</td><td>" + c.gpuType + "</td><td>" + c.ramType + "</td>"
                    + " <td><a class='layui-btn layui-btn-xs' lay-event='edit'>编辑</a>" +
                    "<a class='layui-btn layui-btn-danger layui-btn-xs' lay-event='del'>删除</a></td>"
                $("#tab_body").append(tab)
            })
            //分页功能
            var data = "<li class='pages' value='1'><a>首页</a></li>" +
                "<li class='pages' value='" + res.prePage + "'><a>上一页</a></li>";
            res.navigatepageNums.forEach(function (num) {
                data += "<li class='pages' value='" + num + "'><a>" + num + "</a></li>"
            })
            data += "<li class='pages' value='" + res.nextPage + "'><a>下一页</a></li>" +
                "<li class='pages' value='" + res.pages + "'><a>尾页</a></li>";
            $("#pageInfo").append(data)
            ddClickByBrand()
        })
    }
    //按牌子分页点击事件
    function ddClickByBrand() {
        $(".pages").click(function () {
            var val = $(this).val();
            byBrandPage(val)
        })

    }

    function all(pageNum) {
        var name = $("#getAll").html();
        $.ajax({
            method: "POST",
            url: "/admin/list",
            data:{
                pageNum: pageNum,
                pageSize: 2
            }
        }).done(function (res) {
            $("#tab_body").html("");
            $("#pageInfo").html("");
            $("#this").html(name)
            //往表格添加数据
            res.list.forEach(function (c) {
                // var states = null;
                var state = c.computerState;
                if (state > 0) {
                    state = "上架"
                } else {
                    state = "下架"
                }
                var tab = "<tr><td>" + c.computerId + "</td><td>" + c.computerName + "</td><td>"
                    + c.computerPrice + "</td><td>" + c.computerAmount + "</td><td>" + state + "</td><td data-bid="+c.computerBrandId+"'>"
                    + c.computerBrandId + "</td><td>" + c.cpuType + "</td><td>" + c.gpuType + "</td><td>" + c.ramType + "</td>"
                    + " <td><a class='layui-btn layui-btn-xs' lay-event='edit'>编辑</a>" +
                    "<a class='layui-btn layui-btn-danger layui-btn-xs' lay-event='del'>删除</a></td>"
                $("#tab_body").append(tab)
                //分页功能
            })
            var data = "<li class='num' value='1'><a>首页</a></li>"+
                "<li class='num' value='" + res.prePage + "'><a>上一页</a></li>";
            res.navigatepageNums.forEach(function (num) {
                data += "<li class='num' value='" + num + "'><a>" + num + "</a></li>"
            })
            data += "<li class='num' value='" + res.nextPage + "'><a>下一页</a></li>" +
                "<li class='num' value='" + res.pages + "'><a>尾页</a></li>";
            $("#pageInfo").append(data)
            //调用分页点击li事件
            ddClickAll()
        })
    }
    //全部商品的分页方法
    function ddClickAll() {
        $(".num").click(function () {
            var pageNum = $(this).val();
            all(pageNum)
        })
    }
</script>
</body>
</html>
