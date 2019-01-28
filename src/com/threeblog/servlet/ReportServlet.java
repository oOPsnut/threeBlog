package com.threeblog.servlet;

import com.threeblog.base.BaseServlet;
import com.threeblog.domain.ReportBean;
import com.threeblog.domain.UserBean;
import com.threeblog.service.ArticleService;
import com.threeblog.service.UserService;
import com.threeblog.serviceImpl.ArticleServiceImpl;
import com.threeblog.serviceImpl.UserServiceImpl;
import com.threeblog.util.UUIDUtils;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ReportServlet
 */
@WebServlet("/ReportServlet")
public class ReportServlet extends BaseServlet {
		
	//举报文章
	public String ArticleReport(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		//获取表单数据
		String simple_reason = request.getParameter("answer");//违规类型
		String all_reason = request.getParameter("all_reason");//举报理由
		String content = request.getParameter("daoyu");//文章导语
		String url = request.getParameter("url");//文章链接
		String author_id = request.getParameter("author_id");//文章作者id
		String content_id = request.getParameter("aid");//文章id
		String username = request.getParameter("username");//文章作者名字
		//System.out.println(simple_reason+"="+all_reason+"="+content+"="+url+"="+author_id+"="+content_id);
		
		//从session中获取用户id等信息
		UserBean userBean = (UserBean) request.getSession().getAttribute("userBean");
		String user_id = userBean.getId();
		//生成举报文章id、举报类型
		String id = UUIDUtils.getId();
		String type="举报文章";
		//举报时间
		Date now=new Date();
		Date add_time=new Date(now.getTime());
		//将举报数据封装到bean中
		ReportBean report=new ReportBean();
		report.setId(id);
		report.setUsername(username);
		report.setType(type);
		report.setContent(content);
		report.setSimple_reason(simple_reason);
		report.setAll_reason(all_reason);
		report.setUrl(url);
		report.setAuthor_id(author_id);
		report.setUser_id(user_id);
		report.setContent_id(content_id);
		report.setAdd_time(add_time);
		//调用服务
		ArticleService aService = new ArticleServiceImpl();
		boolean result;
		try {
			result = aService.addArticleReport(report);
			if (result) {
				response.sendRedirect(request.getContextPath()+"/RedirectServlet?method=personalCenterUI");
				return null;
			} else {
				response.sendRedirect(request.getContextPath()+"/jsp/error/error.jsp");
				return null;
			}
		} catch (SQLException e) {			
			e.printStackTrace();
			response.sendRedirect(request.getContextPath()+"/jsp/error/error.jsp");
			return null;
		}
	}
		
	//举报留言/回复
	public String ReviewsReport(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		//获取表单数据
		String simple_reason = request.getParameter("answer");//违规类型
		String all_reason = request.getParameter("all_reason");//举报理由
		String content = request.getParameter("content");//摘要
		String url = request.getParameter("url");//文章链接
		String author_id = request.getParameter("author_id");//留言/回复者id
		String content_id = request.getParameter("content_id");//留言/回复id
		String flag = request.getParameter("flag");//标记,判断是留言还是回复
		String username = request.getParameter("username");//留言/回复者名字
		//System.out.println(simple_reason+"="+all_reason+"="+content+"="+url+"="+author_id+"="+content_id+"="+flag);
		
		//从session中获取用户名等信息
		UserBean userBean = (UserBean) request.getSession().getAttribute("userBean");
		String user_id = userBean.getId();
		//生成举报文章id、举报类型
		String id = UUIDUtils.getId();
		//判断是留言还是回复
		String type=null;
		if("comment".equals(flag)) {			
			type="举报留言";
		}else if ("answer".equals(flag)) {
			type="举报回复";
		}
		//将举报数据封装到bean中
		ReportBean report=new ReportBean();
		report.setId(id);
		report.setUsername(username);
		report.setType(type);
		report.setContent(content);
		report.setSimple_reason(simple_reason);
		report.setAll_reason(all_reason);
		report.setUrl(url);
		report.setAuthor_id(author_id);
		report.setUser_id(user_id);
		report.setContent_id(content_id);
		//调用服务
		ArticleService aService = new ArticleServiceImpl();
		boolean result;
		try {
			result = aService.addReviewsReport(report);
			if (result) {
				response.sendRedirect(request.getContextPath()+"/RedirectServlet?method=personalCenterUI");
				return null;
			} else {
				response.sendRedirect(request.getContextPath()+"/jsp/error/error.jsp");
				return null;
			}
		} catch (SQLException e) {			
			e.printStackTrace();
			response.sendRedirect(request.getContextPath()+"/jsp/error/error.jsp");
			return null;
		}
	}
	
	
	//举报确定
	public void EnsureReport(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		
		//获取表单数据
		String id = request.getParameter("id");//违规id

		//调用服务
		UserService uService = new UserServiceImpl();
		boolean result = uService.ensureReport(id);
		if (result) {
			response.getWriter().println(true);
		} else {
			response.getWriter().println(false);
		}
		
	}	
	
}
