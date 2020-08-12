package com.zzy.service;

import com.zzy.dao.TestDao;
import com.zzy.entity.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service("testService")
@Transactional
public class TestServiceImpl implements TestService {
    @Autowired
    private TestDao testDao;
    @Override
    public List<User> queryAll() {
        return testDao.queryAll();
    }
}
