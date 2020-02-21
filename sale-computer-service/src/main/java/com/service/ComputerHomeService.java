package com.service;

import com.entity.ComputerBrand;
import com.entity.ComputerInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ComputerHomeService {
    List<ComputerInfo> getAll(int pageNum, int pageSize);
    List<ComputerInfo> getComputerByBrand(int pageNum, int pageSize,int bid);
    List<ComputerBrand> getAllBrand();
}
