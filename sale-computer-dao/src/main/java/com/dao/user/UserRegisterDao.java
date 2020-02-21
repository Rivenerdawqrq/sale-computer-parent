package com.dao.user;

import com.entity.UserAccount;

public interface UserRegisterDao {
    void userLogon(UserAccount userAccount);
    UserAccount checkAccountName(String accountName);
    UserAccount checkAccountPhone(String accountPhone);
}
