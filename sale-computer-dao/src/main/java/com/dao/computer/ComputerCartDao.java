package com.dao.computer;

import com.entity.ComputerCart;
import com.entity.ComputerInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ComputerCartDao {
    ComputerCart checkExist(@Param("id") Integer computerId);
    void addToCart(ComputerCart cart);
    void addOne(@Param("computerId")Integer computerId);
    List<ComputerInfo> listCart(@Param("accountName")String accountName);
    void remove(Integer computerId);
}
