package com.dao.computer;

import com.entity.ComputerInfo;
import org.apache.ibatis.annotations.Param;

public interface ComputerDetailsDao {
    //按编号查询此电脑信息
    ComputerInfo getDetailsById(@Param("id") Integer id);
}
