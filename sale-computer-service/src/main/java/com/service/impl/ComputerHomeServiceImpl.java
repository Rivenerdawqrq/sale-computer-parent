package com.service.impl;

import com.dao.computer.ComputerHomeDao;
import com.entity.ComputerBrand;
import com.entity.ComputerInfo;
import com.service.ComputerHomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ComputerHomeServiceImpl implements ComputerHomeService {
    @Autowired
    private ComputerHomeDao computerHomeDao;

    @Override
    public List<ComputerInfo> getAll(int pageNum, int pageSize) {
        return computerHomeDao.getAll(pageNum, pageSize);
    }

    @Override
    public List<ComputerInfo> getComputerByBrand(int pageNum, int pageSize, int bid) {
        return computerHomeDao.getComputerByBrand(pageNum, pageSize, bid);
    }

    @Override
    public List<ComputerBrand> getAllBrand() {
        return computerHomeDao.getAllBrand();
    }
}
