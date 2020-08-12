package com.zzy.util;

import org.springframework.context.annotation.Configuration;

import java.io.*;
import java.net.URL;

public class FileFindUtil {
    public static String S1="/src/main/java";
    public static String getLogFileName(String uri){
        String path = FileFindUtil.class.getResource("/").getPath();
        String[] split = path.split("/target");
        String url=split[0]+S1+uri;
        return url;
    }
    public static void readLogFile(String uri)  {
        String path = FileFindUtil.class.getResource("/").getPath();
        String[] split = path.split("/target");
        String url=split[0]+S1+uri;
        FileInputStream fis=null;

        try {
             fis= new FileInputStream(url);
            BufferedInputStream bis = new BufferedInputStream(fis);
            BufferedReader read = new BufferedReader(new InputStreamReader(bis, "utf-8"));
            String s=null;
            do{
                s=read.readLine();
                System.out.println(s);
            }while (s!=null);

        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            try {
                if(fis!=null)fis.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
