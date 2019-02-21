package com.threeblog.util;

import java.util.Random;

public class RandomCodeUtil {
	
	 /**
     * 生成相应长度的数字字母组合的随机数
     * @param size 长度
     * @return String
     */
    public static String getRandStrCode(int size) {
        String temp = "ABCDEFGHJKLMNPQRSTUVWXYZ1234567890abcdefghijklmnopqrstuvwxyz";
        int length = temp.length();
        int p;
        Random r = new Random();
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < size; i++) {
            p = r.nextInt(length);
            sb.append(temp.substring(p, p + 1));
        }
        return sb.toString();
    }

}
