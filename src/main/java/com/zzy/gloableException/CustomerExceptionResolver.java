package com.zzy.gloableException;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class CustomerExceptionResolver implements HandlerExceptionResolver {
    @Override
    public ModelAndView resolveException(HttpServletRequest req, HttpServletResponse res, Object o, Exception e) {
        System.out.println("异常信息："+e.getMessage());
        ModelAndView mav = new ModelAndView();
        try {
            mav.setViewName("redirect:/exception.jsp?message="+ URLEncoder.encode(e.getMessage(),"utf-8"));
        } catch (UnsupportedEncodingException e1) {
            e1.printStackTrace();
        }
        return mav;
    }
}
