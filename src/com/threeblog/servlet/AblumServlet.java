package com.threeblog.servlet;

import com.threeblog.base.BaseServlet;
import com.threeblog.domain.AblumBean;
import com.threeblog.domain.UserBean;
import com.threeblog.service.UserService;
import com.threeblog.serviceImpl.UserServiceImpl;
import com.threeblog.util.UUIDUtils;
import com.threeblog.util.UploadUtils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;

/**
 * Servlet implementation class AblumServlet
 */
@WebServlet("/AblumServlet")
public class AblumServlet extends BaseServlet {
	
	//上传照片
	public boolean uploadPhotos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
			
		//获取用户id和电话
		UserBean userBean = (UserBean)request.getSession().getAttribute("userBean");
		String user_id= userBean.getId();
		String phone = userBean.getPhone();
		//创建当前时间
		Date now=new Date();
		Date upload_date=new Date(now.getTime());
		//调用服务
		UserService uService = new UserServiceImpl();
		//创建ablumBean
		AblumBean ablum=new AblumBean();
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
		//boolean success=false;
		//遍历获取到的每张图片（多张照片）
		while (iterator.hasNext()) {
			FileItem item=(FileItem)iterator.next();
			if (!item.isFormField()) {
				//非表单领域（上传相册就是非表单区域）
				//当前处理item里面封装的上传文件（每张照片）
				
				//图片原始名称
				String oldFileName = item.getName();
				//图片新名称,即保存文件的名字
				String newFileName = UploadUtils.getUUIDName(oldFileName);				
				
				//通过FileItem获取到输入流对象，通过输入流可以获取到图片二进制数据
				InputStream is = item.getInputStream();
				//获取当前目录下真实路径
				String realPath = request.getServletContext().getRealPath("") + "\\image\\userablum\\"; 	
				//在/image/userablum/目录下用用户手机号码+随机数生成1+8层目录（便于服务器查找性能）
				String dir = UploadUtils.getDir(newFileName);
				String path=realPath+phone+dir;
				
				//在内存中生成一个目录
				File newDir = new File(path);
				if (!newDir.exists()) {
					newDir.mkdirs();
				}
				//在服务器创建一个新文件
				File finalFile=new File(newDir,newFileName);
				if (!finalFile.exists()) {
					finalFile.createNewFile();
				}
				//建立和空文件对应的输出流
				OutputStream os=new FileOutputStream(finalFile);
				//讲输入流中的数据刷到输出流中
				IOUtils.copy(is, os);
				//释放资源
				IOUtils.closeQuietly(is);
				IOUtils.closeQuietly(os);
				
				//将图片地址写进数据库
				//UUID生成照片id
				String id=UUIDUtils.getId();
				String photo="/ThreeBlog_V1.0/image/userablum/"+phone+"/"+dir+"/"+newFileName;
				System.out.println(photo);
				
				//将数据封装到ablum中
				ablum.setId(id);
				ablum.setUser_id(user_id);
				ablum.setPhoto(photo);
				ablum.setUpload_date(upload_date);
				
				boolean result = uService.addAblum(ablum);
				if (result) {
					response.getWriter().println(true);//上传成功
					return true;//上传成功
				}else {
					response.getWriter().println(false);//上传失败
					return false;//上传失败
				}
			}		
		}
		/*if (success) {
			response.getWriter().println(true);//上传成功
		} else {
			response.getWriter().println(false);//上传失败
		}*/
		response.getWriter().println(false);//上传失败
		return false;//上传失败
		
	}

}
