package com.controller.admin;

import com.entity.ComputerBrand;
import com.service.AddBrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AddBrandController {

    public static final String FILE_DIRECTORY = "D:\\learn\\project\\sale-computer-parent\\sale-computer-web\\src\\main\\resources\\static\\image\\brand";

    @Autowired
    private AddBrandService addBrandService;

    @RequestMapping("/addBrand")
    public String addBrand(){
        return "admin/add_brand";
    }

    @PostMapping("/BrandInsert")
    public ModelAndView insertBrand(@Valid ComputerBrand computerBrand, BindingResult bindingResult,
                                    MultipartFile myFile, RedirectAttributes redirectAttributes){
        ModelAndView modelAndView = new ModelAndView();
        if (bindingResult.hasErrors()) {
            List<FieldError> fieldErrors = bindingResult.getFieldErrors();
            for (FieldError fieldError : fieldErrors) {
                modelAndView.addObject(fieldError.getField(),fieldError.getDefaultMessage());
            }
            modelAndView.addObject("computerBrand",computerBrand);//将输入的信息返回去
            modelAndView.setViewName("admin/add_brand");
        }else {
            //得到上传过来的文件名
            String filename = myFile.getOriginalFilename();
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmssSS");
            //用来给文件名加上时间戳,防止重名
            String timeStamp = simpleDateFormat.format(new Date());
            String path =   FILE_DIRECTORY + File.separator + timeStamp+ filename;
            File file = new File(path);
            try {
                myFile.transferTo(file);//上传文件
            } catch (IOException e) {
                e.printStackTrace();
            }
            computerBrand.setBrandImage(timeStamp+filename);
            addBrandService.insertBrand(computerBrand);
            redirectAttributes.addFlashAttribute("addBrand","alert('添加成功啦')");
            modelAndView.setViewName("redirect:/admin/addBrand");
        }
        return modelAndView;
    }
}
