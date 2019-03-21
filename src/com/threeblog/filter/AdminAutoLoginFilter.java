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
import com.threeblog.domain.AdminBean;
import com.threeblog.domain.UserBean;
import com.threeblog.service.AdminService;
import com.threeblog.service.UserService;
import com.threeblog.serviceImpl.AdminServiceImpl;
import com.threeblog.serviceImpl.UserServiceImpl;
import com.threeblog.util.CookieUtil;
import com.threeblog.util.DateDiffUtil;

/**
 *自动登录过滤器
 */
@WebFilter("/*")
public class AdminAutoLoginFilter implements Filter {

    /**
     * Default constructor. 
     */
    public AdminAutoLoginFilter() {
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
			//先判断，现在session中还有没有那个adminBean
			AdminBean adminBean =(AdminBean) request.getSession().getAttribute("adminBean");
			//还有，有效
			if (adminBean != null) {				
				//已登录
				//检测是否被禁用
				//获取管理员id
				String id=adminBean.getId();
									
				//创建当前时间
				Date date=new Date();
				java.sql.Date last_login_time=new java.sql.Date(date.getTime());

				//更新登录时间
				AdminService adminService=new AdminServiceImpl();
				adminService.changeLoginTime(id,last_login_time);
				//添加CKFinder_UserRole属性。给予使用ckfinder的权限。
				request.getSession().setAttribute("CKFinder_UserRole","admin");
				//使用session存这个值到域中，方便下一次未过期前还可以用
				request.getSession().setAttribute("adminBean", adminBean);
				chain.doFilter(request, response);	
				
			}else {
				//代表session失效了。
				//看cookie
				//先从请求里面取出cookie
				Cookie[] cookies = request.getCookies();
				
				//从一堆的cookie里面找出我们以前给浏览器发的那个cookie
				Cookie cookie = CookieUtil.findCookie(cookies, "a_login");				
				if (cookie == null) {
					//第一次登录,直接放行
					chain.doFilter(request, response);					
				}else {
					//不是第一次
					String value = cookie.getValue();
					String phone = value.split("#")[0];
					String password = value.split("#")[1];
					
					//完成登录
					AdminBean admin = new AdminBean();
					admin.setPhone(phone);
					admin.setPassword(password);
					
					AdminService adminService=new AdminServiceImpl();
					AdminBean adminBean2 = adminService.AdminLogin(admin);				
					
					//获取用户id
					String id=adminBean2.getId();
				
					//创建当前时间
					Date date=new Date();
					java.sql.Date last_login_time=new java.sql.Date(date.getTime());

					//更新登录时间
					adminService.changeLoginTime(id,last_login_time);
					//添加CKFinder_UserRole属性。给予使用ckfinder的权限。
					request.getSession().setAttribute("CKFinder_UserRole","admin");
					//使用session存这个值到域中，方便下一次未过期前还可以用
					request.getSession().setAttribute("adminBean", adminBean2);
					chain.doFilter(request, response);	
					
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
