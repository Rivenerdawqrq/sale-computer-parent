package com.service.impl;

import com.dao.ComputerDao;
import com.entity.ComputerInfo;
import com.service.ComputerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;
import java.util.List;
@Service
@Slf4j
public class ComputerServiceImpl implements ComputerService {

    @Autowired
    private ComputerDao dao;
    @Override
    public List<ComputerInfo> getAll(int pageNum, int pageSize) {
        return dao.getAll(pageNum, pageSize);
    }

    @Override
    public void insert(ComputerInfo c) {
        dao.insert(c);
    }
}
