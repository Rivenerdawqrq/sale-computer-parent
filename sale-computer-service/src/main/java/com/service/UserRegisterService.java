package com.service;

import com.entity.UserAccount;

public interface UserRegisterService {
    void userLogon(UserAccount userAccount);
    UserAccount checkAccountName(String accountName);
    UserAccount checkAccountPhone(String accountPhone);
}
