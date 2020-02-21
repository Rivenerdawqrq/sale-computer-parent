<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/18
  Time: 9:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>优脑网</title>
    <script src="/static/js/jquery-3.4.1.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>
    <script src="/static/layui/layui.js"></script>
    <link href="/static/css/computer/style.css" rel="stylesheet" type="text/css">
    <link href="/static/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="/static/layui/css/layui.css" rel="stylesheet" type="text/css">


    <style>
        .lunbo img{
            object-fit: cover;
            width: 100%;
            height: 100%;
        }
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
    /*    分页样式*/
        #pageInfo>li>a{
            text-align: center;
            margin: 10px;
            border-radius: 20px;
        }
        /*分页结束*/
        /*品牌图片*/
        .displayBrand>img{
            padding: 5px;
            width: 30px;
            height: 25px;
        }
        /*品牌图片 end*/
    </style>
</head>
<body>
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
<div class="layui-carousel" id="test2" style="margin: 0px 17%">
    <div carousel-item>
        <div class="lunbo"><img   src="/static/image/lunbo/lunbo1.jpg"></div>
        <div class="lunbo"><img  src="/static/image/lunbo/lunbo3.jpg"></div>
        <div class="lunbo"><img  src="/static/image/lunbo/lunbo3.jpg"></div>
        <div class="lunbo"><img src="/static/image/lunbo/lunbo1.jpg"></div>
        <div class="lunbo"><img src="/static/image/lunbo/lunbo1.jpg"></div>
    </div>
</div>

<div class="sub_banner center">
    <div class="danpin center">
        <div class="biaoti center">
            <span>尽情选购吧！</span>

        </div>
        <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
            <ul class="layui-tab-title">
                <li class="layui-this">全部商品</li>
                <c:forEach items="${allBrand}" var="c">
                    <li data-id="${c.brandId}" class="displayBrand"><img style="margin-right: 10px" src="/static/image/brand/${c.brandImage}">${c.brandName}</li>
                </c:forEach>
            </ul>
            <div class="layui-tab-content" style="height: 100px;width: 1333px;display: block">
                <div id="all" class="main center" style="width: 1333px">
                </div>
                <div style="width: 1200px; vertical-align: middle; text-align: center;display: block">
                    <ul style="" id="pageInfo" class="pagination">
                    </ul>
                </div>
            </div>
    </div>

    </div>
