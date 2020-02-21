package com.controller.user;

import com.entity.OrderInfo;
import com.service.SelfInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@RequestMapping("/user")
@Controller
public class UserSelfInfoController {
    @Autowired
    private SelfInfoService infoService;
    @RequestMapping("/self")
    public String self(){
        return "/user/self";
    }
    @RequestMapping("/listOrder")
    @ResponseBody
    public List<OrderInfo> listOrder(String accountName){
        List<OrderInfo> orderInfos = infoService.listOrderInfo(accountName);
        return orderInfos;
    }
}
