package com.controller.user;

import com.entity.UserAccount;
import com.service.UserLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserLoginController {
    @Autowired
    private UserLoginService loginService;
    @ResponseBody
    @RequestMapping("/userLogin")
    //登陆
    public UserAccount index(UserAccount userAccount, HttpSession session){
        userAccount.setAccountPhone(userAccount.getAccountName());
        UserAccount userLogin = loginService.login(userAccount);
        System.out.println("test-----"+userLogin.getReceiptAddress());
        if (userLogin!=null){
            session.setAttribute("user",userLogin);
            session.setAttribute("account",userLogin.getAccountName());
            session.setAttribute("address",userLogin.getReceiptAddress());
            session.setAttribute("phone",userLogin.getReceiptPhone());
            return userLogin;
        }
        return userLogin;
    }

    @GetMapping("/logout")
    //退出操作
    public String logout(HttpSession session){
        session.removeAttribute("user");
        return "redirect:/computer/home";
    }
}
