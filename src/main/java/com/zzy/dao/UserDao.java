package com.zzy.dao;

import com.zzy.entity.User;

public interface UserDao {
   public  User selectByEmail(String email);
   public  void insertUser(User user);
   public void updateUserStatus(User user);
}
