<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/16
  Time: 22:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加品牌</title>
    <script src="/static/js/jquery-3.4.1.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>
    <link rel="stylesheet" href="/static/layui/layui.css" media="all"/>
    <link rel="stylesheet" href="/static/bootstrap/css/bootstrap.css"/>
    <script src="/static/layui/layui.js"></script>
    <style>
        *{
            margin: 0px;
            padding: 0px;
        }
        .layui-input{
            margin-bottom: 5px;
            width: 300px;
        }
        span{
            color: red;
            margin-left: 110px;
        }
        .layui-btn{
            margin-left: 95px;
        }
        #add{
            margin:0 auto;
            border: mistyrose 2px solid;
            width: 700px;
            background-color: white;
        }
        body{
            background-color: aliceblue
        }
        .layui-form-label{
            margin-left: 135px;
        }
    </style>
</head>
<body class="layui-layout-body" style="overflow-y:auto; overflow-x:auto;height:800px;">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo" style="cursor: pointer"><span class="glyphicon glyphicon-home" style="color: #b9def0"></span>管理端</div>
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item layui-this">
                <a href="#" style="text-decoration: none;">添加品牌页面</a>
            </li>
            <span class="layui-nav-bar"></span></ul>
    </div>
</div>
<div id="all" style="overflow: auto">
    <div id="add" style="">
        <form class="layui-form" id="addForm" method="post" action="/admin/BrandInsert" enctype="multipart/form-data">
            <div class="layui-form-item">
                <h2 style="color: #E7E7E7; margin: 20px 40px;">添加品牌：</h2>
                <label class="layui-form-label">名字</label>
                <div class="layui-input-block">
                    <input type="text"  required name="brandName"  placeholder="请输入品牌名字" autocomplete="off" class="layui-input layui-form-danger">
                    <span>${brandName}</span>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">image</label>
                <div class="layui-input-block">
                    <input type="file" name="myFile" required>
                </div>
                <span>${brandImage}</span>
            </div>



            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button id="submit" class="layui-btn" lay-submit="" lay-filter="formDemo">立即提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form></div>
</div>
<script>
    $(function () {
       ${addBrand}
        $(".layui-logo").click(function () {
            window.location.href = "/admin/home";
        })
    })
    //注意：导航 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function(){
        var element = layui.element;
        //…
    });
</script>
</body>
</html>
