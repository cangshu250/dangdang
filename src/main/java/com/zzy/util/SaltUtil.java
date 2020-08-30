package com.zzy.util;

import java.util.Random;

public class SaltUtil {
    public static String getSalt(int size){
        char[] code = "QWERTYUIOPLKJHGFDSAZXCVBNMqwertyuioplkjhgfdsazxcvbnm1234567890".toCharArray();
        StringBuilder sb = new StringBuilder();
        for (int i=0;i<size;i++){
            sb.append(code[new Random().nextInt(code.length)]);
        }
        return sb.toString();
    }
}
