<%--
  Created by IntelliJ IDEA.
  User: hj   li
  Date: 2020/1/24
  Time: 15:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="/static/js/jquery-3.4.1.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>
    <script src="/static/layui/layui.js"></script>
    <link href="/static/css/computer/style.css" rel="stylesheet" type="text/css">
    <link href="/static/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="/static/layui/css/layui.css" rel="stylesheet" type="text/css">
    <style>
        /*登录样式*/
        #denglu:hover{
            background: #5e5e5e;
        }
        .hp-row {
            margin: 45px;
            position: relative;
        }
        .hp-row input {
            border: none;
            border-bottom: 1px solid #c6c6c6;
            background: none;
            outline: none;
            padding: 10px 10px 10px 5px;
            width: 320px;
            display: block;
            box-sizing: border-box;
            font-size: 16px;
            color: #c6c6c6;
        }
        .hp-row label {
            position: absolute;
            top: 10px;
            left: 5px;
            font-size: 16px;
            transition: all .3s ease;
            -webkit-transition: .3s ease all;
            color: #c6c6c6;
            pointer-events: none;
        }
        .hp-row input:focus ~ label,
        .hp-row input:valid ~ label {
            top: -14px ;
            font-size: 12px;
            color: #2196F3;
        }
        .hp-row .bar{
            display: block;
            position: relative;
        }
        .hp-row .bar:before {
            position: absolute;
            bottom: 0px;
            content: '';
            width: 0px;
            height: 2px;
            transition: all .3s ease;
            -webkit-transition: .3s ease all;
        }
        .hp-row input:focus ~ .bar:before,
        .hp-row input:valid ~ .bar:before {
            width: 320px;
            background:#2196F3;
        }
        /*<!--login结束-->*/
    </style>
</head>
<body>
<header>
    <div class="top center">
        <div class="right fr">
            <div class="gouwuche fr"><i style="margin-right: 10px" class="layui-icon layui-icon-cart"></i> <a style="text-decoration: none;" href="">购物车</a></div>
            <div id="denglu" class="fr denglu">
                <ul id="loginInfo">
                    <li ><a href="#" data-toggle="modal" data-target="#myModal" style="text-decoration: none; color: beige;" target="_blank">登录</a></li>
                </ul>
            </div>
            <div class="clear"></div>
        </div>
        <div class="clear"></div>
    </div>
</header>
<!-- 模态框（Modal）登陆 -->
<div class="modal fade"  id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 500px;height: 230px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">×
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    您好！请登录
                </h4>
            </div>
            <div class="modal-body">
                <form id="checkLogin">
                    <div class="hp-row">
                        <input type="text" id="accountName"  name="accountName"  required >
                        <span class="bar"></span>
                        <label>用户名/手机号</label>
                    </div>

                    <div class="hp-row">
                        <input type="password" id="accountPwd"  name="accountPwd"  required >
                        <span class="bar"></span>
                        <label>密码</label>
                    </div>
                    <a href="/user/logon" style="margin-left: 265px;">
                        <span id="register"style="color: #b2b2b2; font-size: 18px ;" >注册一个吧！</span>
                    </a>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">关闭
                </button>
                <button id="login" type="button" class="btn btn-primary">
                    登录
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<div class="banner_x center">
    <a href="/computer/home"><div class="logo fl" style="background: url('/static/image/logo.png') no-repeat center center;width: 100px;height: 100px;"></div></a>
    <div class="nav fl">
        <ul>
            <li><a href="" style="text-decoration: none;"  target="_blank"></a></li>
            <li> <img src="/static/image/3333.png"/></li>
        </ul>
    </div>
    <div class="search fr">
        <div class="text fl">
            <input type="text" class="shuru" style=" display: inline; height: 50px;border: #d2d2d2 2px solid" placeholder="外星人">
        </div>
        <div>
            <button  class="btn-primary" style="display: inline; background-color: #b2b2b2; margin-top: 26px;" id="search"><span class="glyphicon glyphicon-search"  style="font-size: 45px;background-color: #b9def0"></span></button>
        </div>
        <div class="clear"></div>
        <div class="clear"></div>
    </div>
