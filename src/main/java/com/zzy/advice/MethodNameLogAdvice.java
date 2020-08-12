package com.zzy.advice;

import com.zzy.util.FileFindUtil;
import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
import org.springframework.stereotype.Component;

import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.util.Date;
@Component("methodNameLogAdvice")
public class MethodNameLogAdvice implements MethodInterceptor {
    @Override
    public Object invoke(MethodInvocation invocation) throws Throwable {
        String logFileName = FileFindUtil.getLogFileName("/log/logfile.txt");

        FileOutputStream fos = new FileOutputStream(logFileName,true);
        OutputStreamWriter outputStreamWriter = new OutputStreamWriter(fos, "utf-8");
        PrintWriter pw = new PrintWriter(outputStreamWriter);
        String name = invocation.getMethod().getName();
        String logMessage = name + "/t在" + new Date().toString() + "/t被调用了";
        System.out.println(logMessage);
        pw.println(logMessage);
        pw.close();
        System.out.println("------");
        Object proceed = invocation.proceed();
        return proceed;
    }
}
