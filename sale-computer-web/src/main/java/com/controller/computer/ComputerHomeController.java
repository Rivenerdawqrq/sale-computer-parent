package com.controller.computer;

import com.entity.ComputerBrand;
import com.entity.ComputerInfo;
import com.github.pagehelper.PageInfo;
import com.service.ComputerHomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/computer")
public class ComputerHomeController {
    @Autowired
    private ComputerHomeService computerHomeService;
    @RequestMapping("/home")
    public String index(Model model){
        List<ComputerBrand> allBrand = computerHomeService.getAllBrand();
        model.addAttribute("allBrand",allBrand);
        return "computer/computer_home";
    }
    //全部商品
    @RequestMapping("/getAll")
    @ResponseBody
    public PageInfo<ComputerInfo> getAll(@RequestParam(value = "pageNum",required = false,defaultValue = "1") int pageNum,
                                         @RequestParam(value = "pageSize",required = false,defaultValue = "9")int pageSize){
        List<ComputerInfo> all = computerHomeService.getAll(pageNum, pageSize);
        PageInfo<ComputerInfo> pageInfo = new PageInfo<>(all, 3);
        return pageInfo;
    }

    @RequestMapping("/getComputerByBrand")
    @ResponseBody
    //根据品牌获得电脑+分页
    public PageInfo<ComputerInfo> getComputerByBrand(int pageNum,int pageSize ,int bid){
        List<ComputerInfo> all = computerHomeService.getComputerByBrand(pageNum,pageSize,bid);
        PageInfo<ComputerInfo> pageInfo = new PageInfo<>(all, 2);
        return pageInfo;
    }


}
