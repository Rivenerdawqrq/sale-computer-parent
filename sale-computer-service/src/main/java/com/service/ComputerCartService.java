package com.service;

import com.entity.ComputerCart;
import com.entity.ComputerInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ComputerCartService {
    ComputerCart checkExist(Integer computerId);
    void addToCart(ComputerCart cart);
    void addOne(Integer computerId);
    List<ComputerInfo> listCart(String accountName);
    void remove(Integer computerId);
}