</div>
<!-- xiangqing -->
<form action="post" method="">
    <div class="xiangqing">
        <div class="neirong w">
            <div class="xiaomi6 fl" style="font-size: 16px;margin-top: 16px">
                ${details.computerName}
            </div>
            <nav class="fr">
                <div class="clear"></div>
            </nav>
            <div class="clear"></div>
        </div>
    </div>

    <div class="jieshao mt20 w">
        <div class="left fl" style="text-align: center"><img style="width: 80%;height: 80%;margin-top: 30px" alt="" src="/static/image/${details.computerImage}"></div>
        <div class="right fr">
            <div class="h3 ml20 mt20">${details.computerName}</div>
            <div class="jianjie mr40 ml20 mt10">处理器:&nbsp;&nbsp;${details.cpuType}
                <br style="margin-left: 10px">显&nbsp;&nbsp;&nbsp;&nbsp;卡:&nbsp;&nbsp;${details.gpuType}<br>
                内&nbsp;&nbsp;&nbsp;&nbsp;存:&nbsp;&nbsp;${details.ramType}</div>
            <div class="jiage ml20 mt10">${details.computerPrice}元</div>
          <div style="height: 30px"></div>



            <div class="xqxq mt20 ml20">
                <div class="top1 mt10">
                    <div class="left1 fl">${details.computerName}</div>
                    <div class="right1 fr">${details.computerPrice}元</div>
                    <div class="clear"></div>
                </div>
                <div class="bot mt20 ft20 ftbc">总计：${details.computerPrice}元</div>
            </div>
            <div class="xiadan ml20 mt20">
<%--                <input class="jrgwc"  type="button" name="jrgwc" value="立即选购" />--%>
                <input style="margin-left: 160px" class="jrgwc" type="button" name="jrgwc" value="加入购物车" />

            </div>
        </div>
        <div class="clear"></div>
    </div>
</form>
<%--<!-- footer -->--%>
<%--<footer class="mt20 center">--%>
<%--    <div style="color: #2E2D3C;font-size: 20px">用户评价部分  待完成</div>--%>
<%--</footer>--%>
<script>
    $(function () {
        userLogin()
        welcome()
        $(".jrgwc").click(function () {
            if(${user==null}){
                alert("请先登录")
            }else {
                addToCart()
            }
        })
        listCart()
    })
    //加入购物车
    function addToCart() {
        $.ajax({
            type:"POST",
            url:"/computer/check",
            data:{
                id:${details.computerId}
            }
        }).done(function (res) {
           if (res.computerId==undefined){
               $.ajax({
                   type:"GET",
                   url:"/computer/addToCart",
                   data:{
                       computerId:${details.computerId}
                   }
               }).done(function () {
                   alert("添加成功")
               }).fail(function (res) {
                   alert(res.message)
               })
           }else {
               $.ajax({
                   type:"POST",
                   url:"/computer/addOne",
                   data:{
                       id:${details.computerId}
                   }
               }).done(function (res) {
                    if (res=="ok"){
                        alert("添加成功")
                    }
               })
           }
        })

    }
    //购物车
    function listCart() {
        $(".gouwuche").click(function () {
            if (${user==null}){
                alert("请先登录")
            }else {
                window.open("/computer/listCart?accountName=${account}","_blank")
            }
        })
    }
    //用户登录
    function userLogin() {
        $("#login").on('click',function () {
            var accountName = $("#accountName").val();
            var accountPwd = $("#accountPwd").val();
            $.ajax({
                method:"POST",
                url:"/user/userLogin",
                data:$("#checkLogin").serialize()
            }).done(function (res) {
                if (res.accountName==accountName||res.accountPhone==accountName&&res.accountPwd==accountPwd){
                    location.reload()
                }else {
                    alert("用户名/手机/密码错误")
                    $("#accountName").val(null);
                    $("#accountPwd").val(null);
                }
            })
        })
    }
    //显示登陆的用户名and退出操作
    function welcome() {
        if (${user != null}){
            $("#loginInfo").html(null);
            var data = "<li>欢迎你：${user.accountName}</li>";
            data += "<li><a id='logout' style='text-decoration: none' href='#'>退出</a>"
            $("#loginInfo").append(data)
        }
        $("#logout").on('click',function () {
            if (confirm("确定退出吗?")){
                $.get("/user/logout",function () {
                    location.reload()
                })
            }
        })
    }

</script>
</body>
</html>
