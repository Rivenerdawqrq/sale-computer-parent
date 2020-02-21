package com.dao.admin;

import com.entity.OrderInfo;

import java.util.List;

public interface AdminOrderDao {
    List<OrderInfo> listOrder();
    //发货
    void deliverGoods(Integer orderId);
}
