package com.service.impl;

import com.dao.computer.ComputerDetailsDao;
import com.entity.ComputerInfo;
import com.service.ComputerDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ComputerDetailServiceImpl implements ComputerDetailService {
    @Autowired
    private ComputerDetailsDao detailsDao;
    @Override
    public ComputerInfo getDetailsById(Integer id) {
        return detailsDao.getDetailsById(id);
    }
}
