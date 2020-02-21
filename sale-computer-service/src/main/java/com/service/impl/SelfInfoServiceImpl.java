package com.service.impl;

import com.dao.user.SelfInfoDao;
import com.entity.OrderInfo;
import com.service.SelfInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SelfInfoServiceImpl implements SelfInfoService {
    @Autowired
    private SelfInfoDao selfInfoDao;

    @Override
    public List<OrderInfo> listOrderInfo(String accountName) {
        return selfInfoDao.listOrderInfo(accountName);
    }
}
