package com.service;

import com.entity.OrderInfo;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public interface OrderService {
        void createOrder( Integer orderId,String accountName,Integer computerId,
                          String orderDate,
                          double price, Integer num,
                          String phone, String address);

}
