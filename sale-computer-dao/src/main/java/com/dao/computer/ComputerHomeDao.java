package com.dao.computer;

import com.entity.ComputerBrand;
import com.entity.ComputerInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ComputerHomeDao {
    List<ComputerInfo> getAll(@Param("pageNum")int pageNum, @Param("pageSize")int pageSize);
    //根据电脑牌子来查询
    List<ComputerInfo> getComputerByBrand(@Param("pageNum")int pageNum,@Param("pageSize")int pageSize,@Param("bid") int bid);

    List<ComputerBrand> getAllBrand();
}
