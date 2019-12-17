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
        .layui-edge{
            margin-right: 178px;
        }
    </style>
</head>
<body class="layui-layout-body" style="overflow-y:auto; overflow-x:auto;height:800px;">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo" style="cursor: pointer"><span class="glyphicon glyphicon-home" style="color: #b9def0"></span>管理端</div>
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item layui-this">
                <a href="#" style="text-decoration: none;">添加页面</a>
            </li>
            <span class="layui-nav-bar"></span></ul>
    </div>
</div>
<div id="all" style="overflow: auto">
    <div id="add" style="">
        <form class="layui-form" id="addForm" method="post" action="/admin/insert" enctype="multipart/form-data">
            <div class="layui-form-item">
                <h2 style="color: #E7E7E7; margin: 20px 40px;">添加商品：</h2>
                <label class="layui-form-label">名字</label>
                <div class="layui-input-block">
                    <input type="text" value="${computerInfo.computerName}" name="computerName" required="" lay-verify="required" placeholder="请输入商品名字" autocomplete="off" class="layui-input layui-form-danger">
                    <span>${computerName}</span>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">价格</label>
                <div class="layui-input-block">
                    <input type="text" name="computerPrice"
                           value="${computerInfo.computerPrice}" required=""  onkeyup="value=value.replace(/[^\d.]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d.]/g,''))" lay-verify="required" placeholder="只能输入数字和小数点哦" autocomplete="off" class="layui-input">
                    <span>${computerPrice}</span>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">库存</label>
                <div class="layui-input-block">
                    <input type="text" value="${computerInfo.computerAmount}" name="computerAmount" required="" lay-verify="required" placeholder="请输入商品库存" autocomplete="off" class="layui-input">
                    <span>${computerAmount}</span>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">状态</label>
                <select name="computerState" lay-verify="">
                    <option value="1">上架</option>
                    <option value="0">下架</option>
                </select>
            </div>

            <%--            <div class="layui-form-item">--%>
            <label class="layui-form-label">品牌</label>
            <select id="chooseBrand" name="computerBrandId">

            </select>
            <%--            </div>--%>

            <div class="layui-form-item">
                <label class="layui-form-label">image</label>
                <div class="layui-input-block">
                    <input type="file" name="myFile">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">CPU</label>
                <div class="layui-input-block">
                    <input type="text" name="cpuType" required="" lay-verify="required"
                           placeholder="请输入商品CPU" value="${computerInfo.cpuType}" autocomplete="off" class="layui-input">
                    <span>${cpuType}</span>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">显卡</label>
                <div class="layui-input-block">
                    <input type="text" name="gpuType"  value="${computerInfo.gpuType}" required="" lay-verify="required" placeholder="请输入商品显卡" autocomplete="off" class="layui-input">
                    <span>${gpuType}</span>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">内存条</label>
                <div class="layui-input-block">
                    <input type="text" name="ramType" required="" value="${computerInfo.ramType}" lay-verify="required" placeholder="请输入商品内存条" autocomplete="off" class="layui-input">
                    <span>${ramType}</span>
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button id="submit" class="layui-btn" lay-submit="" lay-filter="formDemo">立即提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form></div>
</div>



</body>
<script>
    $(document).ready(function () {
        ${ok}
        listBrand()
        $(".layui-logo").click(function () {
            window.location.href = "/admin/home";
        })
    })
    function listBrand(){
        $.ajax({
            method:"GET",
            url:"/admin/getAllBrand"
        }).done(function (res) {
            $("#chooseBrand").append(res)
        })
    }
    //Demo
    layui.use(['form'], function(){
        var form = layui.form

    });
    //注意：导航 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function(){
        var element = layui.element;
        //…
    });
</script>
</html>
