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
</head>
<body>
<form  method="post" action="/user/phoneRegister">
    <div class="regist">
        <div class="regist_center">
            <div class="regist_top">
                <div class="left fl">会员注册</div>
                <div class="right fr"><a href="/computer/home" target="_self"><img src="/static/image/logo.png"></a></div>
                <div class="clear"></div>
                <div class="xian center"></div>
            </div>
            <div class="regist_main center">
                <div class="username">
                    用&nbsp;&nbsp;户&nbsp;&nbsp;名:&nbsp;&nbsp;
                    <input class="shurukuang" type="text" name="accountName" placeholder="请输入6位以上字符"/>
                    <span>${accountName}</span>
                </div>
                <div class="username">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:&nbsp;&nbsp;
                    <input class="shurukuang" type="password" name="accountPwd" placeholder="请输入6位以上字符"/>
                    <span>${accountPwd}</span>
                </div>

                <div class="username">确认密码:&nbsp;&nbsp;
                    <input class="shurukuang" type="password"  placeholder="请确认你的密码"/>
                    <span>两次密码要输入一致哦</span>
                </div>
                <div class="username">手&nbsp;&nbsp;机&nbsp;&nbsp;号:&nbsp;&nbsp;
                    <input class="shurukuang" type="text" name="accountPhone"
                           onkeyup="value=value.replace(/[^\d.]/g,'')" 
                           onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d.]/g,''))" placeholder="请填写正确的手机号"/><button>获取验证码</button>
                    <span>${accountPhone}</span></div>
            </div>
            <div class="regist_submit">
                <input class="submit" type="submit" name="submit" value="立即注册" >
            </div>
        </div>
    </div>
</form>
</body>
</html>
