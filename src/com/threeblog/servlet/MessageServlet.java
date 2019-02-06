package com.threeblog.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.threeblog.base.BaseServlet;
import com.threeblog.service.UserService;
import com.threeblog.serviceImpl.UserServiceImpl;

/**
 * Servlet implementation class MessageServlet
 */
@WebServlet("/MessageServlet")
public class MessageServlet extends BaseServlet{
	
	//查看消息，未读变成已读
	public void Read(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//获取消息id
		String id = request.getParameter("id");
		//System.out.println(id);
		//调用业务层
		UserService userService=new UserServiceImpl();
		try {
			//改变阅读状态
			boolean result = userService.Read(id);
			if (result) {
				//改变成功
				//将结果返回前端
				response.getWriter().println(true);
			}else {
				//改变失败
				//将结果返回前端
				response.getWriter().println(false);
			}
		} catch (Exception e) {
			//出错
			e.printStackTrace();
		}
	}
	
	//查看消息，未读变成已读
	public void FRead(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//获取消息id
		String id = request.getParameter("id");
		//System.out.println(id);
		//调用业务层
		UserService userService=new UserServiceImpl();
		try {
			//改变阅读状态
			boolean result = userService.fRead(id);
			if (result) {
				//改变成功
				//将结果返回前端
				response.getWriter().println(true);
			}else {
				//改变失败
				//将结果返回前端
				response.getWriter().println(false);
			}
		} catch (Exception e) {
			//出错
			e.printStackTrace();
		}
	}
}
