package com.service.impl;

import com.dao.admin.AdminOrderDao;
import com.entity.OrderInfo;
import com.service.AdminOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class AdminOrderServiceImpl implements AdminOrderService {
    @Autowired
    private AdminOrderDao adminOrderDao;

    @Override
    public List<OrderInfo> listOrder() {
        return adminOrderDao.listOrder();
    }

    @Override
    public void deliverGoods(Integer orderId) {
        adminOrderDao.deliverGoods(orderId);
    }
}
