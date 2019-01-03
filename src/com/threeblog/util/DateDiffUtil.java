package com.threeblog.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateDiffUtil {
	
	public static final String DATE_FORMAT_NORMAL = "yyyy-MM-dd";
	
	//String类型
	//计算给开始日期 结束日期 的间隔天数 yyyy-MM-dd
	public static Date getStrToDate(String date,String fomtter) throws Exception{
		
		//格式化
		SimpleDateFormat sDateFormat = new SimpleDateFormat(fomtter);
		return sDateFormat.parse(date);
		
	}
	public static int getDayLength(String start_date,String end_date) throws Exception{
		
		Date fromDate = getStrToDate(start_date,DATE_FORMAT_NORMAL); //开始日期
		Date toDate = getStrToDate(end_date,DATE_FORMAT_NORMAL); //结束日期
		long from = fromDate.getTime();
		long to = toDate.getTime();
		
		//一天等于多少毫秒：24*3600*1000
		
		int day = (int)((to-from)/(24*60*60*1000));
		return day;
}

	//Date类型
	//计算给开始日期 结束日期 的间隔天数 yyyy-MM-dd
	public static int getDateDiff(Date sDate,Date eDate)throws Exception {
		long start = sDate.getTime();
		long end = eDate.getTime();
		
		//一天等于多少毫秒：24*3600*1000
		
		int days = (int)((end-start)/(24*60*60*1000));
		
		return days;
	}



}
