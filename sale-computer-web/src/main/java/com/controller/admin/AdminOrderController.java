package com.controller.admin;

import com.entity.OrderInfo;
import com.service.AdminOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminOrderController {
    @Autowired
    private AdminOrderService orderService;

    @RequestMapping("/listOrder")
    public ModelAndView listOrder(){
        ModelAndView modelAndView = new ModelAndView();
        List<OrderInfo> orderInfos = orderService.listOrder();
        modelAndView.addObject("list",orderInfos);
        modelAndView.setViewName("/admin/order");
        return modelAndView;
    }

    @RequestMapping("/deliver")
    @ResponseBody
    public String deliver(Integer orderId){
        orderService.deliverGoods(orderId);
        return "ok";
    }
}
