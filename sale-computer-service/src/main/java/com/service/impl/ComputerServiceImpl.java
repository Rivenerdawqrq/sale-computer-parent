package com.service.impl;

import com.dao.ComputerDao;
import com.entity.ComputerBrand;
import com.entity.ComputerInfo;
import com.service.ComputerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;
import java.util.List;
@Service
@Slf4j
public class ComputerServiceImpl implements ComputerService {

    @Autowired(required = false)
    private ComputerDao dao;
    @Override
    public List<ComputerInfo> getAll(int pageNum, int pageSize) {
        return dao.getAll(pageNum, pageSize);
    }

    @Override
    public void insert(ComputerInfo c) {
        dao.insert(c);
    }

    @Override
    public List<ComputerInfo> getComputerByBrand(int pageNum, int pageSize, int bid) {
        return dao.getComputerByBrand(pageNum,pageSize,bid);
    }

    @Override
    public List<ComputerBrand> getAllBrand() {
        return dao.getAllBrand();
    }


}
