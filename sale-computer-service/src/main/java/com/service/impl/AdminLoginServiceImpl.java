package com.service.impl;

import com.dao.admin.AdminHomeDao;
import com.dao.admin.AdminLoginDao;
import com.entity.AdminInfo;
import com.service.AdminLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminLoginServiceImpl implements AdminLoginService {
    @Autowired(required = false)
    private AdminLoginDao adminLoginDao;
    @Override
    public AdminInfo adminLogin(AdminInfo adminInfo) {
        return adminLoginDao.adminLogin(adminInfo);
    }
}
