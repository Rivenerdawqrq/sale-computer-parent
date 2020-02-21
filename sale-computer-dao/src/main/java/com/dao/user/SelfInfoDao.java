package com.dao.user;

import com.entity.OrderInfo;

import java.util.List;

public interface SelfInfoDao {
    List<OrderInfo> listOrderInfo(String accountName);
}
