package com.zw.back.dao;

import com.zw.back.po.User;
import com.zw.back.po.UserPage;
import org.apache.ibatis.annotations.Mapper;

import javax.annotation.Resource;
import java.util.List;

@Mapper
public interface IUserDao {
    public User login(User user);
    List<User> getList(UserPage userPage);
    Integer getListCount(UserPage userPage);
    void updata(User user);
}
