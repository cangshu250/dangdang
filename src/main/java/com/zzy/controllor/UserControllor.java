package com.zzy.controllor;

import com.zzy.entity.User;
import com.zzy.service.UserService;
import com.zzy.util.CreateValidateCode;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Map;
import java.util.Set;

@Controller
@RequestMapping("/user")
@SessionAttributes({"vcode","user","emailCode","errorMsg"})
public class UserControllor {
    @Resource
    private UserService userService;
    @RequestMapping("/regist")
    public String register(User user,Model model ) throws Exception {
        System.out.println("------user收到了"+user);
        Map<String, Object> registerMap = userService.register(user);
        Map<String, Object> map = model.asMap();
        Set<String> keys = registerMap.keySet();
        if(keys.size()>1){
            for (String key : keys) {
                map.put(key,registerMap.get(key));
                System.out.println("回调的注册信息"+registerMap.get(key));
            }
            return "redirect:/user/verify_form.jsp";
        }else {

            return "redirect:/exception.jsp?message="+ URLEncoder.encode(registerMap.get("errorMsg").toString(),"UTF-8");
        }
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
    @RequestMapping("/user_isVcodeExists")
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
    //邮箱验证
    @RequestMapping("/user_vertify")
    public String user_vertify(String code,Model model) throws UnsupportedEncodingException {
        Map<String, Object> map = model.asMap();
        String emailCode =(String) map.get("emailCode");
        System.out.println(emailCode);
        System.out.println(code);
       if(emailCode.equals(code)){
           User user = (User)map.get("user");
            user.setStatus("y");
            userService.updateUser(user);
            return "redirect:/user/register_ok.jsp";
       }
       return "redirect:/user/verify_form.jsp?message="+URLEncoder.encode("验证码有问题！重新输入","utf-8");
    }
    @RequestMapping("/user_logout")
    public String logout(SessionStatus sessionStatus, HttpServletRequest request){
      sessionStatus.setComplete();

        request.getSession().removeAttribute("name");
        return "/main/main.jsp";
    }
        //用户注册
    @RequestMapping("/login")
    public String login(Model model,User user) throws UnsupportedEncodingException {
        System.out.println(user);
        Map<String, Object> loginMap = userService.login(user);
        Map<String, Object> map = model.asMap();
        if( loginMap.size()>1){

            map.put("user",user);
            return "redirect:/main/main.jsp";
        }else{
           String errorMsg =(String) loginMap.get("error");

            return   "forward:/user/login_form.jsp?errorMsg=" + URLEncoder.encode(errorMsg, "utf-8");

        }
    }
}
