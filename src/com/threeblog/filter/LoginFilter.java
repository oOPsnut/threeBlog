package com.threeblog.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.xml.internal.ws.policy.EffectiveAlternativeSelector;
import com.threeblog.domain.UserBean;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter("/*")
public class LoginFilter implements Filter {

    
    public LoginFilter() {
        // TODO Auto-generated constructor stub
    }

	
	public void destroy() {
		// TODO Auto-generated method stub
	}

	//存放不登录也可访问链接
	//private List<String> list= new ArrayList<String>();
	
	public void init(FilterConfig fConfig) throws ServletException {
//		list.add("/jsp/login/login.jsp");	//登录页
//		list.add("/Homepage.jsp");//主页
//		list.add("/jsp/homepage/Homepage.jsp");//主页
//		list.add("/jsp/article/article.jsp");//文章详情页
//		list.add("/jsp/error/error.jsp");//出错页
//		list.add("/jsp/login/register.jsp");//注册页
//		list.add("/jsp/homepage/blog.jsp");//主页博文页
//		list.add("/jsp/homepage/pictures.jsp");//主页画廊页
//		list.add("/jsp/homepage/search.jsp");//搜索页
//		list.add("/jsp/homepage/search_result.jsp");//搜索结果页
//		list.add("/jsp/login/forget_passwd.jsp");//忘记密码页
//		list.add("/jsp/othercenter/othercenter.jsp");//他人主页
//		list.add("/jsp/othercenter/othercenter_ablum.jsp");//他人相册页
		//list.add("/system/elecMenuAction_home.do"); 
	}
	
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
		
		HttpServletResponse response=(HttpServletResponse) resp;
		HttpServletRequest request =(HttpServletRequest) req;
		
/*		System.out.println("进来了");
		//获取页面访问路径
		String path = request.getServletPath();
		System.out.println("path:"+path);
		
		String currentURL = request.getRequestURI();
		String ctxPath = request.getContextPath();
		// 除掉项目名称时访问页面当前路径
		String targetURL = currentURL.substring(ctxPath.length());
		System.out.println("currentURL:"+currentURL);
		System.out.println("ctxPath:"+ctxPath);
		System.out.println("targetURL:"+targetURL);*/
//		//获取session中userBean，若有，则已经登录，直接放行
//		UserBean userBean = (UserBean)request.getSession().getAttribute("userBean");
//		if (userBean!=null) {
//			chain.doFilter(req, resp);
//			return;
//		}
//		
//		//访问的网站在放行表上，放行
//		if (list!=null && list.contains(path)) {
//			chain.doFilter(req, resp);
//			return;	
//		}
//		response.sendRedirect(request.getContextPath()+"/jsp/login/login.jsp");
		
		chain.doFilter(req, resp);
	}

	

}
