package com.threeblog.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.threeblog.base.BaseServlet;
import com.threeblog.domain.ArticleBean;
import com.threeblog.service.ArticleService;
import com.threeblog.serviceImpl.ArticleServiceImpl;

import jdk.nashorn.internal.ir.RuntimeNode.Request;


@WebServlet("/HomepageServlet")
public class HomepageServlet extends BaseServlet {
	
	//实时返回查询结果（搜索页面）
	public String search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		
		//获取数据
		String word = request.getParameter("word");
		//System.out.println(word);
		//查询数据库
		ArticleService aService = new ArticleServiceImpl();
		List<ArticleBean> list = aService.findSearchKey(word);
		//System.out.println(list);
		//返回数据
		if (list.isEmpty()) {
			response.getWriter().println(1);
			return null;
		} else {
			request.setAttribute("list", list);
			return "/jsp/homepage/seachList.jsp";
		}
	}
}
