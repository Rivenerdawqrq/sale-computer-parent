package com.controller.user;

import com.entity.UserAccount;
import com.service.UserRegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
}
