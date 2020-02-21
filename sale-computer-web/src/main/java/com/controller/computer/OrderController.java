package com.controller.computer;

import com.entity.OrderInfo;
import com.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderController {
    @Autowired
    private OrderService orderService;
    @PostMapping("/orderBatch")
    @ResponseBody
    public String order(@RequestParam(value = "orderId") Integer orderId, @RequestParam(value = "accountName")String accountName,
                       Integer computerId, @RequestParam(value = "orderDate")String orderDate,
                        @RequestParam(value = "price")double price,
                        @RequestParam(value = "num")Integer num,
                        @RequestParam(value = "phone")String phone,
                        @RequestParam(value = "address")String address){
       orderService.createOrder(orderId,accountName,computerId,orderDate,price,
               num,phone,address);
        return "ok";
    }
}
