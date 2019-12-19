package com.dao.user;

import com.entity.UserAccount;

public interface UserLoginDao {
    UserAccount login(UserAccount userAccount);
}
