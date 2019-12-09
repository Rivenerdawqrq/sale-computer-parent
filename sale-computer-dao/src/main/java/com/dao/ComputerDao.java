package com.dao;

import com.entity.ComputerBrand;
import com.entity.ComputerInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ComputerDao {
    List<ComputerInfo> getAll(@Param("pageNum")int pageNum,@Param("pageSize")int pageSize);
    //添加
    void insert(ComputerInfo c);
    //根据电脑牌子来查询
    List<ComputerInfo> getComputerByBrand(@Param("pageNum")int pageNum,@Param("pageSize")int pageSize,@Param("bid") int bid);

    //查询所有电脑牌子
    List<ComputerBrand> getAllBrand();
}
