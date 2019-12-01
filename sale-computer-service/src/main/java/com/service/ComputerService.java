package com.service;

import com.entity.ComputerInfo;

import java.util.List;

public interface ComputerService {
    List<ComputerInfo> getAll(int pageNum,int pageSize);
    void insert(ComputerInfo c);
}
