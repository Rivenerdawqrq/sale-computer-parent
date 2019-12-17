package com.service;

import com.entity.ComputerBrand;
import com.entity.ComputerInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdminHomeService {
    List<ComputerInfo> getAll(int pageNum,int pageSize);
    void insert(ComputerInfo computerInfo);
    List<ComputerInfo> getComputerByBrand(int pageNum,int pageSize,int bid);
    List<ComputerBrand> getAllBrand();
    String getImage(int id);

    //根据编号查询电脑
    ComputerInfo getComputerById(int id);
    //根据编号来删除
    void delete( int id);
    void update(ComputerInfo computerInfo);
}
