package com.controller;

import com.entity.ComputerInfo;
import com.github.pagehelper.PageInfo;
import com.service.ComputerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {
    //自动装配
    @Autowired
    private ComputerService computerService;
    @RequestMapping("/list")
    public String index(@RequestParam(value = "pageNum",
            required = false,defaultValue = "1") int pageNum,
                        @RequestParam(value = "pageSize",
                                required = false,defaultValue = "2") int pageSize, Model model){
        List<ComputerInfo> all = computerService.getAll(pageNum, pageSize);
        PageInfo<ComputerInfo> computerInfoPageInfo = new PageInfo<>(all, 5);
        model.addAttribute("pageInfo",computerInfoPageInfo);
        return "admin/index";
    }

    @RequestMapping("/add")
    private String add(){
        return "admin/add";
    }


}
