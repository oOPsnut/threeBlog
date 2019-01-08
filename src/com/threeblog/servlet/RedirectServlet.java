package com.threeblog.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.threeblog.base.BaseServlet;

/**
 * Servlet implementation class RedirectServlet
 */
@WebServlet("/RedirectServlet")
public class RedirectServlet extends BaseServlet{
	
	//跳转到注册页面
	public String registUI(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return "/jsp/login/register.jsp";
	}
		
	//跳转到登陆页面
	public String LoginUI(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return "/jsp/login/login.jsp";
	}

	//跳转到首页
	public String homePageUI(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return "/jsp/homepage/Homepage.jsp";
	}
	
	//跳转到博文
	public String blogUI(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return "/jsp/homepage/blog.jsp";
	}
	
	//跳转到画廊
	public String picturesUI(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return "/jsp/homepage/pictures.jsp";
	}
	//跳转到个人中心
	public String personalCenterUI(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return "/jsp/personalcenter/personalcenter.jsp";
	}	
	
	//跳转到搜索
	public String searchUI(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return "/jsp/homepage/search.jsp";
	}
	
	//跳转到评论消息
	public String reviewsUI(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return "/jsp/messagecenter/messagecenter_reviews.jsp";
	}
	
	//跳转到收藏消息
	public String favorUI(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return "/jsp/messagecenter/messagecenter_favor.jsp";
	}
		
	//跳转到关注消息
	public String followUI(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return "/jsp/messagecenter/messagecenter_follow.jsp";
	}
		
	//跳转到点赞消息
	public String zanUI(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return "/jsp/messagecenter/messagecenter_zan.jsp";
	}
	
	//跳转到修改密码
	public String changePasswordUI(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return "/jsp/personalcenter/personalcenter_changepasswd.jsp";
	}
	
	//跳转到个人举报中心
	public String PreportCenterUI(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return "/jsp/personalcenter/personalcenter_reportcenter.jsp";
	}
	
	//跳转到忘记密码页面
	public String forgetPasswdUI(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return "/jsp/login/forget_passwd.jsp";
	}
	
	//跳转到写博文
	public String publishUI(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return "/jsp/article/publish.jsp";
	}
	
	//跳转到我的相册
	public String PablumUI(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return "/jsp/personalcenter/personalcenter_ablum.jsp";
	}
	//跳转到我的相册
	public String PchangeInfoUI(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return "/jsp/personalcenter/personalcenter_changeinfo.jsp";
	}
	//跳转到文章举报中心
	public String AreportCenterUI(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return "/jsp/reportcenter/report_article.jsp";
	}
	//跳转到评论举报中心
	public String RreportCenterUI(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return "/jsp/reportcenter/report_reviews.jsp";
	}
}
