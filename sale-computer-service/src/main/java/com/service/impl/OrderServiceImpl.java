package com.service.impl;

import com.dao.computer.OrderDao;
import com.entity.OrderInfo;
import com.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderDao orderDao;



    @Override
    public void createOrder(Integer orderId, String accountName, Integer computerId, String orderDate, double price, Integer num, String phone, String address) {
        orderDao.createOrder(orderId,accountName,computerId,orderDate,price,num,phone,address);
    }
}
