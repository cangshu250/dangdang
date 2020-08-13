package com.zzy.controllor;

import com.zzy.entity.User;
import com.zzy.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/test")
public class TestControllor {
    @Autowired
    private TestService testService;
    @RequestMapping("/test")
    public String test(){
        List<User> users = testService.queryAll();
        System.out.println(2/0);
        return "index";
    }
}
