package com.zzy.controllor;

import com.zzy.entity.User;
import com.zzy.service.UserService;
import com.zzy.util.CreateValidateCode;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@Controller
@RequestMapping("/user")
@SessionAttributes({"vcode","user"})
public class UserControllor {
    @Resource
    private UserService userService;
    @RequestMapping("/regist")
    public String register(User user,Model model ){

        Map<String, Object> map = model.asMap();
        map.put("user",user);
        return "redirect:/user/verify_form.jsp";
    }
    //输出一个验证码
    @RequestMapping("/printVcode")
    public void printVcode(Model model,HttpServletResponse response){
        CreateValidateCode vCode = new CreateValidateCode(100, 30, 4, 10);
        Map<String, Object>  map=model.asMap();
        map.put("vcode",vCode.getCode());
        ServletOutputStream sos=null;
        try {
            sos= response.getOutputStream();
            vCode.write(sos);

        } catch (IOException e) {
            e.printStackTrace();
        }finally {
           if(sos!=null){
               try {
                   sos.close();
               } catch (IOException e) {
                   e.printStackTrace();
               }
           }
        }

    }
    //注册时验证邮箱
    @RequestMapping("/user_isEmailExist")
    @ResponseBody
    public String isEmailExist(String email){
        User user = userService.seleceUser(email);
        if(user!=null){
            return "exist";
        }else{
            return "NoExist";
        }
    }
    //注册时验证验证码是否有效
    @RequestMapping("user_isVcodeExists")
    @ResponseBody
    public String isVcodeExists(String pageCode,Model model){
        Map<String, Object> map = model.asMap();
        //获取Session中的Vcode
        String vcode =(String) map.get("vcode");
        System.out.println(vcode);
        System.out.println(pageCode);
        if(pageCode!=null){
            if(pageCode.toLowerCase().equals(vcode)){
                return "exists";
            }
        }
        return "notExists";
    }

}
