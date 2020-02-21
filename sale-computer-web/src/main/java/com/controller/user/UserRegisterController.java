package com.controller.user;

import com.entity.UserAccount;
import com.service.UserRegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import sendMessage.SendSms;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserRegisterController {

    @Autowired(required = false)
    private UserRegisterService userRegisterService;
    @RequestMapping("/logon")
    public String register(){
        return "user/register";
    }
    @ResponseBody
    @RequestMapping("/phoneRegister")
    public ModelAndView check(@Valid UserAccount userAccount, BindingResult bindingResult,
                              RedirectAttributes redirectAttributes){
        ModelAndView modelAndView = new ModelAndView();
        if (bindingResult.hasErrors()){
            List<FieldError> fieldErrors = bindingResult.getFieldErrors();
            for (FieldError fieldError : fieldErrors) {
                modelAndView.addObject(fieldError.getField(),fieldError.getDefaultMessage());
                modelAndView.setViewName("user/register");
            }
        }else {
            userRegisterService.userLogon(userAccount);
            redirectAttributes.addFlashAttribute("ok","alert('注册成功啦')");
            modelAndView.setViewName("redirect:/computer/home");
        }
        return modelAndView;
    }
    @ResponseBody
    @PostMapping("/checkAccountName")
    public UserAccount checkAccountName(@RequestParam("accountName") String accountName){
        UserAccount userAccount = userRegisterService.checkAccountName(accountName);
        System.out.println("输出"+userAccount);
        return userAccount;
    }
    @ResponseBody
    @PostMapping("/checkAccountPhone")
    public UserAccount checkAccountPhone(@RequestParam("accountPhone")String accountPhone){
        UserAccount userAccount = userRegisterService.checkAccountPhone(accountPhone);
        System.out.println("输出"+userAccount);
        return userAccount;
    }

    @ResponseBody
    @RequestMapping("/sendMessage")
    public String send(@RequestParam("accountPhone") String phone, HttpSession session){
        SendSms sendSms = new SendSms();
        String randomForSix = SendSms.getRandomForSix();
        String send = sendSms.send(phone, randomForSix);
        System.out.println("验证码"+randomForSix);
        if (send.equalsIgnoreCase("ok")){
            System.out.println("发送验证码成功");
            session.setAttribute("code",randomForSix);
            session.setAttribute("time",System.currentTimeMillis());
            return "true";
        }else {
            System.out.println("发送验证码失败");
            return null;
        }
    }
    @ResponseBody
    @RequestMapping("/checkMessage")
    public String checkMessage(@RequestParam("code") String code,HttpSession session){
        System.out.println("传过来的"+code);
        String code1 = String.valueOf(session.getAttribute("code"));
        System.out.println(code1);
        Double time = Double.valueOf((Long) session.getAttribute("time"));
        Double l = Double.valueOf(System.currentTimeMillis());
        if (code.equalsIgnoreCase(code1)){
            System.out.println("---1..校验通过");
            if (time-l<=(1000*60)){
                System.out.println("2..时间校验有效(未超过一分钟)");
                return "true";
            }else {
                System.out.println("已经超过一分钟（无效）");
                return "invalid";
            }
        }else {
            System.out.println("不一致");
            return "fail";
        }
    }



//

}
