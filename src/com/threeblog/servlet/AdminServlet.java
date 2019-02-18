package com.threeblog.servlet;

import com.threeblog.base.BaseServlet;
import com.threeblog.domain.AdminBean;
import com.threeblog.domain.NoticeBean;
import com.threeblog.domain.UserBean;
import com.threeblog.service.AdminService;
import com.threeblog.service.UserService;
import com.threeblog.serviceImpl.AdminServiceImpl;
import com.threeblog.serviceImpl.UserServiceImpl;
import com.threeblog.util.DateDiffUtil;
import com.threeblog.util.Md5StringUtils;
import com.threeblog.util.UUIDUtils;

import net.sf.json.JSONObject;

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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/AdminServlet")
public class AdminServlet extends BaseServlet {
	
	//固定字符串（md5key）用于注册、登陆、自动登陆、修改密码
	private static final String md5Key = "4sFy68UxuP";
	//前端加密字段
	private static final String md5KeyR = "jL2NdrALvN";
	
	//用户注册
	public String AdminRegister(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//接受表单参数
		String phone = request.getParameter("phone");
		String username = request.getParameter("username");
		String fpassword = request.getParameter("password1");		
						
		//MD5加密
		String password = Md5StringUtils.getMD5Str(fpassword+md5Key,null);		
		
		AdminBean user=new AdminBean();
		//注册时间
		Date now=new Date();
		Date register_time=new Date(now.getTime());
		
		//调用业务层注册功能
		AdminService adminService=new AdminServiceImpl();
		try {
			//注册成功，跳转到登录页
			boolean result = adminService.AdminRegister(phone,username,password,register_time);
			if (result) {
//					response.getWriter().print("<script>alert('注册成功，将自动返回登录页面！')</script>");
				return "/admin/login/admin_login.jsp";
			}else {
				//注册失败，跳转到提示页面
//					response.getWriter().print("<script>alert('注册失败！')</script>");
				return "/admin/error/error.jsp";
			}
		} catch (Exception e) {
			//注册失败，跳转到提示页面
//				response.getWriter().print("<script>alert('未知错误！')</script>");
			return "/admin/error/error.jsp";
		}
	}
	
