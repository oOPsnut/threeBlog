package com.threeblog.servlet;

import com.threeblog.base.BaseServlet;
import com.threeblog.domain.ArticleBean;
import com.threeblog.domain.CommentBean;
import com.threeblog.domain.MessageBean;
import com.threeblog.filter.SensitivewordFilter;
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
 * Servlet implementation class CommentServlet
 */
@WebServlet("/CommentServlet")
public class CommentServlet extends BaseServlet {
	
	//添加评论
	public void addComment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		
		//获取数据
		String article_id = request.getParameter("article_id");
		String author_id = request.getParameter("author_id");//发评论的用户id
		String text = request.getParameter("text");
		
		String text1 = request.getParameter("text1");//文章标题
		String receiver_id = request.getParameter("receiver_id");//文章作者id
		
		//找到通过文章id找到对应文章，更新文章的评论数目
		ArticleService aService = new ArticleServiceImpl();
		ArticleBean aBean = aService.findArticle(article_id);
		int comment_num = aBean.getComment_num();
		comment_num+=1;
		aService.updateCommentNumByAId(article_id, comment_num);
		//取出更新后的值，存到session中
		ArticleBean aBean2 = aService.findArticle(article_id);
		request.getSession().setAttribute("aBean", aBean2);
		
		int zan=0;
		//UUID生成评论id
		String id = UUIDUtils.getId();
		//评论时间
		Date now=new Date();
		Date add_time=new Date(now.getTime());
		//对违规词进行*替换
		SensitivewordFilter swFilter = new SensitivewordFilter();
		text = swFilter.replaceSensitiveWord(text, 1, "*");
		CommentBean comment = new CommentBean();
		comment.setId(id);
		comment.setArticle_id(article_id);
		comment.setAuthor_id(author_id);
		comment.setAdd_time(add_time);
		comment.setText(text);
		comment.setZan(zan);
		boolean result = aService.addArticleComment(comment);
		if (result) {
			//评论添加成功
			//之后添加消息
			MessageBean message=new MessageBean();
			//UUID生成消息id
			String id1 = UUIDUtils.getId();
			//生成类型
			String type="文章留言";
			message.setId(id1);
			message.setType(type);
			message.setReceiver_id(receiver_id);
			message.setAnswer_id(author_id);
			message.setArticle_id(article_id);
			message.setText1(text1);
			message.setText2(text);
			message.setAdd_time(add_time);
			UserService uService = new UserServiceImpl();
			uService.addMessage(message);
			
			//将评论id和添加时间传回页面
			StringBuilder result2 = new StringBuilder();  
			result2.append("{")
			.append("\"comment_id\":\""+String.valueOf(id)+"\"")
			.append(",")
			.append("\"add_time\":\""+add_time+"\"")
			.append("}"); //构建json串
//			System.out.println(result2.toString());
//			response.setContentType("test/html");  
//	        response.setCharacterEncoding("UTF-8");  
	        response.getWriter().print(result2.toString()); 
		} else {
			response.getWriter().println(false);
		}
	}
	
	//添加评论回复
	public void addAnswer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		
		//获取数据
		String article_id = request.getParameter("article_id");
		String author_id = request.getParameter("author_id");//发评论的用户id
		String text = request.getParameter("text");
		
		String text1 = request.getParameter("text1");//文章标题
		String receiver_id = request.getParameter("receiver_id");//文章作者id
		
		//找到通过文章id找到对应文章，更新文章的评论数目
		ArticleService aService = new ArticleServiceImpl();
		ArticleBean aBean = aService.findArticle(article_id);
		int comment_num = aBean.getComment_num();
		comment_num+=1;
		aService.updateCommentNumByAId(article_id, comment_num);
		//取出更新后的值，存到session中
		ArticleBean aBean2 = aService.findArticle(article_id);
		request.getSession().setAttribute("aBean", aBean2);
		
		int zan=0;
		//UUID生成评论id
		String id = UUIDUtils.getId();
		//评论时间
		Date now=new Date();
		Date add_time=new Date(now.getTime());
		//对违规词进行*替换
		SensitivewordFilter swFilter = new SensitivewordFilter();
		text = swFilter.replaceSensitiveWord(text, 1, "*");
		CommentBean comment = new CommentBean();
		comment.setId(id);
		comment.setArticle_id(article_id);
		comment.setAuthor_id(author_id);
		comment.setAdd_time(add_time);
		comment.setText(text);
		comment.setZan(zan);
		boolean result = aService.addArticleComment(comment);
		if (result) {
			//评论添加成功
			//之后添加消息
			MessageBean message=new MessageBean();
			//UUID生成消息id
			String id1 = UUIDUtils.getId();
			//生成类型
			String type="文章留言";
			message.setId(id1);
			message.setType(type);
			message.setReceiver_id(receiver_id);
			message.setAnswer_id(author_id);
			message.setArticle_id(article_id);
			message.setText1(text1);
			message.setText2(text);
			message.setAdd_time(add_time);
			UserService uService = new UserServiceImpl();
			uService.addMessage(message);
			
			//将评论id和添加时间传回页面
			StringBuilder result2 = new StringBuilder();  
			result2.append("{")
			.append("\"comment_id\":\""+String.valueOf(id)+"\"")
			.append(",")
			.append("\"add_time\":\""+add_time+"\"")
			.append("}"); //构建json串
//			System.out.println(result2.toString());
//			response.setContentType("test/html");  
//	        response.setCharacterEncoding("UTF-8");  
	        response.getWriter().print(result2.toString()); 
		} else {
			response.getWriter().println(false);
		}
	}	
}
