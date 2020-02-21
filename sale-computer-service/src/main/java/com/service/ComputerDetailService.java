package com.service;

import com.entity.ComputerInfo;


public interface ComputerDetailService {
    //按编号查询此电脑信息
    ComputerInfo getDetailsById(Integer id);
}