</div>
<script>
    $(function () {
        ${ok}//提示注册成功
        //用户登录
        userLogin()
        //显示登陆的用户名and退出操作
        welcome()
        //点击全部商品事件
        $(".layui-this").click(function () {
            all(1)
        })
        //显示所有电脑
        all()
        //按品牌显示
        byBrand(1)
        listCart()
    })
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
    //显示登陆的用户名and退出操作
    function welcome() {
        if (${user != null}){
            $("#loginInfo").html(null);
            var data = "<li id='self'>欢迎你：${user.accountName}</li>";
            data += "<li><a id='logout' style='text-decoration: none' href='#'>退出</a></li>"
            data += "<li><a id='myOrder' href='#'>我的订单</a></li>"
            $("#loginInfo").append(data)
            $("#myOrder").click(function () {
                window.location.href = "/user/self";
            })
        }
        $("#logout").on('click',function () {
            if (confirm("确定退出吗?")){
                $.get("/user/logout",function () {
                    window.location.href = "/computer/home"
                })
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
                    window.location.href = "/computer/home"
                }else {
                    alert("用户名/手机/密码错误")
                    $("#accountName").val(null);
                    $("#accountPwd").val(null);
                }
            }).fail(function () {
                alert("用户名/手机/密码错误")
            })
        })
    }
    //显示所有商品
    function all(pageNum){
        $.ajax({
            type:"POST",
            url:"/computer/getAll",
            data:{
                pageNum:pageNum,
                pageSize:4
            }
        }).done(function (res) {
            $("#all").html("");
            $("#pageInfo").html("");
            res.list.forEach(function (c) {
                var state = c.computerState;//商品状态为上架的渲染出来
                if (state>0){
                    var data = "<div class='goods fl mb20' style='border:2px solid #fff;width:230px;" +
                        "margin-right: 80px;margin-left:10px;cursor:pointer;' " +
                        "onmouseout=\"this.style.border='2px solid #fff'\" onmousemove=\"this.style.border='2px solid #a6e1ec'\">";
                    data += "<div class='sub_goods'><a href='/computer/details?id="+c.computerId+"' target='_blank' style='text-decoration: none;" +
                        "text-align: center'><img style='object-fit: inherit;" +
                        "width: 100%;height: 35%;margin-top: 10px' src='/static/image/"+c.computerImage+"' alt=\"\"></a></div>";
                    data += "<div id='bid' data-bid='"+c.computerBrandId+"' class=\"youhui\">"+c.computerName+"</div>";
                    data += "<div class=\"jiage\">"+c.computerPrice+"<i style=\"margin-left: 10px\" class=\"layui-icon layui-icon-rmb\"></i></div></div>";
                    $("#all").append(data)
                }
            })
            //分页功能
            var pageinfo = "<li class='num' value='1'><a>首页</a></li>"+
                "<li class='num' value='" + res.prePage + "'><a>上一页</a></li>";
            res.navigatepageNums.forEach(function (num) {
                pageinfo += "<li class='num' value='" + num + "'><a>" + num + "</a></li>"
            })
            pageinfo += "<li class='num' value='" + res.nextPage + "'><a>下一页</a></li>" +
                "<li class='num' value='" + res.pages + "'><a>尾页</a></li>";
            $("#pageInfo").append(pageinfo)
            ddClickAll()
        }).fail(function (res) {
            alert(res)
        })
    }
    //全部商品的分页点击事件
    function ddClickAll() {
        var  pageNum=null
        $(".num").click(function () {
            pageNum = $(this).val();
            all(pageNum)
        })

    }
    //根据品牌显示电脑
    function byBrand(pageNum){
        $(".layui-tab-title li").click(function () {
            var bid = $(this).attr("data-id");
            $.ajax({
                type:"POST",
                url:"/computer/getComputerByBrand",
                data:{
                    pageNum:pageNum,
                    pageSize:4,
                    bid:bid
                }
            }).done(function (res) {
                $("#all").html("");
                $("#pageInfo").html("");
                res.list.forEach(function (c) {
                    var state = c.computerState;//商品状态为上架的渲染出来
                    if (state>0){
                        var data = "<div class='goods fl mb20' style='border:2px solid #fff;width:230px;" +
                            "margin-right: 80px;margin-left:10px;cursor:pointer;' " +
                            "onmouseout=\"this.style.border='2px solid #fff'\" onmousemove=\"this.style.border='2px solid #a6e1ec'\">";
                        data += "<div class='sub_goods'><a href='/computer/details?id="+c.computerId+"' target='_blank' style='text-decoration: none;" +
                            "text-align: center'><img style='object-fit: inherit;" +
                            "width: 100%;height: 35%;margin-top: 10px' src='/static/image/"+c.computerImage+"' alt=\"\"></a></div>";
                        data += "<div id='bid' data-bid='"+c.computerBrandId+"' class=\"youhui\">"+c.computerName+"</div>";
                        data += "<div class=\"jiage\">"+c.computerPrice+"<i style=\"margin-left: 10px\" class=\"layui-icon layui-icon-rmb\"></i></div></div>";
                        $("#all").append(data)
                    }
                })
                //分页功能
                var pageinfo = "<li class='pages' value='1'><a>首页</a></li>"+
                    "<li class='pages' value='" + res.prePage + "'><a>上一页</a></li>";
                res.navigatepageNums.forEach(function (num) {
                    pageinfo += "<li class='pages' value='" + num + "'><a>" + num + "</a></li>"
                })
                pageinfo += "<li class='pages' value='" + res.nextPage + "'><a>下一页</a></li>" +
                    "<li class='pages' value='" + res.pages + "'><a>尾页</a></li>";
                $("#pageInfo").append(pageinfo)
                ddClickByBrand()
            })
        })
    }

    //按牌子分页点击事件
    function ddClickByBrand() {
        var pageNum;
        $(".pages").click(function () {
            pageNum = $(this).val();
            byBrandPage(pageNum)
        })
    }
    //按牌子分页的方法
    function byBrandPage(pageNum){
        var bid = $("#bid").attr("data-bid")
        $.ajax({
            method: "POST",
            url: "/computer/getComputerByBrand",
            data: {
                pageNum: pageNum,
                pageSize: 4,
                bid: bid
            }
        }).done(function (res) {
            $("#all").html("");
            $("#pageInfo").html("");
            //往表格添加数据
            res.list.forEach(function (c) {

                var state = c.computerState;
                if (state>0){
                    var data = "<div class='goods fl mb20' style='border:2px solid #fff;width:230px;" +
                        "margin-right: 80px;margin-left:10px;cursor:pointer;' " +
                        "onmouseout=\"this.style.border='2px solid #fff'\" onmousemove=\"this.style.border='2px solid #a6e1ec'\">";
                    data += "<div class='sub_goods'><a href='/computer/details?id="+c.computerId+"' target='_blank' style='text-decoration: none;" +
                        "text-align: center'><img style='object-fit: inherit;" +
                        "width: 100%;height: 35%;margin-top: 10px' src='/static/image/"+c.computerImage+"' alt=\"\"></a></div>";
                    data += "<div id='bid' data-bid='"+c.computerBrandId+"' class=\"youhui\">"+c.computerName+"</div>";
                    data += "<div class=\"jiage\">"+c.computerPrice+"<i style=\"margin-left: 10px\" class=\"layui-icon layui-icon-rmb\"></i></div></div>";
                    $("#all").append(data)
                }
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


    layui.use(['carousel', 'form','element'], function() {
        var carousel = layui.carousel
            , form = layui.form;
        var element = layui.element;
        //常规轮播
        carousel.render({
            elem: '#test1'
            , arrow: 'always'
        });

        //改变下时间间隔、动画类型、高度
        carousel.render({
            elem: '#test2'
            , interval: 1800
            , anim: 'fade'
            , height: '60%'
            , width: '65%'
        });
        //设定各种参数
        var ins3 = carousel.render({
            elem: '#test3'
        });
        //图片轮播
        carousel.render({
            elem: '#test10'
            ,width: '70%'
            ,height: '40%'
            ,interval: 2000
        });
    });
</script>
</body>
</html>
