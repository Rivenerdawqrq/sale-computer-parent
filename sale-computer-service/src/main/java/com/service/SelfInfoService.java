package com.service;

import com.entity.OrderInfo;

import java.util.List;

public interface SelfInfoService {
    List<OrderInfo> listOrderInfo(String accountName);
}
