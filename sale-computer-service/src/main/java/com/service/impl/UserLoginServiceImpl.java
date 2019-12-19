package com.service.impl;

import com.dao.user.UserLoginDao;
import com.entity.UserAccount;
import com.service.UserLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserLoginServiceImpl implements UserLoginService {
    @Autowired(required = false)
    private UserLoginDao userLoginDao;
    @Override
    public UserAccount login(UserAccount userAccount) {
        return userLoginDao.login(userAccount);
    }
}
