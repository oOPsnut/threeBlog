package com.threeblog.servlet;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.threeblog.base.BaseServlet;
import com.threeblog.domain.UserBean;
import com.threeblog.service.UserService;
import com.threeblog.serviceImpl.UserServiceImpl;
import com.threeblog.util.DateDiffUtil;
import com.threeblog.util.Md5StringUtils;

import net.sf.json.JSONObject;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends BaseServlet {
	
	//固定字符串（md5key）用于注册、登陆、自动登陆、修改密码
	private static final String md5Key = "iwXq4MLs1L";
	//private static final String md5KeyR = "y7rl1klIeH";
	
	//用户注册
	public String UserRegister(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//接受表单参数
		String phone = request.getParameter("phone");
		String username = request.getParameter("username");
		String fpassword = request.getParameter("password1");		
						
		//MD5加密
		String password = Md5StringUtils.getMD5Str(fpassword+md5Key,null);		
		
		UserBean user=new UserBean();
		//注册时间
		Date now=new Date();
		java.sql.Date register_time=new java.sql.Date(now.getTime());
		
		//调用业务层注册功能
		UserService userService=new UserServiceImpl();
		try {
			//注册成功，跳转到登录页
			boolean result = userService.userRegister(phone,username,password,register_time);
			if (result) {
//				response.getWriter().print("<script>alert('注册成功，将自动返回登录页面！')</script>");
				return "/jsp/login/login.jsp";
			}else {
				//注册失败，跳转到提示页面
//				response.getWriter().print("<script>alert('注册失败！')</script>");
				return "/jsp/error/error.jsp";
			}
		} catch (Exception e) {
			//注册失败，跳转到提示页面
//			response.getWriter().print("<script>alert('未知错误！')</script>");
			return "/jsp/error/error.jsp";
		}
	}
	
	//检测手机号是否已被注册(regiseter)
	public void CheckPhone(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			//检测是否存在
			String phone = request.getParameter("phone");
			
			UserService userService=new UserServiceImpl();
			boolean pisExist = userService.checkPhone(phone);;			
			
			//通知页面
			if (pisExist) {
				response.getWriter().println(false);//手机号已注册
			}else {
				response.getWriter().println(true);//手机号可用
				//response.getWriter().println(1);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//检测手机号是否已被注册(forgetpasswd)
	public void newCheckPhone(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			//检测是否存在
			String phone = request.getParameter("phone");
			
			UserService userService=new UserServiceImpl();
			boolean pisExist = userService.checkPhone(phone);;			
			
			//通知页面
			if (pisExist) {
				response.getWriter().println(true);//手机号已注册
			}else {
				response.getWriter().println(false);//手机号可用
				//response.getWriter().println(1);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}	
	
	//检测用户名是否使用
	public void CheckUsername(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			//检测是否存在
			String username = request.getParameter("username");
			
			
			UserService userService=new UserServiceImpl();
			boolean uisExist = userService.checkUserName(username);
			
			//通知页面到底有还是没有
			if (uisExist) {
				response.getWriter().println(false);//存在用户名
			}else {
				response.getWriter().println(true);//用户名可用
			}
			
	} catch (Exception e) {
		
		e.printStackTrace();
	}
	}
	
	//调用手机验证服务,用于发送验证码
	public void sendCode(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			//接收浏览器传来的电话值
			String phone = request.getParameter("phone");
			
			//产生验证码
			int code = (int)((Math.random()*9+1)*100000);
			
			//创建当前时间
//			Date date=new Date();
//			SimpleDateFormat sDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//			String create_time = sDateFormat.format(date);
			long create_time=System.currentTimeMillis();
			
			//将当前时间和验证码存到session中
			HttpSession session = request.getSession();
			session.setAttribute("code",code);
			session.setAttribute("create_time", create_time);
			
			
			//调用短信服务
			UserService userService=new UserServiceImpl();
			String result = userService.sendCode(phone, code);
			JSONObject json= new JSONObject().fromObject(result);
			String statusCode = json.getString("respCode");
			if (statusCode.equals("00000")) {
				response.getWriter().println(true);
			}else{
				response.getWriter().println(false);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	//检测验证码是否正确
	public void CheckCode(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//获取输入框传进来的验证码
		int code = Integer.parseInt(request.getParameter("code"));
			
		//从session中取出验证码和发送时间
		HttpSession session =request.getSession();
		
		//两种情况：1，没点发送，直接输入，直接返回false。 2.点了发送，输入判断
		//没点发送，session中没有code和create_time
		if ((session.getAttribute("code")!=null)&&(session.getAttribute("create_time")!=null)) {
			
			long create_time = (long) session.getAttribute("create_time");

			//当时间超过五分钟时候，重置之前的code
			if ((System.currentTimeMillis()-create_time)>= 1000 * 60 * 5) {
				session.setAttribute("code","85245675"); //值为不可能随机到或填写到的数字
				//session.removeAttribute("code");
			}
			
			int tCode = Integer.parseInt(session.getAttribute("code").toString());
			
			
			if ((code==tCode) && (System.currentTimeMillis()-create_time)< 1000 * 60 * 5) {
				response.getWriter().println(true);
			}else {
				response.getWriter().println(false);
			}
		}else {
			response.getWriter().println(false);
		}
	}
	
	//用户登陆
	public String UserLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			try {
				//接受表单参数
				String phone = request.getParameter("phone");
				String fpassword = request.getParameter("password");
				String autoLogin = request.getParameter("auto_login");				
								
				UserBean user = new UserBean();
				
				//MD5加密
				String password = Md5StringUtils.getMD5Str(fpassword+md5Key,null);								
				user.setPhone(phone);
				user.setPassword(password);
				
				//调用业务层登录功能
				UserService userService=new UserServiceImpl();
				UserBean userBean = userService.userLogin(user);
				if (userBean != null) {
					//成功登录
					
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
						user.setLast_login_time(last_login_time);
						//更新登录时间
						userService.changeLoginTime(id,last_login_time);
						
						//页面提交上来的时候，是否选择了三天内免登陆
						if ("on".equals(autoLogin)) {
							
							//发送cookie给客户端
							Cookie cookie=new Cookie("auto_login", phone+"#"+password);
							cookie.setMaxAge(60*60*24*3);//三天内有效
							cookie.setPath(request.getContextPath());
							response.addCookie(cookie);
							
						}
						request.getSession().setAttribute("userBean", userBean);
						//request.getRequestDispatcher("/Homepage.jsp").forward(request, response);
						response.sendRedirect(request.getContextPath()+"/Homepage.jsp");
						return null;
					}else {
						//账号被禁用
						request.setAttribute("errorMsg", "该账号被禁用，更换账号尝试！");
						return "/jsp/login/login.jsp";
					}
				}else {
					//登录不成功,发送错误消息
					request.setAttribute("errorMsg", "账号或密码错误，请重新登录！");
					//response.sendRedirect(request.getContextPath()+"/jsp/login/login.jsp");
					return "/jsp/login/login.jsp";
				}
					
					
					
				
			} catch (Exception e) {
				return "/jsp/login/login.jsp";
			}
	}
	
	//退出登录
	public String LoginOut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 删除cookie和session
        HttpSession session = request.getSession();
        session.removeAttribute("userBean");
        session.invalidate();
        
        Cookie[] cookies = request.getCookies();
        if (cookies != null && cookies.length > 0) {
            for (Cookie c : cookies) {
                if (c.getName().equals("auto_login")) {
                	
                    //设置cookie存活时间为0
                    c.setMaxAge(0);
                    c.setPath(request.getContextPath());
                    //将cookie响应到前台
                    response.addCookie(c);
                    //break;
                }
            }
        }
        
        
        // 重定向到首页
        response.sendRedirect(request.getContextPath()+"/Homepage.jsp");
        //跳转
        //request.getRequestDispatcher("/Homepage.jsp").forward(request, response);
		return null;
	}
	
	//修改密码
	public String changePasswd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			//接受表单参数
			String phone = request.getParameter("phone");
			String fpassword = request.getParameter("newpasswd1");
							
			UserBean user=new UserBean();
			//MD5加密
			String password = Md5StringUtils.getMD5Str(fpassword+md5Key,null);	
			
			//调用业务层修改密码
			UserService userService=new UserServiceImpl();
			try {
				//修改成功，跳转到登录页
				boolean result = userService.changePasswd(phone,password);
				if (result) {
//					response.setContentType("text/html;charset=utf-8");
//					response.getWriter().println("<script>alert('修改密码成功，将自动返回登录页面')</script>");
					return "/jsp/login/login.jsp";
				}else {
					//修改失败，跳转到提示页面
//					response.setContentType("text/html;charset=utf-8");
//					response.getWriter().print("<script>alert('修改密码失败！')</script>");
					return "/jsp/error/error.jsp";
				}
			} catch (Exception e) {
				//修改失败，跳转到提示页面
//				response.setContentType("text/html;charset=utf-8");
//				response.getWriter().print("<script>alert('未知错误！')</script>");
				return "/jsp/error/error.jsp";
			}
		}
	
	//修改个人信息
	public String PchangeInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
				
			//创建工厂
			DiskFileItemFactory factory = new DiskFileItemFactory();
			//通过工厂创建解析器ServletFileUpload
			ServletFileUpload upload = new ServletFileUpload(factory);
			//设置上传文件大小
			upload.setSizeMax(20*1024*1024);			
			//解析请求
			List<FileItem> list=null;
			try {
				list =upload.parseRequest(request);
			} catch (FileUploadException e) {
				e.printStackTrace();
			}
			//创建迭代器
			Iterator iterator=list.iterator();
			//表单数据
			String age=null;
			String sex = null;
			String introduction = null;
			String province = null;
			String city = null;
			//头像
			String head=null;
			//遍历获取到的表单数据
			while (iterator.hasNext()) {
				FileItem item=(FileItem)iterator.next();
				if (item.isFormField()) {
					//普通输入项
					String value = item.getString("UTF-8");
					if(item.getFieldName().equals("age")){
						age=value;
					}else if(item.getFieldName().equals("sex")){
						sex=value;
					}else if(item.getFieldName().equals("introduction")){
						introduction=value;
					}else if(item.getFieldName().equals("province")){
						province=value;
					}else if(item.getFieldName().equals("city")){
						city=value;
					}
				}else {
					//当前处理item里面封装的上传文件（用户头像）
					//用当前时间作为文件名
					Date date=new Date();
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
					//时间+格式   20171201194110.jepg
					String filename = sdf.format(date)+"."+item.getContentType().substring(6);
					//获取实际存储路径
					String t1 = request.getServletContext().getRealPath("") + "\\image"; 	
					String realFile=t1  +File.separator+ filename;
					File saveFile = new File(realFile);
					try {
						item.write(saveFile);// 把上传的内容写到一个文件中
	                    head="/ThreeBlog_V1.0/image/"+filename;
	                } catch (Exception e) {
	                    //System.out.println("文件为空，未修改头像");
	                }
				}				
			}
			//在session中获取用户id
			HttpSession session = request.getSession();
			UserBean userBean = (UserBean) session.getAttribute("userBean");
			int id = userBean.getId();

			//把数据封装到user
			UserBean user= new UserBean();
			user.setId(id);
			user.setAge(Integer.parseInt(age));
			user.setSex(sex);
			user.setIntroduction(introduction);
			user.setProvince(province);
			user.setCity(city);
			user.setHead(head);
			
			//调用服务
			UserService userService = new UserServiceImpl();
			boolean c=userService.changeInfo(user);	
			UserBean userBean2=userService.findUserInfo(id);
			if (c) {
					//System.out.println("修改个人信息保存成功！");
					response.getWriter().println(true);
					request.getSession().setAttribute("userBean", userBean2);
					response.sendRedirect(request.getContextPath()+"/jsp/personalcenter/personalcenter.jsp");
					return null;
			} else {
					//System.out.println("修改个人信息保存失败！");
					response.getWriter().println(false);
					response.sendRedirect(request.getContextPath()+"/jsp/error/error.jsp");
					return null;
			}
	}
	
	//发表文章
	public String Publish(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//创建工厂
		DiskFileItemFactory factory = new DiskFileItemFactory();
		//通过工厂创建解析器ServletFileUpload
		ServletFileUpload upload = new ServletFileUpload(factory);		
		//解析请求
		List<FileItem> list=null;
		try {
			list =upload.parseRequest(request);
		} catch (FileUploadException e) {
			e.printStackTrace();
		}
		//创建迭代器
		Iterator iterator=list.iterator();
		return "";		
	}
	
	
	
	
	
	
	
	
}
