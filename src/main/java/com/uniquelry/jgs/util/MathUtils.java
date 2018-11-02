package com.uniquelry.jgs.util;

/**
 * @Description  数学工具类
 * @Author uniquelry
 * @Email 1909506001@qq.com
 * @Date 2018/10/18 22:28
 * @Version V1.0
 */
public class MathUtils {

	/**
	 * 格式化数字 保留两位
	 * @param n
	 * @return
	 */
	public static float format2Bit(float n){
		return (float)(Math.round(n*100))/100;
	}
}
