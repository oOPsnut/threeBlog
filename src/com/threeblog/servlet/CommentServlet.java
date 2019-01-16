package com.threeblog.servlet;

import com.threeblog.base.BaseServlet;
import com.threeblog.domain.AnswerBean;
import com.threeblog.domain.ArticleBean;
import com.threeblog.domain.CommentBean;
import com.threeblog.domain.MessageBean;
import com.threeblog.domain.ZanBean;
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
	
	//添加留言
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
	
	//添加留言回复
	public void addAnswer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		
		//获取数据
		String author_id = request.getParameter("author_id");//发留言回复的用户id
		String comment_id = request.getParameter("comment_id");//留言id
		int flag = Integer.parseInt(request.getParameter("flag"));//标记
		String last_answer_id = request.getParameter("last_answer_id");//最新回复者id
		String article_id = request.getParameter("article_id");	//文章id
		String text = request.getParameter("text2");//回复内容
		
		//找到通过文章id找到对应文章，更新文章的留言数目
		ArticleService aService = new ArticleServiceImpl();
		ArticleBean aBean = aService.findArticle(article_id);
		int comment_num = aBean.getComment_num();
		comment_num+=1;
		aService.updateCommentNumByAId(article_id, comment_num);
		//取出更新后的值，存到session中
		ArticleBean aBean2 = aService.findArticle(article_id);
		request.getSession().setAttribute("aBean", aBean2);
		//初始化赞数目
		int zan=0;
		//UUID生成留言回复id
		String id = UUIDUtils.getId();
		//留言回复时间
		Date now=new Date();
		Date add_time=new Date(now.getTime());
		//对违规词进行*替换
		SensitivewordFilter swFilter = new SensitivewordFilter();
		text = swFilter.replaceSensitiveWord(text, 1, "*");
		AnswerBean answer=new AnswerBean();
		answer.setId(id);
		answer.setComment_id(comment_id);
		answer.setAuthor_id(author_id);
		answer.setText(text);
		answer.setAdd_time(add_time);
		answer.setZan(zan);
		boolean result = aService.addArticleCommentAnswer(answer);
		if (result) {
			//留言回复添加成功
			//通过flag判断情况：flag的意思是判断是给留言回复还是给回复回复。
			//情况1：comment_id与answer_id重叠且相等
			//即：回复是给留言回复
			if (flag==1) {
				//仅对留言作者进行消息推送
				
				//之后添加消息
				MessageBean message=new MessageBean();
				//UUID生成消息id
				String id1 = UUIDUtils.getId();
				//生成类型
				String type="留言回复";
				//通过comment_id从comment中取留言作者id
				CommentBean comment = aService.getCommentFromComment_id(comment_id);
				String receiver_id = comment.getAuthor_id();//留言者id
				String text1 = comment.getText();//留言内容
				//回复内容规范格式
				int start=text.indexOf(":");
				int start2=text.indexOf(":",start+1);
				String t=text.substring(start2+1);
				//将数据封装到message中
				message.setId(id1);
				message.setType(type);
				message.setReceiver_id(receiver_id);
				message.setAnswer_id(author_id);
				message.setArticle_id(article_id);
				message.setText1(text1);
				message.setText2(t);
				message.setAdd_time(add_time);
				UserService uService = new UserServiceImpl();
				uService.addMessage(message);				
			}else {
				//flag=0;即回复给留言回复 回复
				//情况2:comment_id和answer_id不重叠且作者相同
				
				//通过comment_id从comment中取留言作者id
				CommentBean comment = aService.getCommentFromComment_id(comment_id);
				String author_id3 = comment.getAuthor_id();//留言作者
				if (author_id3==author_id) {
					//之后添加消息
					MessageBean message=new MessageBean();
					//UUID生成消息id
					String id1 = UUIDUtils.getId();
					//生成类型
					String type="回复评论";
					//通过answer_id从answer中取留言回复作者id
					AnswerBean answer1=aService.getAnswertFromAnswer_id(last_answer_id);
					String receiver_id = answer1.getAuthor_id();//留言回复者id
					String text1 = answer1.getText();//留言回复内容
					//回复内容规范格式
					int start=text1.indexOf(":");
					int start2=text1.indexOf(":",start+1);
					String t=text1.substring(start2+1);
					//回复内容规范格式+1
					int start3=text.indexOf(":");
					int start4=text.indexOf(":",start3+1);
					String t2=text.substring(start4+1);
					//将数据封装到message中
					message.setId(id1);
					message.setType(type);
					message.setReceiver_id(receiver_id);
					message.setAnswer_id(author_id);
					message.setArticle_id(article_id);
					message.setText1(t);
					message.setText2(t2);
					message.setAdd_time(add_time);
					UserService uService = new UserServiceImpl();
					uService.addMessage(message);
				} else {
					//情况3：comment_id与answer_id不重叠且作者不相同
										
					//通过answer_id从answer中取留言回复作者id
					AnswerBean answer1=aService.getAnswertFromAnswer_id(last_answer_id);
					String author_id4 = answer1.getAuthor_id();//留言回复者id
					if (author_id3!=author_id4) {
						//对评论作者进行消息推送
						//之后添加消息
						MessageBean message=new MessageBean();
						//UUID生成消息id
						String id1 = UUIDUtils.getId();
						//生成类型
						String type="留言回复";
						String receiver_id = comment.getAuthor_id();//留言者id
						String text1 = comment.getText();//留言内容
						//回复内容规范格式+1
						int start3=text.indexOf(":");
						int start4=text.indexOf(":",start3+1);
						String t2=text.substring(start4+1);
						//将数据封装到message中
						message.setId(id1);
						message.setType(type);
						message.setReceiver_id(receiver_id);
						message.setAnswer_id(author_id);
						message.setArticle_id(article_id);
						message.setText1(text1);
						message.setText2(t2);
						message.setAdd_time(add_time);
						UserService uService = new UserServiceImpl();
						uService.addMessage(message);						
						
//						//之后添加消息
//						MessageBean message2=new MessageBean();
//						//UUID生成消息id
//						String id2 = UUIDUtils.getId();
//						//生成类型
//						String type1="回复评论";
//						String receiver_id1 = answer1.getAuthor_id();//留言回复者id
//						String text2 = answer1.getText();//留言回复内容
//						//回复内容规范格式
//						int start=text2.indexOf(":");
//						int start2=text2.indexOf(":",start+1);
//						String t=text2.substring(start2+1);
//						//回复内容规范格式+1
//						int start5=text.indexOf(":");
//						int start6=text.indexOf(":",start5+1);
//						String t3=text.substring(start6+1);
//						//将数据封装到message中
//						message2.setId(id2);
//						message2.setType(type1);
//						message2.setReceiver_id(receiver_id1);
//						message2.setAnswer_id(author_id);
//						message2.setArticle_id(article_id);
//						message2.setText1(t);
//						message2.setText2(t3);
//						message2.setAdd_time(add_time);
//						uService.addMessage(message2);
					}else {
						//对评论下的回复作者进行消息推送
						//之后添加消息
						MessageBean message2=new MessageBean();
						//UUID生成消息id
						String id2 = UUIDUtils.getId();
						//生成类型
						String type1="回复评论";
						String receiver_id1 = answer1.getAuthor_id();//留言回复者id
						String text2 = answer1.getText();//留言回复内容
						//回复内容规范格式
						int start=text2.indexOf(":");
						int start2=text2.indexOf(":",start+1);
						String t=text2.substring(start2+1);
						//回复内容规范格式+1
						int start5=text.indexOf(":");
						int start6=text.indexOf(":",start5+1);
						String t3=text.substring(start6+1);
						//将数据封装到message中
						message2.setId(id2);
						message2.setType(type1);
						message2.setReceiver_id(receiver_id1);
						message2.setAnswer_id(author_id);
						message2.setArticle_id(article_id);
						message2.setText1(t);
						message2.setText2(t3);
						message2.setAdd_time(add_time);
						UserService uService = new UserServiceImpl();
						uService.addMessage(message2);
					}
						
				}
			}			
			//将留言回复id和添加时间传回页面
			StringBuilder result2 = new StringBuilder();  
			result2.append("{")
			.append("\"answer_id\":\""+String.valueOf(id)+"\"")
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
	
	//删除留言
	public void deleteComment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		
		//获取数据
		String article_id = request.getParameter("article_id");
		String comment_id = request.getParameter("comment_id");

		ArticleService aService = new ArticleServiceImpl();
		//删除留言		
		boolean result = aService.deleteArticleComment(comment_id);		
		if (result) {
			//删除成功
			//查找此留言下有多少条回复
			int count =  aService.findCommentAnswerNum(comment_id);
			if (count>0) {
				//有留言回复才删除
				//删除此留言下的所有回复
				boolean result2=aService.deleteArticleCommentAnswer(comment_id);			
				if (result2) {
					//删除留言回复成功
					//找到通过文章id找到对应文章，更新文章的评论数目
					ArticleBean aBean = aService.findArticle(article_id);
					int comment_num = aBean.getComment_num();
					comment_num=comment_num-count-1;
					aService.updateCommentNumByAId(article_id, comment_num);
					//取出更新后的值，存到session中
					ArticleBean aBean2 = aService.findArticle(article_id);
					request.getSession().setAttribute("aBean", aBean2);				
				} else {
					//删除失败
					System.out.println("删除留言失败");
					response.getWriter().println(false);
				}
			}else {
				//留言下无回复
				//找到通过文章id找到对应文章，更新文章的评论数目
				ArticleBean aBean = aService.findArticle(article_id);
				int comment_num = aBean.getComment_num();
				comment_num-=1;
				aService.updateCommentNumByAId(article_id, comment_num);
				//取出更新后的值，存到session中
				ArticleBean aBean2 = aService.findArticle(article_id);
				request.getSession().setAttribute("aBean", aBean2);	
			}
			
			//将结果传回页面
			String result3="{'bol':1}";
			response.getWriter().print(result3);
		} else {
			String result4="{'bol':2}";
			response.getWriter().println(result4);
		}
	}
	
	//删除留言回复
	public void deleteAnswer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		
		//获取数据
		String article_id = request.getParameter("article_id");
		String answer_id = request.getParameter("answer_id");

		ArticleService aService = new ArticleServiceImpl();
		//删除留言回复		
		boolean result = aService.deleteArticleAnswer(answer_id);		
		if (result) {
			//删除成功			
			//找到通过文章id找到对应文章，更新文章的评论数目
			ArticleBean aBean = aService.findArticle(article_id);
			int comment_num = aBean.getComment_num();
			comment_num-=1;
			aService.updateCommentNumByAId(article_id, comment_num);
			//取出更新后的值，存到session中
			ArticleBean aBean2 = aService.findArticle(article_id);
			request.getSession().setAttribute("aBean", aBean2);	
						
			//将结果传回页面
			String result3="{'bol':1}";
			response.getWriter().print(result3);
		} else {
			String result4="{'bol':2}";
			response.getWriter().println(result4);
		}
	}
	
	//留言点赞
	public void addZanToComment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		
		//获取数据
		String comment_id = request.getParameter("comment_id");
		String sender_id = request.getParameter("sender_id");//点赞用户id		
		String article_id = request.getParameter("article_id");
		String status = request.getParameter("status");//点赞状态
		int zan = Integer.parseInt(request.getParameter("zan"));//目前点赞数目(已增减)

		//调用服务
		ArticleService aService = new ArticleServiceImpl();
		//通过留言id找到留言者id
		CommentBean commentBean = aService.getCommentFromComment_id(comment_id);
		String author_id = commentBean.getAuthor_id();//留言者id
		String text = commentBean.getText();//留言内容
	
		//UUID生成点赞id
		String id = UUIDUtils.getId();
		String type="留言点赞";
		//点赞时间
		Date now=new Date();
		Date add_time=new Date(now.getTime());
		ZanBean zanBean = new ZanBean();
		boolean result = aService.UpdateCommentZan(comment_id,zan);
		//判断是否更新成功
		if (result) {
			//判断点赞状态 
			if (status.equals("点赞")) {
				//点赞：则添加赞信息并添加消息；				
				zanBean.setId(id);
				zanBean.setType(type);
				zanBean.setReceiver_id(author_id);
				zanBean.setSender_id(sender_id);
				zanBean.setArticle_id(article_id);
				zanBean.setText(text);
				zanBean.setAdd_time(add_time);
				boolean result1 = aService.addCommentZan(zanBean);
				if (result1) {
					//添加消息
					MessageBean message=new MessageBean();
					//UUID生成消息id
					String id1 = UUIDUtils.getId();
					//生成类型
					String type3="留言点赞";
					String text3="赞";
					message.setId(id1);
					message.setType(type3);
					message.setReceiver_id(author_id);
					message.setAnswer_id(sender_id);
					message.setArticle_id(article_id);
					message.setText1(text);
					message.setText2(text3);
					message.setAdd_time(add_time);
					UserService uService = new UserServiceImpl();
					uService.addMessage(message);
				}
			} else {
				//取消赞，则更新赞信息
				String type2="取消赞";
				aService.cancelCommentZan(id,type2);
			}
		} else {
			System.out.println("留言更新失败！");
		}
	}	

	//留言回复点赞
	public void addZanToAnswer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		
		//获取数据
				String answer_id = request.getParameter("answer_id");
				String sender_id = request.getParameter("sender_id");//点赞用户id		
				String article_id = request.getParameter("article_id");
				String status = request.getParameter("status");//点赞状态
				int zan = Integer.parseInt(request.getParameter("zan"));//目前点赞数目(已增减)

				//调用服务
				ArticleService aService = new ArticleServiceImpl();
				//通过留言回复id找到留言回复者id
				 AnswerBean answerBean = aService.getAnswertFromAnswer_id(answer_id);
				String author_id = answerBean.getAuthor_id();//留言回复者id
				String text = answerBean.getText();//留言回复内容
			
				//UUID生成点赞id
				String id = UUIDUtils.getId();
				String type="留言点赞";
				//点赞时间
				Date now=new Date();
				Date add_time=new Date(now.getTime());
				ZanBean zanBean = new ZanBean();
				boolean result = aService.UpdateAnswerZan(answer_id,zan);
				//判断是否更新成功
				if (result) {
					//判断点赞状态 
					if (status.equals("点赞")) {
						//点赞：则添加赞信息并添加消息；				
						zanBean.setId(id);
						zanBean.setType(type);
						zanBean.setReceiver_id(author_id);
						zanBean.setSender_id(sender_id);
						zanBean.setArticle_id(article_id);
						zanBean.setText(text);
						zanBean.setAdd_time(add_time);
						boolean result1 = aService.addAnswerZan(zanBean);
						if (result1) {
							//添加消息
							MessageBean message=new MessageBean();
							//UUID生成消息id
							String id1 = UUIDUtils.getId();
							//生成类型
							String type3="留言点赞";
							String text3="赞";
							message.setId(id1);
							message.setType(type3);
							message.setReceiver_id(author_id);
							message.setAnswer_id(sender_id);
							message.setArticle_id(article_id);
							message.setText1(text);
							message.setText2(text3);
							message.setAdd_time(add_time);
							UserService uService = new UserServiceImpl();
							uService.addMessage(message);
						}
					} else {
						//取消赞，则更新赞信息
						String type2="取消赞";
						aService.cancelAnswerZan(id,type2);
					}
				} else {
					System.out.println("留言更新失败！");
				}

	
	}
}
