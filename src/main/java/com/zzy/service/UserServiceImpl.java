package com.zzy.service;

import com.zzy.dao.UserDao;
import com.zzy.entity.User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Service("userService")
@Transactional
public class UserServiceImpl implements  UserService{
    @Resource
    private UserDao userDao;
    @Override
    @Transactional(propagation = Propagation.SUPPORTS,isolation = Isolation.REPEATABLE_READ)
    public User seleceUser(String email) {
        User user = userDao.selectByEmail(email);
        return user;
    }
}
