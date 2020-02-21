<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/18
  Time: 16:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>会员注册</title>
    <link rel="stylesheet" type="text/css" href="/static/css/computer/login.css">
    <link rel="stylesheet" type="text/css" href="/static/layui/layui.css">
    <script src="/static/js/jquery-3.4.1.js"></script>
    <style>
        .regist .regist_center .regist_submit{margin: 20px auto;}
        .regist .regist_center .button{
            border:none;width: 440px;height: 45px;
            margin-left:45px;background: #ff6700;
            color: #fff; font-size: 22px;
            font-weight: bold;letter-spacing: 8px;cursor:pointer;
        }
        .regist .regist_center .button:hover{border:1px solid #ccc;}
    </style>
</head>
<body>

    <div class="regist">
        <div class="regist_center">
            <div class="regist_top">
                <div class="left fl">会员注册</div>
                <div class="right fr"><a href="/computer/home" target="_self"><img src="/static/image/logo.png"></a></div>
                <div class="clear"></div>
                <div class="xian center"></div>
            </div>
            <form  method="post" action="/user/phoneRegister">
            <div class="regist_main center">
                <div class="username">
                    用&nbsp;&nbsp;户&nbsp;&nbsp;名:&nbsp;&nbsp;
                    <input class="shurukuang" id="accountName" required type="text" name="accountName" placeholder="请输入6位以上字符"/>
                    <span id="checkAccountName">${accountName}</span>
                </div>
                <div class="username">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:&nbsp;&nbsp;
                    <input class="shurukuang" type="password" required id="password"  name="accountPwd" placeholder="请输入6位以上字符"/>
                    <span>${accountPwd}</span>
                </div>

                <div class="username">确认密码:&nbsp;&nbsp;
                    <input class="shurukuang" type="password" required id="password2"  placeholder="请确认你的密码"/>
                    <span id="checkPwd"></span>
                </div>
                <div class="username">手&nbsp;&nbsp;机&nbsp;&nbsp;号:&nbsp;&nbsp;
                    <input id="accountPhone" class="shurukuang" required type="text" name="accountPhone"
                           onkeyup="value=value.replace(/[^\d.]/g,'')" 
                           onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d.]/g,''))"
                           placeholder="请填写正确的手机号"/>
                    <span id="checkAccountPhone">${accountPhone}</span>
                </div>
                <div class="username">验&nbsp;&nbsp;证&nbsp;&nbsp;码:&nbsp;&nbsp;
                    <input type="text" id="registerCode" class="shurukuang code" required  placeholder="输入短信验证码"
                           style="display:inline;" autocomplete="off"/>
                    <button type="button"   id="getCode" class="layui-btn code" style="height: 31px; margin-bottom: 2px">获取验证码</button>
                    <span style="margin-left: 87px;display: block" id="errorCode"></span>
                </div>
            </div>
            <div class="regist_submit">
                <button class="button" type="submit"  id="register"  >立即注册</button>
            </div>
        </form>
    </div>
    </div>

<script>
    $(function () {
        //检测用户名有没有被注册
        checkAccountName()

        //确认密码
        checkPassword()
        //获得验证码
        getCode()
        //验证码是否正确
        checkCode()
    })

    //验证码是否正确
    function checkCode() {
        $(".code").on('keyup',function () {
            $.ajax({
                method:"POST",
                url:"/user/checkMessage",
                data:{
                    code:$(".code").val()
                }
            }).done(function (res) {
                if (res!="true"){
                    $("#register").attr("type","button")
                    $("#errorCode").html("验证码有误")
                }else {
                    $("#register").attr("type","submit")
                    $("#errorCode").html(null)
                }
            }).fail(function () {
                $("#checkAccountPhone").html("发送失败")
                $("#register").attr("type","button")
            })
        })
    }
    //获取验证码
    function getCode() {
        $("#getCode").on('click',function () {
            //检测手机验证码有没有被注册
            $.ajax({
                type:"POST",
                url:"/user/checkAccountPhone?accountPhone="+$("#accountPhone").val()
            }).done(function (res) {
                if (res.accountPhone!=null){
                    $("#checkAccountPhone").html("该手机号码已经注册");
                    $("#register").attr("type","button")
                }else {
                    $("#checkAccountPhone").html("");
                    $("#register").attr("type","submit")
                    $("#getCode").removeAttr("disabled");
                    //发送短信
                    $.ajax({
                        method:"POST",
                        url:"/user/sendMessage",
                        data:{
                            accountPhone:$("#accountPhone").val()
                        }
                    }).done(function (res) {
                        if (res=="true"){//发送成功
                            time()
                        }else {//发送失败
                            $("#checkAccountPhone").html("请输入正确的手机号码")
                        }
                    })
                }
            })

        })
    }
    //检测用户名有没有注册
    function checkPassword() {
       $("#password2").on('keyup',function () {
           var password = $("#password").val();
           var password2 = $("#password2").val();
           if (password != password2){
               $("#checkPwd").html("输入密码不一致")
               $("#register").attr("type","button")
           } else {
               $("#checkPwd").html(null)
               $("#register").attr("type","submit")
           }
       })
    }
    function checkAccountName() {
        //检测该用户名有没有被注册
        $("#accountName").on('keyup',function () {
            $.ajax({
                type:"POST",
                url:"/user/checkAccountName",
                data:{
                    accountName:$("#accountName").val()
                }
            }).done(function (res) {
                if (res.accountName!=null){
                    $("#checkAccountName").html("该用户名已经被注册啦");
                    $("#register").attr("type","button")
                }else {
                    $("#checkAccountName").html(null);
                    $("#register").attr("type","submit")
                }
            })
        })
    }
    var wait = 60;
    //倒计时重新获取验证码
    function time(obj) {
        if (wait == 0) {
            $("#getCode").removeAttr("disabled");
            $("#getCode").html("重新获取");
            $("#getCode").removeClass("layui-btn layui-btn-radius layui-btn-disabled");
            $("#getCode").addClass("layui-btn");
            wait = 60;
        } else {
            console.log(wait);
            $("#getCode").attr("disabled", "true");
            $("#getCode").html(wait + "s")
            $("#getCode").attr("class","layui-btn layui-btn-radius layui-btn-disabled");
            wait--;
            setTimeout(function () {//倒计时的方法
                time(obj);
            }, 1000);        //1s
        }
    }

</script>
</body>
</html>