	//检测手机号是否已被注册(regiseter)
	public void CheckPhone(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			//检测是否存在
			String phone = request.getParameter("phone");
			
			AdminService adminService=new AdminServiceImpl();
			boolean pisExist = adminService.checkPhone(phone);		
			
			//通知页面
			if (pisExist) {
				response.getWriter().println(true);//手机号存在
			}else {
				response.getWriter().println(false);//手机号不存在
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//检测手机号是否已被注册(forgetpasswd)
	public void newCheckPhone(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			//检测是否存在
			String phone = request.getParameter("phone");
			
			AdminService adminService=new AdminServiceImpl();
			boolean pisExist = adminService.checkPhone(phone);;			
			
			//通知页面
			if (pisExist) {
				response.getWriter().println(true);//手机号已注册
			}else {
				response.getWriter().println(false);//手机号未注册
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}	
	
	//检测用户名是否使用
	public void CheckUsername(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			//检测是否存在
			String username = request.getParameter("username");
			
			
			AdminService adminService=new AdminServiceImpl();
			boolean uisExist = adminService.checkUserName(username);
			
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
	
	//检测授权码是否正确
	public void CheckLicenseCode(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			//检测是否存在
			String phone = request.getParameter("phone");
			String license_code = request.getParameter("license_code");
			
			
			AdminService adminService=new AdminServiceImpl();
			boolean uisExist = adminService.CheckLicenseCode(phone,license_code);
			
			//通知页面到底有还是没有
			if (uisExist) {
				response.getWriter().println(true);//授权码输入正确
			}else {
				response.getWriter().println(false);//授权码输入错误
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
//				Date date=new Date();
//				SimpleDateFormat sDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//				String create_time = sDateFormat.format(date);
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
	public String AdminLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			try {
				//接受表单参数
				String phone = request.getParameter("phone");
				String fpassword = request.getParameter("password");			
								
				AdminBean admin = new AdminBean();
				
				//MD5加密
				String password = Md5StringUtils.getMD5Str(fpassword+md5Key,null);								
				admin.setPhone(phone);
				admin.setPassword(password);
				
				//调用业务层登录功能
				AdminService adminService=new AdminServiceImpl();
				AdminBean adminBean = adminService.AdminLogin(admin);
				if (adminBean != null) {
					//成功登录
					
					//获取用户id
					String id=adminBean.getId();
				
					//创建当前时间
					Date date=new Date();
					Date last_login_time=new Date(date.getTime());
					adminBean.setLast_login_time(last_login_time);
					//更新登录时间
					adminService.changeLoginTime(id,last_login_time);
									
					//添加CKFinder_UserRole属性。给予使用ckfinder的权限。
					request.getSession().setAttribute("CKFinder_UserRole","admin");
					
					request.getSession().setAttribute("adminBean", adminBean);
					response.sendRedirect(request.getContextPath()+"/admin/index/index.jsp");
					return null;
					
				}else {
					//登录不成功,发送错误消息
					request.setAttribute("errorMsg", "账号或密码错误，请重新登录！");
					//response.sendRedirect(request.getContextPath()+"/jsp/login/login.jsp");
					return "/admin/login/admin_login.jsp";
				}					
			} catch (Exception e) {
				return "/jsp/login/login.jsp";
			}
	}
	
	//修改密码（忘记密码）
	public String changePasswd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			//接受表单参数
			String phone = request.getParameter("phone");
			String fpassword = request.getParameter("newpasswd1");
							
			UserBean user=new UserBean();
			//MD5加密
			String password = Md5StringUtils.getMD5Str(fpassword+md5Key,null);	
			
			//调用业务层修改密码
			AdminService adminService=new AdminServiceImpl();
			try {
				//修改成功，跳转到登录页
				boolean result = adminService.changePasswd(phone,password);
				if (result) {
					return "/admin/login/admin_login.jsp";
				}else {
					//修改失败，跳转到提示页面
					return "/admin/error/error.jsp";
				}
			} catch (Exception e) {
				//修改失败，跳转到提示页面
				return "/admin/error/error.jsp";
			}
		}

	//退出登录
	public String LoginOut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 删除cookie和session
        HttpSession session = request.getSession();
        session.removeAttribute("adminBean");
        session.removeAttribute("CKFinder_UserRole");//移除ckfinder属性
        session.invalidate();
               
        // 重定向到首页
        response.sendRedirect(request.getContextPath()+"/admin/login/admin_login.jsp");
		return null;
	}
		
	//公告发布
	public String NoticePublish(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		
		//从session中获取用户名
		AdminBean adminBean = (AdminBean)request.getSession().getAttribute("adminBean");		
		String admin_username = adminBean.getUsername();
		String admin_id = adminBean.getId();
		//System.out.println(admin_id+"="+admin_username);
		
		//用UUID生成公告id
		String id = UUIDUtils.getId();
		//注册时间
		Date now=new Date();
		java.sql.Date publish_date=new java.sql.Date(now.getTime());
				
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
		String type=null;
		String title = null;
		String photo = null;
		String content = null;
		
		while(iterator.hasNext()){
			FileItem item=(FileItem)iterator.next();
			if(item.isFormField()){
				String value=item.getString("UTF-8");
				if(item.getFieldName().equals("colId")){
					type=value;
				}else if(item.getFieldName().equals("title")){
					title=value;
				}else if (item.getFieldName().equals("content")) {
					content=value;
				}
			}else{
				//当前处理item里面封装的上传文件（公告封面）
				//用用户管理员名称+当前时间作为文件名
				Date date=new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				//手机号+时间+格式   136xxxx2211_20171201194110.jepg
				String filename = admin_username+"_"+sdf.format(date)+"."+item.getContentType().substring(6);
				//获取实际存储路径
				String t1 = request.getServletContext().getRealPath("") + "\\image\\noticecover"; 	
				String realFile=t1  +File.separator+ filename;
				File saveFile = new File(realFile);
				if (!saveFile.exists()) {
					saveFile.createNewFile();
				}
				try {
					item.write(saveFile);// 把上传的内容写到一个文件中
					photo="/ThreeBlog_V1.0/image/noticecover/"+filename;
                } catch (Exception e) {
                    e.printStackTrace();
                }
			}
		}
		
		//将数据封装到notice中
		NoticeBean notice = new NoticeBean();
		notice.setId(id);
		notice.setAdmin_id(admin_id);
		notice.setAdmin_username(admin_username);
		notice.setType(type);
		notice.setTitle(title);
		notice.setPublish_date(publish_date);
		notice.setContent(content);
		notice.setPhoto(photo);
        
		AdminService adminService = new AdminServiceImpl();
		boolean result =  adminService.addNotice(notice);
		if (result) {	
			//发布成功
			// 重定向到首页
			response.sendRedirect(request.getContextPath()+"/admin/index/notice_board.jsp?id="+id);
			return null;
		} else {
			//发布失败
			response.sendRedirect(request.getContextPath()+"/admin/error/error.jsp");
			return null;
		}
	}
}
