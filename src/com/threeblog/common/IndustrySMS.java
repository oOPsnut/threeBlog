package com.threeblog.common;

import java.net.URLEncoder;

import com.threeblog.common.Config;
import com.threeblog.common.HttpUtil;

/**
 * 验证码通知短信接口
 * 
 * @ClassName: IndustrySMS
 * @Description: 验证码通知短信接口
 *
 */
public class IndustrySMS
{
	private static String operation = "/industrySMS/sendSMS";

	private static String accountSid = Config.ACCOUNT_SID;
	private static String smsContent1 = "【三博科技】您的验证码为";
	private static String smsContent2 = "，请于";
	private static String smsContent3 = "分钟内正确输入，如非本人操作，请忽略此短信。";
	/**
	 * 验证码通知短信
	 */
	public static String execute(String phone,int code)
	{
		String tmpSmsContent1 = null;
		String tmpSmsContent2 = null;
		String tmpSmsContent3 = null;
	    try{
	      tmpSmsContent1 = URLEncoder.encode(smsContent1, "UTF-8");
	      tmpSmsContent2 = URLEncoder.encode(smsContent2, "UTF-8");
	      tmpSmsContent3 = URLEncoder.encode(smsContent3, "UTF-8");
	      
	    }catch(Exception e){
	      
	    }
	    String url = Config.BASE_URL + operation;
	    int time=5;
	    String body = "accountSid=" + accountSid + "&to=" + phone + "&smsContent=" + tmpSmsContent1+code+tmpSmsContent2+time+tmpSmsContent3
	        + HttpUtil.createCommonParam();

	    // 提交请求
	    String result = HttpUtil.post(url, body);
	    return result;
	}
}
