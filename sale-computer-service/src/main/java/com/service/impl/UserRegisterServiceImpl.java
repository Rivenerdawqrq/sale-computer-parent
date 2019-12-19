package com.service.impl;

import com.dao.user.UserRegisterDao;
import com.entity.UserAccount;
import com.service.UserRegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserRegisterServiceImpl implements UserRegisterService {
    @Autowired(required = false)
    private UserRegisterDao dao;
    @Override
    public void userLogon(UserAccount userAccount) {
        dao.userLogon(userAccount);
    }
}
