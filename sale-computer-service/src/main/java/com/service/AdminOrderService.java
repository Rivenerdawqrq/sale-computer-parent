package com.service;

import com.entity.OrderInfo;

import java.util.List;

public interface AdminOrderService {
    List<OrderInfo> listOrder();
    //发货
    void deliverGoods(Integer orderId);
}
