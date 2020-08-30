package com.zzy.service;

import com.zzy.dao.UserDao;
import com.zzy.entity.User;
import com.zzy.util.SaltUtil;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

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

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public Map<String, Object> register(User user) {
        Map<String ,Object> map = new HashMap<String,Object>();
        String id = UUID.randomUUID().toString().replaceAll("-", "");
        String salt = SaltUtil.getSalt(5);
        user.setSalt(salt);
        String oldPwd = user.getPassword();

        String newPwd = DigestUtils.md5Hex(oldPwd+salt).toString();
        user.setPassword(newPwd);
        user.setId(id);
        user.setStatus("n");
        String emailCode = SaltUtil.getSalt(30);
        try {
            System.out.println("处理过的user对象"+user);
            userDao.insertUser(user);
            map.put("success","true");
            map.put("user",user);
            map.put("emailCode",emailCode);
        } catch (Exception e) {
            map.put("errorMsg",e.getMessage());
        }

        return map;
    }

    @Override
    public void updateUser(User user) {
        userDao.updateUserStatus( user);
    }

    @Override
    public Map<String ,Object> login(User user) {
        Map<String ,Object> map = new HashMap<String ,Object>();
        User user1 = userDao.selectByEmail(user.getEmail());
        if(user1!=null){
            String oldPwd = user.getPassword();
            String salt = user1.getSalt();
            String newpwd1 = DigestUtils.md5Hex(oldPwd + salt);
            String saltPwd = user1.getPassword();
            if(newpwd1.equals(saltPwd)){
                map.put("success",true);
                map.put("user",user);
                System.out.println("查到了");
            }else{
                map.put("error","密码有问题,请重新输入");
                System.out.println("密码查询失败");
            }
        }else{
            map.put("error","输入的邮箱号未找到");
            System.out.println("邮箱查询失败");
        }
        return map;
    }
}
