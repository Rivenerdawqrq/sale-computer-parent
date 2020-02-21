<%--
  Created by IntelliJ IDEA.
  User: hj   li
  Date: 2020/2/8
  Time: 22:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人中心</title>
    <link rel="stylesheet" type="text/css" href="/static/css/computer/style.css">
    <script src="/static/js/jquery-3.4.1.js"></script>
</head>
<body>
<!-- start header -->
<header>
    <div class="top center">
        <div class="right fr">
            <div class="gouwuche fr"><i style="margin-right: 10px" class="layui-icon layui-icon-cart"></i> <a style="text-decoration: none;">购物车</a></div>
            <div id="denglu" class="fr denglu">
                <ul id="loginInfo">
                    <li ><a href="#" data-toggle="modal" data-target="#myModal" style="text-decoration: none; color: beige;">登录</a></li>
                </ul>
            </div>
            <div class="clear"></div>
        </div>
        <div class="clear"></div>
    </div>
</header>
<!--end header -->
<!-- start banner_x -->
<div class="banner_x center">
    <a href="/computer/home"><div class="logo fl" style="width: 100px;height: 100px"></div></a>
    <div class="nav fl">
        <ul>
            <li><a href="" style="text-decoration: none;"  target="_blank"></a></li>
            <li> <img src="/static/image/3333.png" style="margin-top: 36px"/></li>
        </ul>
    </div>
    <div class="search fr">
        <form action="" method="post">
            <div class="text fl">
                <input type="text" class="shuru"  >
            </div>
            <div class="submit fl">
                <input type="submit" class="sousuo" value="搜索"/>
            </div>
            <div class="clear"></div>
        </form>
        <div class="clear"></div>
    </div>
</div>
<!-- end banner_x -->
<!-- self_info -->
<div class="grzxbj">
    <div class="selfinfo center">
        <div class="lfnav fl">
            <div class="ddzx">订单中心</div>
            <div class="subddzx">
                <ul>
                    <li id="myOrder"><a href="#" style="color:#ff6700;font-weight:bold;">我的订单</a></li>
                </ul>
            </div>

        </div>
        <div class="rtcont fr">


        </div>
        <div class="clear"></div>
    </div>
</div>
<script>
    $(function () {
        welcome()
        listOrder()
    })
    function listOrder() {
            $.ajax({
                type:"POST",
                url:"/user/listOrder",
                data:{
                    accountName:"${account}"
                }
            }).done(function (res) {
                $(".rtcont").html(null)
               $.each(res,function (n,v) {
                   var state = null;
                   if (v.state==0){
                       state = "已发货"
                   }else {
                       state = "未发货"
                   }
                   var data = "<div class=\"ddxq\">\n" +
                       "<div class=\"ddspt fl\"><img style='object-fit: cover;width: 80%;height: 80%;margin:10px' src=\"/static/image/"+v.computerImage+"\" alt=\"\"></div>" +
                       "<div class=\"ddbh fl\">订单号:"+v.orderId+"</div>" +
                       "<div class=\"ztxx fr\">" +
                       "<ul>" +
                       "<li>"+state+"</li>" +
                       "<li>￥"+v.price+"</li>" +
                       "<li>"+v.phone+"</li>" +
                       "<div class=\"clear\"></div>" +
                       "</ul>" +
                       "</div>" +
                       "</div>"

                   $(".rtcont").append(data)
               })

            })
    }
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
                    window.location.href = "/computer/home"
                })
            }
        })
    }
</script>

</body>
</html>
