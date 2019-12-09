package com.service;

import com.entity.ComputerBrand;
import com.entity.ComputerInfo;

import java.util.List;

public interface ComputerService {
    List<ComputerInfo> getAll(int pageNum,int pageSize);
    void insert(ComputerInfo c);
    List<ComputerInfo> getComputerByBrand(int pageNum,int pageSize,int bid);
    List<ComputerBrand> getAllBrand();
}
