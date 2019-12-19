package com.controller.computer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/computer")
public class ComputerHomeController {
    @RequestMapping("/home")
    public String index(){
        return "computer/computer_home";
    }
}
