package com.service.impl;

import com.dao.admin.AddBrandDao;
import com.entity.ComputerBrand;
import com.service.AddBrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AddBrandServiceImpl implements AddBrandService {
    @Autowired(required = false)
    private AddBrandDao addBrandDao;
    @Override
    public void insertBrand(ComputerBrand computerBrand) {
        addBrandDao.insertBrand(computerBrand);
    }
}
