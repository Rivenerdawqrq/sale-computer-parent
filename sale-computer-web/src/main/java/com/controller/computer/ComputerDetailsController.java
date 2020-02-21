package com.controller.computer;

import com.entity.ComputerInfo;
import com.service.ComputerDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/computer")
public class ComputerDetailsController {
    @Autowired
    private ComputerDetailService detailService;
    @RequestMapping("/details")
    public ModelAndView details(Integer id){
        ModelAndView modelAndView = new ModelAndView();
        ComputerInfo detailsById = detailService.getDetailsById(id);
        modelAndView.addObject("details",detailsById);
        modelAndView.setViewName("/computer/computer_details");
        return modelAndView;
    }
}
