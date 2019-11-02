package com.zw.back.service.impl;

import com.zw.back.dao.IUserDao;
import com.zw.back.po.Paging;
import com.zw.back.po.User;
import com.zw.back.po.UserPage;
import com.zw.back.service.IUserService;
import com.zw.back.util.PageUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Service
@Transactional
public class UserServiceImpl implements IUserService {
    @Resource
    private IUserDao userDao;
    @Override
    public User login(User user) {
        return userDao.login(user);
    }

    @Override
    public UserPage getList(String uname, Integer pagenow) {
        UserPage userPage = new UserPage();
        userPage.setUsername(uname);
        userPage.setPagenow(pagenow);
        userPage.setPagesize(15);
        userPage.setPageall((userPage.getPagenow()-1)*userPage.getPagesize());
        userPage.setUsers(userDao.getList(userPage));
        userPage.setTotal(userDao.getListCount(userPage));
        Paging paging=PageUtil.pageUtil.getPaging(userPage);
        userPage.setPaging(paging);
        return userPage;
    }

    @Override
    public void updata(User user) {
        userDao.updata(user);
    }
}
