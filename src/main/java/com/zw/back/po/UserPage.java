package com.zw.back.po;

import java.util.List;

public class UserPage extends PageSource {
    private String username;
    private List<User> users;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }
}
