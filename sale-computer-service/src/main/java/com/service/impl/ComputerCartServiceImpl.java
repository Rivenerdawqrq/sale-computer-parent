package com.service.impl;

import com.dao.computer.ComputerCartDao;
import com.entity.ComputerCart;
import com.entity.ComputerInfo;
import com.service.ComputerCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ComputerCartServiceImpl implements ComputerCartService {
    @Autowired
    private ComputerCartDao cartDao;

    @Override
    public ComputerCart checkExist(Integer computerId) {
        return cartDao.checkExist(computerId);
    }

    @Override
    public void addToCart(ComputerCart cart) {
        cartDao.addToCart(cart);
    }

    @Override
    public void addOne(Integer computerId) {
        cartDao.addOne(computerId);
    }

    @Override
    public List<ComputerInfo> listCart(String accountName) {
        return cartDao.listCart(accountName);
    }

    @Override
    public void remove(Integer computerId) {
        cartDao.remove(computerId);
    }


}
