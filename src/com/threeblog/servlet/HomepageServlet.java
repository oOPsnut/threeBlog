package com.threeblog.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.threeblog.base.BaseServlet;


@WebServlet("/HomepageServlet")
public class HomepageServlet extends BaseServlet {
	
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 调用业务层功能：获取全部的文章等信息（文章，公共，标签），返回集合
		//将返回的集合放入request范围内
		//转发到真实首页
		return "/jsp/homepage/Homepage.jsp";
	}
}
