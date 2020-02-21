package com.controller.computer;

import com.entity.ComputerCart;
import com.entity.ComputerInfo;
import com.service.ComputerCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/computer")
public class ComputerCartController {
    @Autowired
    private ComputerCartService cartService;
    @RequestMapping("/cart")
    public ModelAndView cart(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/computer/computer_cart");
        return modelAndView;
    }
    @RequestMapping("/addToCart")
    @ResponseBody
    public String cart(ComputerCart cart, HttpSession session){
        Object userId = session.getAttribute("account");
        System.out.println(userId);
        cart.setAccountName((String) userId);
        cart.setNum(1);
        cartService.addToCart(cart);
        return "ok";
    }
    @RequestMapping("/check")
    @ResponseBody
    public ComputerCart check(Integer id){
        ComputerCart computerCart = cartService.checkExist(id);
        System.out.println(computerCart);
        return computerCart;
    }

    @RequestMapping("/addOne")
    @ResponseBody
    public String addOne(Integer id){
        cartService.addOne(id);
        return "ok";
    }

    @RequestMapping("/listCart")
    public ModelAndView listCart(String accountName){
        ModelAndView modelAndView = new ModelAndView();
        List<ComputerInfo> computerCarts = cartService.listCart(accountName);
        modelAndView.addObject("cart",computerCarts);
        modelAndView.setViewName("/computer/computer_cart");
        return modelAndView;
    }

    @RequestMapping("/remove")
    @ResponseBody
    public String remove(Integer goodsId){
        cartService.remove(goodsId);
        return "done";
    }

}
