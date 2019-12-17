package com.service.impl;

import com.dao.admin.AdminHomeDao;
import com.entity.ComputerBrand;
import com.entity.ComputerInfo;
import com.service.AdminHomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;
import java.util.List;
@Service
public class AdminHomeServiceImpl implements AdminHomeService {

    @Autowired(required = false)
    private AdminHomeDao dao;
    @Override
    public List<ComputerInfo> getAll(int pageNum, int pageSize) {
        return dao.getAll(pageNum, pageSize);
    }

    @Override
    public void insert(ComputerInfo computerInfo) {
        dao.insert(computerInfo);
    }

    @Override
    public List<ComputerInfo> getComputerByBrand(int pageNum, int pageSize, int bid) {
        return dao.getComputerByBrand(pageNum,pageSize,bid);
    }

    @Override
    public List<ComputerBrand> getAllBrand() {
        return dao.getAllBrand();
    }

    @Override
    public String getImage(int id) {
        return dao.getImage(id);
    }


    @Override
    public ComputerInfo getComputerById(int id) {
        return dao.getComputerById(id);
    }

    @Override
    public void delete(int id) {
        dao.delete(id);
    }

    @Override
    public void update(ComputerInfo computerInfo) {
        dao.update(computerInfo);
    }


}
