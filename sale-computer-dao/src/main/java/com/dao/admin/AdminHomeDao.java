package com.dao.admin;

import com.entity.ComputerBrand;
import com.entity.ComputerInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdminHomeDao {
    List<ComputerInfo> getAll(@Param("pageNum")int pageNum,@Param("pageSize")int pageSize);
    //添加
    void insert(ComputerInfo computerInfo);
    //根据电脑牌子来查询
    List<ComputerInfo> getComputerByBrand(@Param("pageNum")int pageNum,@Param("pageSize")int pageSize,@Param("bid") int bid);

    //查询所有电脑牌子
    List<ComputerBrand> getAllBrand();
    //根据编号查询电脑图片
    String getImage(@Param("id") int id);
    //根据编号查询电脑
    ComputerInfo getComputerById(int id);
    //根据编号来删\除
    void delete(int id);

    void update(ComputerInfo computerInfo);

}
