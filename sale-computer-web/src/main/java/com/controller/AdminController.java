package com.controller;

import com.entity.ComputerBrand;
import com.entity.ComputerInfo;
import com.github.pagehelper.PageInfo;
import com.service.ComputerService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private ComputerService computerService;

    @RequestMapping("/index")
    public String index(Model model){
        List<ComputerBrand> allBrand = computerService.getAllBrand();
        model.addAttribute("brand",allBrand);
        return "/admin/index";
    }

    @RequestMapping("/list")
    @ResponseBody
    public PageInfo<ComputerInfo> getAll(int pageNum,int pageSize){
        List<ComputerInfo> all = computerService.getAll(pageNum, pageSize);
        PageInfo<ComputerInfo> pageInfo = new PageInfo<>(all, 3);
        return pageInfo;
    }


    @RequestMapping("/getComputerByBrand")
    @ResponseBody
    public PageInfo<ComputerInfo> getComputerByBrand(int pageNum,int pageSize ,int bid){
        List<ComputerInfo> all = computerService.getComputerByBrand(pageNum,pageSize,bid);
        PageInfo<ComputerInfo> pageInfo = new PageInfo<>(all, 2);
        return pageInfo;
    }

    @RequestMapping("/add")
    public String add(){
        return "admin/add";
    }



    @RequestMapping("/insert")
    public String insert(ComputerInfo computerInfo){
        return "hhh";
    }


}
