package com.dao;

import com.entity.ComputerInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ComputerDao {
    List<ComputerInfo> getAll(@Param("pageNum")int pageNum,@Param("pageSize")int pageSize);

    //添加
    void insert(ComputerInfo c);


}
