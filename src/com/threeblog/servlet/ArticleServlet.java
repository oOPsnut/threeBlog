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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.threeblog.base.BaseServlet;
import com.threeblog.domain.ArticleBean;
import com.threeblog.domain.ArticleTypeBean;
import com.threeblog.domain.ArticleBean;
import com.threeblog.domain.UserBean;
import com.threeblog.domain.ZanBean;
import com.threeblog.filter.SensitivewordFilter;
import com.threeblog.service.ArticleService;
import com.threeblog.service.UserService;
import com.threeblog.serviceImpl.ArticleServiceImpl;
import com.threeblog.serviceImpl.UserServiceImpl;
import com.threeblog.util.UUIDUtils;

/**
 * Servlet implementation class ArticleServlet
 */
@WebServlet("/ArticleServlet")
public class ArticleServlet extends BaseServlet {
	
	//发表文章
	public String Publish(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
			
		try {
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
			//从表单获取
			String publish_fm=null;
			String bt=null;
			String label=null;
			String publish_type=null;
			String publish_daoyu=null;
			String editor=null;
			String allpic="";
			//从session中获取用户id和用户username
			HttpSession session=request.getSession();
			UserBean userBean = (UserBean) session.getAttribute("userBean");
			String author_id = userBean.getId();
			String author = userBean.getUsername();
			
			while(iterator.hasNext()){
				FileItem item=(FileItem)iterator.next();
				if(item.isFormField()){
					String value=item.getString("UTF-8");
					if(item.getFieldName().equals("bt")){
						bt=value;
					}else if(item.getFieldName().equals("label")){
						label=value;
					}else if (item.getFieldName().equals("publish_type")) {
						publish_type=value;
					}else if(item.getFieldName().equals("publish_daoyu")){
						publish_daoyu=value;
					}else if(item.getFieldName().equals("editor")){
						editor=value;
					}
				}else{
					//当前处理item里面封装的上传文件（文章封面）
					//用当前时间作为文件名
					Date date=new Date();
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
					//时间+格式   20171201194110.jepg
					String filename = sdf.format(date)+"."+item.getContentType().substring(6);
					//获取实际存储路径
					String t1 = request.getServletContext().getRealPath("") + "\\image\\images"; 	
					String realFile=t1  +File.separator+ filename;
					File saveFile = new File(realFile);
					try {
						item.write(saveFile);// 把上传的内容写到一个文件中
						publish_fm="/ThreeBlog_V1.0/image/images/"+filename;
	                } catch (Exception e) {
	                    e.printStackTrace();
	                }
				}
			}
			//用indexOf方法查找文章中的图片路径，将其存储起来
			int current=0,a,b;
			String pattern_a="src=\""; //查找“ src=" ”，比如：<img src="">//为了找到开头:src="
			String pattern_b="\"";    //查找“ " ”，//为了找到结束 :"
			//循环查找文章中的img的src=" xxx ";
			while(true){
				a=editor.indexOf(pattern_a,current);  //查找返回s的位置
				if(a==-1) break;
				a+=pattern_a.length();  //a现在的位置为\的下一位,即h
				current=a;
				b=editor.indexOf(pattern_b,current); //查找返回s的位置 下一个查找从\的下一位(h)开始
				if(b==-1) break;
				String result=editor.substring(a,b);//[a,b)
				allpic=allpic+result+"#";
				current=b+pattern_b.length();//"的下一位		
			}
			//发表时间
			Date now=new Date();
//			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//			java.sql.Date publish_date = sdf.format(now);
			Date publish_date=new Date(now.getTime());	
			//检查违规词，出现则将其改为*
			SensitivewordFilter swFilter = new SensitivewordFilter();
			bt = swFilter.replaceSensitiveWord(bt, 1, "*");
			label = swFilter.replaceSensitiveWord(label, 1, "*");
			publish_daoyu = swFilter.replaceSensitiveWord(publish_daoyu, 1, "*");
			editor = swFilter.replaceSensitiveWord(editor, 1, "*");
			//置查看、喜欢、收藏、评论数目为0
			int click_num=0;
			int liked_num=0;
			int collect_num=0;
			int comment_num=0;
			//UUID生成文章id
			String id = UUIDUtils.getId();
			//把数据封装到article
			ArticleBean article = new ArticleBean();
			article.setId(id);
			article.setAuthor_id(author_id);//作者id
			article.setAuthor(author);//作者
			article.setCover(publish_fm);//封面
			article.setTitle(bt);//标题
			article.setIntroduction(publish_daoyu);//导语
			article.setLabel(label);//标签
			article.setText(editor);//文章内容
			article.setAllpic(allpic);//文章图片
			article.setPublish_date(publish_date);//发表时间
			article.setClick_num(click_num);//查看数
			article.setLiked_num(liked_num);//喜欢数
			article.setCollect_num(collect_num);//收藏数
			article.setComment_num(comment_num);//评论数
			
			//UUID生成文章类型表id
			String id2 = UUIDUtils.getId();
			//把数据封装到articleType
			ArticleTypeBean articleType = new ArticleTypeBean();
			articleType.setId(id2);
			articleType.setAuthor_id(author_id);
			articleType.setArticle_id(id);
			articleType.setArticle_type(publish_type);
			
			//调用业务层注册功能
			ArticleService aService = new ArticleServiceImpl();
			boolean result = aService.addArticle(article);
			boolean result2 = aService.addArticleType(articleType);
			if (result&&result2) {
				//发表成功，通过文章id取出所有文章信息
				ArticleBean aBean = aService.findArticle(id);
				//通过类型id，取出类型信息
				ArticleTypeBean aTypeBean = aService.findArticleType(id2);
				//更新信息，保存到session中
				request.getSession().setAttribute("aBean", aBean);
				request.getSession().setAttribute("aTypeBean", aTypeBean);
				response.sendRedirect(request.getContextPath()+"/jsp/article/article.jsp?id="+id);
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
		
		
		//检测是否出现违规词
		public void CheckSensitiveWd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			//获取表单数据
			String bt = request.getParameter("bt");
			String label = request.getParameter("labels");
			String dy = request.getParameter("dy");
			String aTxt = request.getParameter("aTxt");
			
			ArticleBean article = new ArticleBean();
			SensitivewordFilter swFilter = new SensitivewordFilter();
			//判断是否存在违规词:标题，标签，导语，文章
			boolean bisExist = swFilter.isContaintSensitiveWord(bt, 1);
			boolean lisExist = swFilter.isContaintSensitiveWord(label, 1);
			boolean disExist = swFilter.isContaintSensitiveWord(dy, 1);
			boolean aisExist = swFilter.isContaintSensitiveWord(aTxt, 1);
			//任何一个地方出现违规词语，都不通过，将结果返回给前端
			if (bisExist) {
				//标题存在违规词
				response.getWriter().println(1);
			} else if (lisExist) {
				//标签存在违规词
				response.getWriter().println(2);
			}else if (disExist) {
				//导语存在违规词
				response.getWriter().println(3);
			}else if (aisExist) {
				//文章存在违规词
				response.getWriter().println(4);
			}else {
				//无违规词
				response.getWriter().println(0);
			}
		}
		
		//为文章添加赞
		public void AddArticleZan(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
				
			//获取数据
			String article_id = request.getParameter("article_id");
			String receiver_id = request.getParameter("receiver_id");
			String sender_id = request.getParameter("sender_id");
			String text = request.getParameter("text");
			String zpic=request.getParameter("zpic");
			
			//通过文章id查找对应文章并将点赞数更新上去
			ArticleService aService = new ArticleServiceImpl();
			ArticleBean aBean = aService.findArticle(article_id);
			int liked_num = aBean.getLiked_num();
			liked_num+=1;
			aService.updateLikedNumByAId(article_id, liked_num);
			//取出更新后的值，存到session中
			ArticleBean aBean2 = aService.findArticle(article_id);
			request.getSession().setAttribute("aBean", aBean2);
			
			//将数据写进点赞表
			ZanBean zan = new ZanBean();
			//UUID生成点赞id
			String id = UUIDUtils.getId();
			String type="文章点赞";
			//点赞时间
			Date now=new Date();
			Date add_time=new Date(now.getTime());
			//将数据封装到zBean中
			zan.setId(id);
			zan.setType(type);
			zan.setReceiver_id(receiver_id);
			zan.setSender_id(sender_id);
			zan.setArticle_id(article_id);
			zan.setText(text);
			zan.setAdd_time(add_time);
			zan.setZpic(zpic);
			boolean result = aService.addArticleZan(zan);
			if (result) {
				//插入成功
				//取出赞信息，存到session中
				ZanBean zBean = aService.findArticleZan(id);
				request.getSession().setAttribute("zBean", zBean);
				response.getWriter().println(true);
			} else {
				response.getWriter().println(false);	
			}								
		}

		//为文章取消赞
		public void UpdateArticleZan(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
				
			//获取数据
			String article_id = request.getParameter("article_id");
			String id = request.getParameter("id");
			String zpic=request.getParameter("zpic");
			
			//通过文章id查找对应文章并将点赞数更新上去
			ArticleService aService = new ArticleServiceImpl();
			ArticleBean aBean = aService.findArticle(article_id);
			int liked_num = aBean.getLiked_num();
			liked_num-=1;
			aService.updateLikedNumByAId(article_id, liked_num);
			//取出更新后的值，存到session中
			ArticleBean aBean2 = aService.findArticle(article_id);
			request.getSession().setAttribute("aBean", aBean2);
			
			//将数据写进点赞表
			ZanBean zan = new ZanBean();			
			//将数据封装到zBean中
			zan.setId(id);
			zan.setZpic(zpic);
			boolean result = aService.UpdateArticleZan(zan);
			if (result) {
				//更新成功
				//取出赞信息，存到session中
				ZanBean zBean = aService.findArticleZan(id);
				request.getSession().setAttribute("zBean", zBean);
				response.getWriter().println(true);
			} else {
				response.getWriter().println(false);	
			}								
		}
}
