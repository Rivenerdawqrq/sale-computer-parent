package com.controller.admin;

import com.entity.AdminInfo;
import com.service.AdminLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class LoginController {

    @Autowired(required = false)
    private AdminLoginService adminLoginService;

    @RequestMapping("/login")
    public String login(){
        return "/admin/login";
    }
    @ResponseBody
    @RequestMapping("/checkLogin")
    public AdminInfo checkLogin(AdminInfo adminInfo,HttpSession session){
        AdminInfo adminInfo1 = adminLoginService.adminLogin(adminInfo);
        if (adminInfo1!=null){
            session.setAttribute("admin",adminInfo1);
            return adminInfo1;
        }
        return null;
    }
}
