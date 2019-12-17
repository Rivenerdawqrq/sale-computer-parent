package com.controller.admin;

import com.entity.ComputerBrand;
import com.entity.ComputerInfo;
import com.github.pagehelper.PageInfo;
import com.service.AdminHomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class HomeController {
    public static final String FILE_DIRECTORY = "E:\\project\\sale-computer-parent\\sale-computer-web\\src\\main\\resources\\static\\image";
    @Autowired
    private AdminHomeService computerService;
    @RequestMapping("/home")
    //进入首页就加载所有品牌
    public String index(Model model){
        List<ComputerBrand> allBrand = computerService.getAllBrand();
        model.addAttribute("brand",allBrand);
        return "/admin/index";
    }

    @RequestMapping("/list")
    @ResponseBody
    //所有电脑+分页
    public PageInfo<ComputerInfo> getAll(@RequestParam(value = "pageNum",required = false,defaultValue = "1") int pageNum,
                                         @RequestParam(value = "pageSize",required = false,defaultValue = "2")int pageSize,
                                         HttpServletRequest res){
        List<ComputerInfo> all = computerService.getAll(pageNum, pageSize);
        PageInfo<ComputerInfo> pageInfo = new PageInfo<>(all, 3);
        HttpSession session = res.getSession();
        session.setAttribute("thisPageNum",pageNum);
        return pageInfo;
    }


    @RequestMapping("/getComputerByBrand")
    @ResponseBody
    //根据品牌获得电脑+分页
    public PageInfo<ComputerInfo> getComputerByBrand(int pageNum,int pageSize ,int bid){
        List<ComputerInfo> all = computerService.getComputerByBrand(pageNum,pageSize,bid);
        PageInfo<ComputerInfo> pageInfo = new PageInfo<>(all, 2);
        return pageInfo;
    }
    @RequestMapping("/image")
    //根据编号获得电脑图片
    public String getImage(Model model,@RequestParam(required = false,
            value = "id",defaultValue = "404") int id){
        String image = computerService.getImage(id);
        model.addAttribute("image",image);
        return "/admin/list_image";
    }
    @RequestMapping("/add")
    public String add(){
        return "admin/add";
    }

    @RequestMapping("/getAllBrand")
    public String getAllBrand(Model model){
        List<ComputerBrand> allBrand = computerService.getAllBrand();
        model.addAttribute("allBrand",allBrand);
        return "admin/list_Brand";
    }

    @RequestMapping("/insert")
    //添加
    public ModelAndView insert(@Valid ComputerInfo computerInfo, BindingResult bindingResult,
                               MultipartFile myFile,RedirectAttributes redirectAttributes) throws IOException {
        ModelAndView modelAndView = new ModelAndView();
        if (bindingResult.hasErrors()){
            List<FieldError> fieldErrors = bindingResult.getFieldErrors();
            for (FieldError fieldError : fieldErrors) {
                modelAndView.addObject(fieldError.getField(),fieldError.getDefaultMessage());
            }
            modelAndView.addObject("computerInfo",computerInfo);//将填写的信息返回去
            modelAndView.setViewName("/admin/add");
        }else {
            //得到上传过来的文件名
            String filename = myFile.getOriginalFilename();
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmssSS");
            //用来给文件名加上时间戳,防止重名
            String timeStamp = simpleDateFormat.format(new Date());
            String path =   FILE_DIRECTORY + File.separator + timeStamp+ filename;
            File file = new File(path);
            try {
                myFile.transferTo(file);
            } catch (IOException e) {
                e.printStackTrace();
            }
            computerInfo.setComputerImage(timeStamp+filename);
            computerService.insert(computerInfo);
            redirectAttributes.addFlashAttribute("ok","alert('添加成功')");//闪存
            modelAndView.setViewName("redirect:/admin/add");
        }
        return modelAndView;
    }



    //修改
    //把原本的数据穿到edit页面
    @RequestMapping("/edit")
    public ModelAndView edit(int id){
        ModelAndView modelAndView = new ModelAndView();
        ComputerInfo computerById = computerService.getComputerById(id);
        modelAndView.addObject("byId",computerById);
        modelAndView.setViewName("/admin/edit");
        return modelAndView;
    }
    //修改
    @RequestMapping("/update")
    public ModelAndView update(@Valid ComputerInfo computerInfo,BindingResult bindingResult,
                               MultipartFile myFile,RedirectAttributes redirectAttributes){
        ModelAndView modelAndView = new ModelAndView();
        if (bindingResult.hasErrors()) {
            List<FieldError> fieldErrors = bindingResult.getFieldErrors();
            for (FieldError fieldError : fieldErrors) {
                modelAndView.addObject(fieldError.getField(),fieldError.getDefaultMessage());
            }
            modelAndView.addObject("computerInfo",computerInfo);//将填写的信息返回去
            modelAndView.addObject("fail","修改失败啦");
            modelAndView.setViewName("/admin/edit");
        }else {
            //得到上传的文件名
            String filename = myFile.getOriginalFilename();
            computerInfo.setComputerImage(filename);
            computerService.update(computerInfo);
           modelAndView.addObject("ok","修改成功啦");
            modelAndView.setViewName("forward:/admin/home");

        }
        return modelAndView;

    }
    @RequestMapping("/del")
    public String del(@RequestParam(value = "id", required = false) int id){
        computerService.delete(id);
        return "/admin/index";
    }
}
