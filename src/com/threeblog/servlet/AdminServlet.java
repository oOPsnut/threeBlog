package com.threeblog.servlet;

import com.threeblog.base.BaseServlet;
import com.threeblog.domain.AdminBean;
import com.threeblog.domain.ArticleBean;
import com.threeblog.domain.NoticeBean;
import com.threeblog.domain.UserBean;
import com.threeblog.filter.SensitivewordFilter;
import com.threeblog.service.AdminService;
import com.threeblog.service.ArticleService;
import com.threeblog.service.UserService;
import com.threeblog.serviceImpl.AdminServiceImpl;
import com.threeblog.serviceImpl.ArticleServiceImpl;
import com.threeblog.serviceImpl.UserServiceImpl;
import com.threeblog.util.DateDiffUtil;
import com.threeblog.util.Md5StringUtils;
import com.threeblog.util.RandomCodeUtil;
import com.threeblog.util.UUIDUtils;

import net.sf.json.JSONObject;

import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.RandomAccessFile;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

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
			String flicense_code = request.getParameter("license_code");
			
			//对授权码进行md5加密
			String license_code = Md5StringUtils.getMD5Str(flicense_code+md5Key,null);	
			
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
					
					//发送cookie给客户端
					Cookie cookie=new Cookie("a_login", phone+"#"+password);
					cookie.setMaxAge(60*60*5);//5小时内有效
					cookie.setPath(request.getContextPath());
					response.addCookie(cookie);
									
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
	
	//修改密码（更改密码）
	public String ChangeNPasswd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
			
			//接受表单参数
			String admin_id = request.getParameter("admin");//当前管理员id
			String fpassword = request.getParameter("password");//原密码
			String phone = request.getParameter("aphone");//当前管理员电话
			String flicense_code = request.getParameter("license_code");//授权码
			String fnewpassword = request.getParameter("newpassword");//新密码
			String fnewpassword1 = request.getParameter("newpassword1");//确认密码
			
			//System.out.println(fnewpassword+"="+fnewpassword1);
			
			//MD5加密
			String password = Md5StringUtils.getMD5Str(fpassword+md5Key,null);	
			
			//调用业务层修改密码
			AdminService adminService=new AdminServiceImpl();
			boolean r = adminService.checkPasswd(admin_id, password);
			if (r) {
				//原密码输入正确
				//对授权码进行md5加密
				String license_code = Md5StringUtils.getMD5Str(flicense_code+md5Key,null);	
				boolean code = adminService.CheckLicenseCode(phone, license_code);
				if (code) {
					//授权码正确
					if (fnewpassword.equals(fnewpassword1)) {
						//密码一致
						//MD5加密
						String newpassword = Md5StringUtils.getMD5Str(fnewpassword+md5Key,null);	
						boolean result = adminService.changePasswd(phone, newpassword);
						if (result) {
							return "/admin/login/admin_login.jsp";
						}else {
							//修改失败，跳转到提示页面
							return "/admin/error/error.jsp";
						}
					} else {
						request.setAttribute("errorMsg", "两次输入密码不一致！");
						return "/admin/index/personalcenter.jsp";
					}
				} else {
					request.setAttribute("errorMsg", "授权码错误！");
					return "/admin/index/personalcenter.jsp";
				}
				
			} else {
				request.setAttribute("errorMsg", "原密码错误！");
				return "/admin/index/personalcenter.jsp";
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
		
		//数据初始化
		String admin_username=null;
		String admin_id = null;
		String admin_phone=null;
		//从session中获取用户名
		AdminBean adminBean = (AdminBean)request.getSession().getAttribute("adminBean");	
		if(adminBean!=null) {
			admin_username = adminBean.getUsername();
			admin_id = adminBean.getId();
			admin_phone = adminBean.getPhone();
			//System.out.println(admin_id+"="+admin_username);
		}
		
		//调用服务
		AdminService adminService = new AdminServiceImpl();
		
		//用UUID生成公告id
		String id = UUIDUtils.getId();
		//注册时间
		Date now=new Date();
		Date publish_date=new Date(now.getTime());
				
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
				}else if (adminBean==null) {
					if (item.getFieldName().equals("author")) {
						admin_username=value;	
						AdminBean admin = adminService.findAdminByAUsername(admin_username);
						admin_id = admin.getId();
						admin_phone = admin.getPhone();
					}
					
				}
			}else{
				//当前处理item里面封装的上传文件（公告封面）
				//用用户管理员手机号+当前时间作为文件名
				Date date=new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				//手机号+时间+格式   136xxxx2211_20171201194110.jepg
				String filename = admin_phone+"_"+sdf.format(date)+"."+item.getContentType().substring(6);
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
	
	//删除公告
	public void DeleteNotice(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		
		//获取数据
		String id = request.getParameter("id");//公告id
		
		//调用服务删除公告
		AdminService adminService = new AdminServiceImpl();
		boolean r = adminService.deleteNotice(id);
		if (r) {		
			response.getWriter().println(true);		
		} else {
			response.getWriter().println(false);
		}
	}
		
	//限制用户（封号）
	public void LimitUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		
		//获取数据
		String username = request.getParameter("username");
		String get_time = request.getParameter("ban_time");
		
		//更改格式
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date ban_time=null;
		try {
			ban_time = sdf.parse(get_time);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		//调用服务
		AdminService adminService = new AdminServiceImpl();
		boolean r = adminService.limitUser(username,ban_time);
		if (r) {		
			response.sendRedirect(request.getContextPath()+"/admin/index/user_manage.jsp");	
		} else {
			response.sendRedirect(request.getContextPath()+"/admin/error/error.jsp");
		}
	}
	
	
	//更改文章封面（涉嫌违规图片）
	public void ChangeACover(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		
		//获取数据
		String id = request.getParameter("id");//文章id
		
		//调用服务
		ArticleService aService = new ArticleServiceImpl();
		boolean r = aService.ChangeACover(id);
		if (r) {		
			response.getWriter().println(true);		
		} else {
			response.getWriter().println(false);
		}
	}
	
	//更改用户头像（涉嫌违规图片）
	public void ChangeUserHead(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		
		//获取数据
		String id = request.getParameter("id");//用户id
		
		//调用服务
		UserService uService = new UserServiceImpl();
		boolean r = uService.ChangeUserHead(id);
		if (r) {		
			response.getWriter().println(true);		
		} else {
			response.getWriter().println(false);
		}
	}
	
	//更改用户相册（涉嫌违规图片）
	public void ChangePhoto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		
		//获取数据
		String id = request.getParameter("id");//相册id
		
		//调用服务
		UserService uService = new UserServiceImpl();
		boolean r = uService.ChangePhoto(id);
		if (r) {		
			response.getWriter().println(true);		
		} else {
			response.getWriter().println(false);
		}
	}
	
	
	//查找用户
	public String SearchUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		
		//获取数据
		String username = request.getParameter("username");//相册id
		
		//调用服务
		UserService uService = new UserServiceImpl();
		List<UserBean> list = uService.SearchUser(username);
		if (!list.isEmpty()) {	
			request.setAttribute("SURList", list);
			return "/admin/index/searchUList.jsp";		
		} else {
			response.getWriter().println(1);
			return null;
		}
	}
	
	//查找博文
	public String SearchArticle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		
		//获取数据
		String content = request.getParameter("content");
		//System.out.println(word);
		//查询数据库
		ArticleService aService = new ArticleServiceImpl();
		List<ArticleBean> list = aService.fingAllAboutWord(content);
		//System.out.println(list);
		//返回数据
		if (list.isEmpty()) {
			response.getWriter().println(1);
			return null;
		} else {
			request.setAttribute("list", list);
			return "/admin/index/searchAList.jsp";
		}
	}
	
	
	//屏蔽博文
	public void HideArticle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		
		//获取数据
		String id = request.getParameter("id");

		//调用服务
		ArticleService aService = new ArticleServiceImpl();
		boolean r = aService.HideArticle(id);

		//返回数据
		if (r) {
			response.getWriter().println(true);//成功
		} else {
			response.getWriter().println(false);
		}
	}
	
	
	//展示所有博文
	public String FindAllArticle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		
		//查询数据库
		ArticleService aService = new ArticleServiceImpl();
		List<ArticleBean> list = aService.findAllACover();
		
		//返回数据
		request.setAttribute("list", list);
		return "/admin/index/acList.jsp";
		
	}
	
	//展示对应类型的博文
	public String FindArticleByType(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		
		//获取对应类型
		String article_type = request.getParameter("article_type");
		
		//查询数据库
		ArticleService aService = new ArticleServiceImpl();
		List<ArticleBean> list = aService.findAllArticleByType(article_type);
		
		//返回数据
		request.setAttribute("list", list);
		return "/admin/index/acList.jsp";	
	}
	
	//检查密码是否正确（添加管理员）
	public void checkPasswd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		
		//获取数据
		String id = request.getParameter("id");
		String fpassword = request.getParameter("passwd");
		//MD5加密
		String password = Md5StringUtils.getMD5Str(fpassword+md5Key,null);
		
		//调用服务
		AdminService adminService = new AdminServiceImpl();
		boolean r = adminService.checkPasswd(id,password);

		//返回数据
		if (r) {
			response.getWriter().println(true);//密码输入正确
		} else {
			response.getWriter().println(false);
		}
	}
	
	
	//检查手机号是否使用过（添加管理员）
	public void checkAdminPhone(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		
		//获取数据
		String phone = request.getParameter("phone");
		
		//调用服务
		AdminService adminService = new AdminServiceImpl();
		boolean r = adminService.checkAdminPhone(phone);

		//返回数据
		if (r) {
			response.getWriter().println(false);//已注册
		} else {
			response.getWriter().println(true);//可用
		}
	}
	
	
	//添加管理员
	public String addAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		
		//获取数据
		String admin_id = request.getParameter("admin");//当前管理员id
		String fpassword = request.getParameter("password");//当前管理员密码
		String phone = request.getParameter("phone");//新管理员的手机号
		
		//MD5加密
		String password = Md5StringUtils.getMD5Str(fpassword+md5Key,null);
		
		//调用服务
		AdminService adminService = new AdminServiceImpl();
		boolean r = adminService.checkPasswd(admin_id,password);//检查当前密码是否正确（验证身份）

		//返回数据
		if (r) {
			boolean s = adminService.checkAdminPhone(phone);//检查手机号是否已注册			
			//返回数据
			if (s) {
				//已注册
				request.setAttribute("errorMsg", "该手机号已注册！");
				return "/admin/index/admin_manage.jsp";
			} else {
				//可添加管理员
				//UUID生成管理员id
				String id = UUIDUtils.getId();
				//随机生成10位的授权码
				String flicense_code = RandomCodeUtil.getRandStrCode(10);
				//对授权码进行md5加密
				String license_code = Md5StringUtils.getMD5Str(flicense_code+md5Key,null);	
				//将数据封装到adminBean中
				AdminBean admin =  new AdminBean();
				admin.setId(id);
				admin.setPhone(phone);
				admin.setLicense_code(license_code);
				//调用函数
				boolean result = adminService.addAdmin(admin);
				if (result) {
					request.setAttribute("errorMsg", "添加成功，请自行复制并发给对应管理员！");
					request.setAttribute("Msg", "授权码为："+flicense_code);
					return "/admin/index/admin_manage.jsp";
				} else {
					request.setAttribute("errorMsg", "出错，请稍后再试！");
					return "/admin/index/admin_manage.jsp";
				}
			}
		} else {
			request.setAttribute("errorMsg", "密码错误！");
			return "/admin/index/admin_manage.jsp";
		}
	}
	
	//删除管理员
	public void DeleteAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		
		//获取数据
		String id = request.getParameter("id");
		
		//调用服务
		AdminService adminService = new AdminServiceImpl();
		boolean r = adminService.DeleteAdmin(id);

		//返回数据
		if (r) {
			response.getWriter().println(true);//成功
		} else {
			response.getWriter().println(false);//删除失败
		}
	}
	
	//检查违规词是否存在
	public String CheckIllegalWord(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		
		//获取数据
		String word = request.getParameter("word");
		
		//检查违规词，出现则将其改为*
		SensitivewordFilter swFilter = new SensitivewordFilter();
		Set<String> sensitiveWord = swFilter.getSensitiveWord(word, 1);
		boolean sensitive = swFilter.isSensitive(word);
		//返回数据
		if (sensitive) {
			request.setAttribute("CheckMsg", "存在违规词，其为："+sensitiveWord);
			return "/admin/index/illegal_manage.jsp";
		} else {
			request.setAttribute("CheckMsg", "不存在违规词，或词库中不包含");
			return "/admin/index/illegal_manage.jsp";
		}
	}
	
	//添加违规词
	public String AddIllegalWord(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		
		//获取数据
		String word = request.getParameter("word");
		
		
		String fileName="F:\\Tomcat\\Tomcat\\apache-tomcat-7.0.85\\webapps\\ThreeBlog_V1.0\\key.txt";
		try {
			// 打开一个随机访问文件流，按读写方式
			RandomAccessFile randomFile = new RandomAccessFile(fileName, "rw");
			// 文件长度，字节数
			long fileLength = randomFile.length();
				// 将写文件指针移到文件尾。
				randomFile.seek(fileLength);
				//randomFile.writeUTF(word+"\r\n");
				randomFile.write(("\r\n"+word).getBytes("utf-8"));
				//randomFile.write(("\r\n"+word).getBytes());
				randomFile.close();
			} catch (IOException e) {
			e.printStackTrace();
		}
		//检查违规词，出现则将其改为*
		SensitivewordFilter swFilter = new SensitivewordFilter();
		boolean sensitive = swFilter.isSensitive(word);
		//返回数据
		if (sensitive) {
			request.setAttribute("AddMsg", "添加成功");
			return "/admin/index/illegal_manage.jsp";
		} else {
			request.setAttribute("AddMsg", "添加失败，请稍后再试");
			return "/admin/index/illegal_manage.jsp";
		}
	}
	
	
	//举报信息（已阅）
	public void ReadReport(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		
		//获取数据
		String id = request.getParameter("id");
		
		//通知时间
		Date now=new Date();
		Date notice_time=new Date(now.getTime());
		//调用服务
		AdminService adminService = new AdminServiceImpl();
		boolean r = adminService.ReadReport(id,notice_time);

		//返回数据
		if (r) {
			response.getWriter().println(true);//成功
		} else {
			response.getWriter().println(false);//失败
		}
	}
	
	//举报信息（屏蔽）
	public void HideTarget(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		
		//获取数据
		String rid = request.getParameter("rid");//举报id
		String cid = request.getParameter("cid");//目标id
		String ctype = request.getParameter("ctype");//目标类型
		
		
		//通知时间
		Date now=new Date();
		Date notice_time=new Date(now.getTime());
		//调用服务
		ArticleService aService = new ArticleServiceImpl();
		AdminService adminService = new AdminServiceImpl();
		if (ctype.equals("举报文章")) {
			//举报目标是文章
			boolean r = adminService.changeReport(rid,notice_time);
			if (r) {
				boolean article = aService.HideArticle(cid);
				if (article) {
					response.getWriter().println(true);//成功					
				} else {
					response.getWriter().println(false);//失败
				}
			} else {
				response.getWriter().println(false);//失败
			}	
		} else if(ctype.equals("举报留言")){
			//举报目标是留言
			boolean r = adminService.changeReport(rid,notice_time);
			if (r) {
				boolean comment = aService.HideComment(cid);
				if (comment) {
					response.getWriter().println(true);//成功					
				} else {
					response.getWriter().println(false);//失败
				}
			} else {
				response.getWriter().println(false);//失败
			}			
		}else if(ctype.equals("举报回复")) {
			//举报目标是回复
			boolean r = adminService.changeReport(rid,notice_time);
			if (r) {
				boolean answer = aService.HideAnswer(cid);
				if (answer) {
					response.getWriter().println(true);//成功					
				} else {
					response.getWriter().println(false);//失败
				}
			} else {
				response.getWriter().println(false);//失败
			}	
		}	
	}
	
	
	//反馈信息（通过）
	public void PassRenew(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		
		//获取数据
		String rid = request.getParameter("rid");//举报id
		String cid = request.getParameter("cid");//目标id
		String ctype = request.getParameter("ctype");//目标类型
		
		//通知时间
		Date now=new Date();
		Date notice_time=new Date(now.getTime());
		//调用服务
		ArticleService aService = new ArticleServiceImpl();
		AdminService adminService = new AdminServiceImpl();
		if (ctype.equals("举报文章")) {
			//举报目标是文章
			boolean r = adminService.PassRenew(rid,notice_time);
			if (r) {
				boolean article = aService.PassRenewArticle(cid);
				if (article) {
					response.getWriter().println(true);//成功					
				} else {
					response.getWriter().println(false);//失败
				}
			} else {
				response.getWriter().println(false);//失败
			}	
		} else if(ctype.equals("举报留言")){
			//举报目标是留言
			boolean r = adminService.PassRenew(rid,notice_time);
			if (r) {
				boolean comment = aService.PassRenewComment(cid);
				if (comment) {
					response.getWriter().println(true);//成功					
				} else {
					response.getWriter().println(false);//失败
				}
			} else {
				response.getWriter().println(false);//失败
			}			
		}else if(ctype.equals("举报回复")) {
			//举报目标是回复
			boolean r = adminService.PassRenew(rid,notice_time);
			if (r) {
				boolean answer = aService.PassRenewAnswer(cid);
				if (answer) {
					response.getWriter().println(true);//成功					
				} else {
					response.getWriter().println(false);//失败
				}
			} else {
				response.getWriter().println(false);//失败
			}	
		}	
	}
	
	
	//反馈信息（不通过）
	public void NotPassRenew(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		
		//获取数据
		String id = request.getParameter("id");
		
		//通知时间
		Date now=new Date();
		Date notice_time=new Date(now.getTime());
		//调用服务
		AdminService adminService = new AdminServiceImpl();
		boolean r = adminService.NotPassRenew(id,notice_time);

		//返回数据
		if (r) {
			response.getWriter().println(true);//成功
		} else {
			response.getWriter().println(false);//失败
		}
	}
}
