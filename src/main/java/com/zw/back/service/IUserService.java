package com.zw.back.service;

import com.zw.back.po.User;
import com.zw.back.po.UserPage;

public interface IUserService {
    public User login(User user);
    UserPage getList(String uname,Integer pagenow);
    void updata(User user);
}
