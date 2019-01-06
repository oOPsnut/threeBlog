package com.threeblog.filter;

import java.io.IOException;
import java.util.Date;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.threeblog.dao.UserDao;
import com.threeblog.daoImpl.UserDaoImpl;
import com.threeblog.domain.UserBean;
import com.threeblog.service.UserService;
import com.threeblog.serviceImpl.UserServiceImpl;
import com.threeblog.util.CookieUtil;
import com.threeblog.util.DateDiffUtil;

/**
 *自动登录过滤器
 */
@WebFilter("/*")
public class AutoLoginFilter implements Filter {

    /**
     * Default constructor. 
     */
    public AutoLoginFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
		
		try {
			HttpServletRequest request=(HttpServletRequest) req;
			HttpServletResponse response=(HttpServletResponse) resp;
			//先判断，现在session中还有没有那个userBean
			UserBean userBean =(UserBean) request.getSession().getAttribute("userBean");
			//还有，有效
			if (userBean != null) {				
				//已登录
				//检测是否被禁用
				//获取用户id
				int id=userBean.getId();
				//获取禁用时间
				Date ban_time=userBean.getBan_time();					
				//创建当前时间
				Date date=new Date();
				Date currentTime=new Date(date.getTime());
				
				//账号被禁用天数
				int days=DateDiffUtil.getDateDiff(ban_time, currentTime);					
				//判断账号是否被禁用
				if (days>0) {
					//未被禁用
					//创建当前时间
					java.sql.Date last_login_time=new java.sql.Date(date.getTime());

					//更新登录时间
					UserService userService=new UserServiceImpl();
					userService.changeLoginTime(id,last_login_time);
					//添加CKFinder_UserRole属性。给予使用ckfinder的权限。
					request.getSession().setAttribute("CKFinder_UserRole","user");
					//使用session存这个值到域中，方便下一次未过期前还可以用
					request.getSession().setAttribute("userBean", userBean);
					chain.doFilter(request, response);	
				}else {
					//账号被禁用
					request.setAttribute("errorMsg", "该账号被禁用，更换账号尝试！");
					request.getRequestDispatcher("/jsp/login/login.jsp").forward(request, response);	
					return;
				}
			}else {
				//代表session失效了。
				//看cookie
				//先从请求里面取出cookie
				Cookie[] cookies = request.getCookies();
				
				//从一堆的cookie里面找出我们以前给浏览器发的那个cookie
				Cookie cookie = CookieUtil.findCookie(cookies, "auto_login");				
				if (cookie == null) {
					//第一次登录,直接放行
					chain.doFilter(request, response);					
				}else {
					//不是第一次
					String value = cookie.getValue();
					String phone = value.split("#")[0];
					String password = value.split("#")[1];
					
					//完成登录
					UserBean user = new UserBean();
					user.setPhone(phone);
					user.setPassword(password);
					
					UserService userService=new UserServiceImpl();
					UserBean userBean2 = userService.userLogin(user);				
					
					//检测是否被禁用
					//获取用户id
					int id=userBean2.getId();
					//获取禁用时间
					Date ban_time=userBean2.getBan_time();					
					//创建当前时间
					Date date=new Date();
					Date currentTime=new Date(date.getTime());
					
					//账号被禁用天数
					int days=DateDiffUtil.getDateDiff(ban_time, currentTime);					
					
					//判断账号是否被禁用
					if (days>0) {
						//未被禁用
						//创建当前时间
						java.sql.Date last_login_time=new java.sql.Date(date.getTime());

						//更新登录时间
						userService.changeLoginTime(id,last_login_time);
						//添加CKFinder_UserRole属性。给予使用ckfinder的权限。
						request.getSession().setAttribute("CKFinder_UserRole","user");
						//使用session存这个值到域中，方便下一次未过期前还可以用
						request.getSession().setAttribute("userBean", userBean2);
						chain.doFilter(request, response);	
					}else {
						//账号被禁用
						request.setAttribute("errorMsg", "该账号被禁用，更换账号尝试！");
						//清除cookie
						//先从请求里面取出cookie
						Cookie[] cookies2 = request.getCookies();	
						//从一堆的cookie里面找出我们以前给浏览器发的那个cookie
						Cookie cookie2 = CookieUtil.findCookie(cookies2, "auto_login");
						cookie2.setMaxAge(0);
						cookie2.setPath(request.getContextPath());
						response.addCookie(cookie2);
						request.getRequestDispatcher("/jsp/login/login.jsp").forward(request, response);		
						return;
					}
						}
					}
			
				} catch (Exception e) {
					chain.doFilter(req, resp);
					e.printStackTrace();
		}		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
