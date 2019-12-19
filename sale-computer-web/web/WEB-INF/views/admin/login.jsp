<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/12
  Time: 21:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
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
        #login{
            float: left;
            border: mistyrose 2px solid;
            width: 300px;
            background-color: whitesmoke;
        }
        .input-group{
            margin: 10px 25px;
        }

        #denglu{
            margin-left: 200px;
        }


    </style>
</head>
<body style="background-color: #b2b2b2">
<div id="all" style="overflow: auto">
    <div id="login">
        <form method="post" role="form" class="form-inline" >
            <div class="input-group">
                <span class="input-group-addon" id="basic-addon1">
                    <span class="glyphicon glyphicon-user"></span>
                </span>
                <input type="text" id="accountNum"   name="accountNum" size="50px" required class="form-control" placeholder="请输入管理员账号">
            </div>

            <div class="input-group">
                <span class="input-group-addon" id="basic-addon2">
                    <span class="glyphicon glyphicon-lock"></span>
                </span>
                <input type="text" id="accountPwd" size="50px" class="form-control" required name="accountPwd" placeholder="Password" >
            </div>

            <div id="denglu">
                <button type="button" onclick="login()" class="btn btn-primary">
                    登录
                </button>
            </div>

        </form>
    </div>
</div>
<script>
    function login(){
        var accountNum = $("#accountNum").val();
        var accountPwd = $("#accountPwd").val();
        $.ajax({
            method:"POST",
            url:"/admin/checkLogin",
            data:$(".form-inline").serialize()
        }).done(function (res) {
            if (res.accountNum == accountNum && res.accountPwd == accountPwd){
                window.location.href = "/admin/home";
            }else {
                alert("账号或密码错误")
            }
        }).fail(function (res) {
            alert(res)
        })
    }
    layui.use(['form'], function(){
        var form = layui.form
    });
    //注意：导航 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function(){
        var element = layui.element;
        //…
    });
</script>
</body>
</html>
