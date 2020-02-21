<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hj   li
  Date: 2020/2/3
  Time: 12:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>购物车</title>
    <script src="/static/js/jquery-3.4.1.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>
    <script src="/static/layui/layui.js"></script>
    <link href="/static/css/computer/style.css" rel="stylesheet" type="text/css">
    <link href="/static/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="/static/layui/css/layui.css" rel="stylesheet" type="text/css">
    <style>
        .input-num{
            width: 58px;
            height: 26px;
            color: #333;
            border-left: 0;
            border-right: 0;
        }
        .num-jia,.num-jian{
            display: inline-block;
            width: 28px;
            height: 28px;
            line-height: 28px;
            text-align: center;
            font-size: 18px;
            color: #999;
            cursor: pointer;
            border: 1px solid #e6e6e6;
        }
        .add_mi{
            height: 106px;
            margin-right: 5px;
            background: url(static/image/mail.jpg) no-repeat;
            padding: 6px 17px;
        }
    </style>
</head>
<body>
<div class="banner_x center">
    <a href="/computer/home"><div class="logo fl" style="width: 100px"></div></a>

    <div class="wdgwc fl ml40">我的购物车</div>
    <div class="clear"></div>
</div>
<div class="xiantiao"></div>
<div class="gwcxqbj">
    <div class="gwcxd center">
        <div class="top2 center">
            <div class="sub_top fl" style="display: none">
                <input type="checkbox" value="quanxuan" class="quanxuan" />全选
            </div>
            <div class="sub_top fl">商品名称</div>
            <div class="sub_top fl" style="margin-left: 290px"><span style="margin-left: 20px">单价</span></div>
            <div class="sub_top fl" style="margin-left: 100px">数量</div>
            <div class="sub_top fl" style="margin-left: 80px">小计</div>
            <div class="sub_top fr" style="margin-left: -40px"><span style="margin-left: -100px">操作</span></div>
            <div class="clear"></div>
        </div>
        <c:forEach items="${cart}" var="c" varStatus="status">
            <div class="content2 center">
                <span class="id"  style="display: none">${c.computerId}</span>
                <div class="sub_content fl " style="display: none">
                    <input type="checkbox"  name="choose" style="margin-top: 46px"  class="quanxuan" />
                </div>
                <div class="sub_content fl"><img style="object-fit: cover;width: 250%;height: 70%;margin-top: 16px" src="/static/image/${c.computerImage}"></div>
                <div class="sub_content fl ft20" style="margin-left: 50px"><span style="margin-left: 35px">${c.computerName}</span></div>
                <div class="sub_content fl price"style="margin-left: 40px">${c.computerPrice}</div>
                <div class="sub_content fl danjia">
                    <div style="width: 300px;height: 100px;margin-left: -10px">
                        <span id="num-jian" style="padding-bottom:10px" class="num-jian">-</span>
                        <input class="input-num"  name="num" style="margin-top: 40px;" type="text" value="${c.num}">
                        <span id="num-jia" style="" class="num-jia">+</span>
                    </div>
                </div>
                <div class="sub_content fl sum" style="margin-left: 150px"></div>
                <div class="sub_content fl"><a style="margin-left:-20px" class="remove" data-id="${c.computerId}">×</a></div>
                <div class="clear"></div>
            </div>
        </c:forEach>

    </div>
    <div class="jiesuandan mt20 center">
        <div class="tishi fl ml20">
            <ul>
                <li><a href="/computer/home">继续购物</a></li>
                <div class="clear"></div>
            </ul>
        </div>
        <div class="jiesuan fr">
            <div class="jiesuanjiage fl">合计：<span id="priceSum"></span></div>
            <div class="jsanniu fr"><input class="jsan" type="submit" name="jiesuan"  value="生成订单"/></div>
            <div class="clear"></div>
        </div>
        <div class="clear"></div>
    </div>

</div>
<script>
    $(function () {
        addAndReduce()
        remove()
       price()
        orderBatch()
    })
    //随机数
    function RndNum(n){
        var rnd="";
        for(var i=0;i<n;i++)
            rnd	+=	Math.floor(Math.random()*10);
        return rnd;
    }
    function orderBatch() {
        $(".jsan").click(function () {
            var $content2 = $(".content2");
            var $id = $(".id");
            var $price = $(".sum");
            var $input = $("input[type='text']");
            var num = document.getElementsByName("num");
            var number = Math.random();
            var date = new Date();
            var date1 = date.toLocaleDateString()
            alert(date1)
            for (i = 0;i<$content2.length;i++){
                $.ajax({
                    type:"POST",
                    url:"/order/orderBatch",
                    data:{
                        orderId:RndNum(8)+i,
                        accountName:"${account}",
                        computerId:$id[i].innerHTML,
                        orderDate:date1,
                        price:$price[i].innerHTML,
                        num:num[i].value,
                        phone:"${phone}",
                        address:"${address}"
                    }
                }).done(function (res) {
                    window.location.href = "/user/self"
                })
            }
            alert("订单已生成")

        })
    }
    //总价
    function priceSum() {
        var price = document.getElementsByClassName("sum");
        var sum = 0
        for (i = 0; i < price.length; i++) {
            sum =sum + parseInt(price[i].innerText)
        }
        $("#priceSum").html(sum+"元")
    }
    //小计
    function price() {
        var danjia = $(".price")
        var sum = $(".sum")
        var els =document.getElementsByName("num");
        for (i = 0; i < sum.length; i++) {
            var innerText = danjia[i].innerText;
            sum[i].innerText = innerText*els[i].value
        }
        priceSum()
    }
    //商品数量增加与减少
    function addAndReduce() {
        $(".num-jia").click(function () {
            var data = $(this).siblings(".input-num")
                data.val(parseInt(data.val())+1)
            price()
        })
        $(".num-jian").click(function () {
            var data = $(this).siblings(".input-num")
            if (data.val()>1) {
                data.val(parseInt(data.val()) - 1)
                price()
            }
        })
    }
    //移除
    function remove(e) {
        $(".remove").click(function () {
            $.ajax({
                type:"POST",
                url:"/computer/remove",
                data:{
                    goodsId:$(this).attr("data-id")
                }
            }).done(function (res) {
                if (res==="done"){
                    location.reload()
                }
            })
        })

    }

</script>



</body>
</html>
