package com.zzy.service;

import com.zzy.entity.User;

import java.util.Map;

public interface UserService {
    User seleceUser(String email);
    Map<String ,Object> register(User user);
    void updateUser(User user);
    Map<String ,Object> login(User user);
}
