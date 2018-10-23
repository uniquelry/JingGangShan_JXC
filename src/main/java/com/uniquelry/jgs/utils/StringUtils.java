package com.uniquelry.jgs.utils;

/**
 * @Description  字符串工具类
 * @Author uniquelry
 * @Email 1909506001@qq.com
 * @Date 2018/10/18 22:28
 * @Version V1.0
 */
public class StringUtils {

	/**
	 * 判断是否是空
	 * @param str
	 * @return
	 */
	public static boolean isEmpty(String str){
		if(str==null||"".equals(str.trim())){
			return true;
		}else{
			return false;
		}
	}
	
	/**
	 * 判断是否不是空
	 * @param str
	 * @return
	 */
	public static boolean isNotEmpty(String str){
		if((str!=null)&&!"".equals(str.trim())){
			return true;
		}else{
			return false;
		}
	}
	

	/**
	 * 生成四位编号
	 * @param code
	 * @return
	 */
	public static String formatCode(String code){
		try {
			int length = code.length();
			Integer num = Integer.valueOf(code.substring(length-4,length))+1;
			String codenum = num.toString();
			int codelength = codenum.length();
			for (int i = 4; i > codelength; i--) {
				codenum = "0"+codenum;
			}
			return codenum;
		} catch (NumberFormatException e) {
			return "0100";
		}
	}

}
