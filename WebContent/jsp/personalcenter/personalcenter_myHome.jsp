<%@page import="jdk.nashorn.internal.ir.BreakableNode"%>
<%@page import="java.util.List"%>
<%@page import="com.threeblog.serviceImpl.*"%>
<%@page import="com.threeblog.service.*"%>
<%@page import="com.threeblog.domain.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%
    	UserBean userBean = (UserBean) request.getSession().getAttribute("userBean");
    	if(userBean!=null){
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/personalcenter.css" type="text/css"/>
<script src="${pageContext.request.contextPath}/js/jquery-1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/changePage.js"></script>
</head>

<body>	
	<!--介绍栏右侧-->
        <div id="introduce_right">
	<%
		String at = request.getParameter("article_type");
		request.setAttribute("at", at);
		String flag =  request.getParameter("flag");
		request.setAttribute("flag", flag);
		String year =  request.getParameter("time");
		request.setAttribute("year", year);
		String uid = userBean.getId();//用户id
		//System.out.println(at+"="+flag+"="+year);
		//在博文表查找自己的所有博文及其信息，listBean（按照时间降序）
		ArticleService aService = new ArticleServiceImpl();
		List<ArticleBean> aBeans =	aService.getArticlesByUid(uid);
		if(aBeans.isEmpty()){
		%>
        		<div class="introduce_right_articles">
            		<p style="margin-top: 120px; margin-left: 250px;"><strong>还没有发表过文章！</strong></p>
            	</div>                      		
		<% 
		}else{
			for(int i = 0; i < aBeans.size();i++){
				ArticleBean aBean = aBeans.get(i);
				request.setAttribute("aBean", aBean);
				String aid =  aBean.getId();//取文章id
				ArticleTypeBean atBean =  aService.getArticleTypeByAid(aid);
				request.setAttribute("atBean", atBean);				
	%>	        
        		<c:if test="${aBean.status=='正常'|| aBean.status=='举报中'}">
        		<!--分类  -->
        		
        		<!--所有博文  -->
        		<c:if test="${at=='all' }">
        		<div class="introduce_right_articles">
            	<!--文章up-->
            	<div class="r_articles_top">
                	<a href="${pageContext.request.contextPath}/jsp/article/article.jsp?id=${aBean.id}" target="_blank"><span>${aBean.title}</span></a> 
                    <span><a href="javascript:;" onclick="deleteArticle('${aBean.id}')">删除</a></span>
                    <script type="text/javascript">
                    	function deleteArticle(id) {
                    		var aid=id;//文章id
							var s = confirm("你确定要删除此文章吗？");
							if (s) {
								$.ajax({
									type:"POST",//用post方式传输
									dataType:"json",//数据格式:JSON
									url:"/ThreeBlog_V1.0/ArticleServlet?method=DeleteArticle" ,//目标地址
									data:{"id":aid},
									error:function(){
										alert("出错！请稍后再试...");
									},
									success:function(data){
										if (data) {
											alert("删除成功！");
											window.location.reload();
										} else {
											alert("删除失败，本文可能处于屏蔽或非正常状态！");		
											window.location.reload();
										}
									}
								});
							}
						}
                    </script>
                    <div class="r_articles_top_l">
                    	<span>作者 : </span><a href="${pageContext.request.contextPath}/RedirectServlet?method=personalCenterUI">${userBean.username}</a>
                        <span>${aBean.publish_date}</span>
                        <span>分类: </span><strong>${atBean.article_type}</strong>
                        <span>标签: </span><a href="${pageContext.request.contextPath}/jsp/homepage/search_result.jsp?content=${aBean.label}" target="_blank">&lt;${aBean.label }&gt;</a>
                    </div>
                </div>
                <!--文章middle-->
                <div class="r_articles_middle">
                	<div align="center">
                    <img src="${aBean.cover }">
                    </div>
                    <div id="r_articles_middle_w" align="center">
                  		 ${aBean.text }
                    </div>
                </div>
                <!--文章down-->
                <div class="r_articles_down" align="center">
                	<table>
                    	<tr>
                        	<td><strong>阅读:</strong> <span>${aBean.click_num }</span></td>
                            <td><strong>评论:</strong> <span>${aBean.comment_num }</span></td>
                            <td><strong>收藏: </strong><span>${aBean.collect_num }</span></td>
                            <td id="down_td"><strong>喜欢: </strong><span>${aBean.liked_num}</span></td>
                        </tr>
                    </table>
                </div>
            </div>
            </c:if>         	
            	<!--默认分类  -->
            	<c:if test="${at=='m'&& atBean.article_type=='默认分类'}">
        		<div class="introduce_right_articles">
            	<!--文章up-->
            	<div class="r_articles_top">
                	<a href="${pageContext.request.contextPath}/jsp/article/article.jsp?id=${aBean.id}" target="_blank"><span>${aBean.title}</span></a> 
                    <span><a href="javascript:;" onclick="deleteArticle('${aBean.id}')">删除</a></span>
                    <script type="text/javascript">
                    	function deleteArticle(id) {
                    		var aid=id;//文章id
							var s = confirm("你确定要删除此文章吗？");
							if (s) {
								$.ajax({
									type:"POST",//用post方式传输
									dataType:"json",//数据格式:JSON
									url:"/ThreeBlog_V1.0/ArticleServlet?method=DeleteArticle" ,//目标地址
									data:{"id":aid},
									error:function(){
										alert("出错！请稍后再试...");
									},
									success:function(data){
										if (data) {
											alert("删除成功！");
											window.location.reload();
										} else {
											alert("删除失败，本文可能处于屏蔽或非正常状态！");		
											window.location.reload();
										}
									}
								});
							}
						}
                    </script>
                    <div class="r_articles_top_l">
                    	<span>作者 : </span><a href="${pageContext.request.contextPath}/RedirectServlet?method=personalCenterUI">${userBean.username}</a>
                        <span>${aBean.publish_date}</span>
                        <span>分类: </span><strong>${atBean.article_type}</strong>
                        <span>标签: </span><a href="${pageContext.request.contextPath}/jsp/homepage/search_result.jsp?content=${aBean.label}" target="_blank">&lt;${aBean.label }&gt;</a>
                    </div>
                </div>
                <!--文章middle-->
                <div class="r_articles_middle">
                	<div align="center">
                    <img src="${aBean.cover }">
                    </div>
                    <div id="r_articles_middle_w" align="center">
                  		 ${aBean.text }
                    </div>
                </div>
                <!--文章down-->
                <div class="r_articles_down" align="center">
                	<table>
                    	<tr>
                        	<td><strong>阅读:</strong> <span>${aBean.click_num }</span></td>
                            <td><strong>评论:</strong> <span>${aBean.comment_num }</span></td>
                            <td><strong>收藏: </strong><span>${aBean.collect_num }</span></td>
                            <td id="down_td"><strong>喜欢: </strong><span>${aBean.liked_num}</span></td>
                        </tr>
                    </table>
                </div>
            </div>
            </c:if>
            	<!--个人心情  -->
            	<c:if test="${at=='g'&& atBean.article_type=='个人心情'}">
        		<div class="introduce_right_articles">
            	<!--文章up-->
            	<div class="r_articles_top">
                	<a href="${pageContext.request.contextPath}/jsp/article/article.jsp?id=${aBean.id}" target="_blank"><span>${aBean.title}</span></a> 
                    <span><a href="javascript:;" onclick="deleteArticle('${aBean.id}')">删除</a></span>
                    <script type="text/javascript">
                    	function deleteArticle(id) {
                    		var aid=id;//文章id
							var s = confirm("你确定要删除此文章吗？");
							if (s) {
								$.ajax({
									type:"POST",//用post方式传输
									dataType:"json",//数据格式:JSON
									url:"/ThreeBlog_V1.0/ArticleServlet?method=DeleteArticle" ,//目标地址
									data:{"id":aid},
									error:function(){
										alert("出错！请稍后再试...");
									},
									success:function(data){
										if (data) {
											alert("删除成功！");
											window.location.reload();
										} else {
											alert("删除失败，本文可能处于屏蔽或非正常状态！");		
											window.location.reload();
										}
									}
								});
							}
						}
                    </script>
                    <div class="r_articles_top_l">
                    	<span>作者 : </span><a href="${pageContext.request.contextPath}/RedirectServlet?method=personalCenterUI">${userBean.username}</a>
                        <span>${aBean.publish_date}</span>
                        <span>分类: </span><strong>${atBean.article_type}</strong>
                        <span>标签: </span><a href="${pageContext.request.contextPath}/jsp/homepage/search_result.jsp?content=${aBean.label}" target="_blank">&lt;${aBean.label }&gt;</a>
                    </div>
                </div>
                <!--文章middle-->
                <div class="r_articles_middle">
                	<div align="center">
                    <img src="${aBean.cover }">
                    </div>
                    <div id="r_articles_middle_w" align="center">
                  		 ${aBean.text }
                    </div>
                </div>
                <!--文章down-->
                <div class="r_articles_down" align="center">
                	<table>
                    	<tr>
                        	<td><strong>阅读:</strong> <span>${aBean.click_num }</span></td>
                            <td><strong>评论:</strong> <span>${aBean.comment_num }</span></td>
                            <td><strong>收藏: </strong><span>${aBean.collect_num }</span></td>
                            <td id="down_td"><strong>喜欢: </strong><span>${aBean.liked_num}</span></td>
                        </tr>
                    </table>
                </div>
            </div>
            </c:if>
            	<!--杂乱无章 -->
            	<c:if test="${at=='z'&& atBean.article_type=='杂乱无章'}">
        		<div class="introduce_right_articles">
            	<!--文章up-->
            	<div class="r_articles_top">
                	<a href="${pageContext.request.contextPath}/jsp/article/article.jsp?id=${aBean.id}" target="_blank"><span>${aBean.title}</span></a> 
                    <span><a href="javascript:;" onclick="deleteArticle('${aBean.id}')">删除</a></span>
                    <script type="text/javascript">
                    	function deleteArticle(id) {
                    		var aid=id;//文章id
							var s = confirm("你确定要删除此文章吗？");
							if (s) {
								$.ajax({
									type:"POST",//用post方式传输
									dataType:"json",//数据格式:JSON
									url:"/ThreeBlog_V1.0/ArticleServlet?method=DeleteArticle" ,//目标地址
									data:{"id":aid},
									error:function(){
										alert("出错！请稍后再试...");
									},
									success:function(data){
										if (data) {
											alert("删除成功！");
											window.location.reload();
										} else {
											alert("删除失败，本文可能处于屏蔽或非正常状态！");		
											window.location.reload();
										}
									}
								});
							}
						}
                    </script>
                    <div class="r_articles_top_l">
                    	<span>作者 : </span><a href="${pageContext.request.contextPath}/RedirectServlet?method=personalCenterUI">${userBean.username}</a>
                        <span>${aBean.publish_date}</span>
                        <span>分类: </span><strong>${atBean.article_type}</strong>
                        <span>标签: </span><a href="${pageContext.request.contextPath}/jsp/homepage/search_result.jsp?content=${aBean.label}" target="_blank">&lt;${aBean.label }&gt;</a>
                    </div>
                </div>
                <!--文章middle-->
                <div class="r_articles_middle">
                	<div align="center">
                    <img src="${aBean.cover }">
                    </div>
                    <div id="r_articles_middle_w" align="center">
                  		 ${aBean.text }
                    </div>
                </div>
                <!--文章down-->
                <div class="r_articles_down" align="center">
                	<table>
                    	<tr>
                        	<td><strong>阅读:</strong> <span>${aBean.click_num }</span></td>
                            <td><strong>评论:</strong> <span>${aBean.comment_num }</span></td>
                            <td><strong>收藏: </strong><span>${aBean.collect_num }</span></td>
                            <td id="down_td"><strong>喜欢: </strong><span>${aBean.liked_num}</span></td>
                        </tr>
                    </table>
                </div>
            </div>
            </c:if>
            	<!--休闲娱乐  -->
            	<c:if test="${at=='x'&& atBean.article_type=='休闲娱乐'}">
        		<div class="introduce_right_articles">
            	<!--文章up-->
            	<div class="r_articles_top">
                	<a href="${pageContext.request.contextPath}/jsp/article/article.jsp?id=${aBean.id}" target="_blank"><span>${aBean.title}</span></a> 
                    <span><a href="javascript:;" onclick="deleteArticle('${aBean.id}')">删除</a></span>
                    <script type="text/javascript">
                    	function deleteArticle(id) {
                    		var aid=id;//文章id
							var s = confirm("你确定要删除此文章吗？");
							if (s) {
								$.ajax({
									type:"POST",//用post方式传输
									dataType:"json",//数据格式:JSON
									url:"/ThreeBlog_V1.0/ArticleServlet?method=DeleteArticle" ,//目标地址
									data:{"id":aid},
									error:function(){
										alert("出错！请稍后再试...");
									},
									success:function(data){
										if (data) {
											alert("删除成功！");
											window.location.reload();
										} else {
											alert("删除失败，本文可能处于屏蔽或非正常状态！");		
											window.location.reload();
										}
									}
								});
							}
						}
                    </script>
                    <div class="r_articles_top_l">
                    	<span>作者 : </span><a href="${pageContext.request.contextPath}/RedirectServlet?method=personalCenterUI">${userBean.username}</a>
                        <span>${aBean.publish_date}</span>
                        <span>分类: </span><strong>${atBean.article_type}</strong>
                        <span>标签: </span><a href="${pageContext.request.contextPath}/jsp/homepage/search_result.jsp?content=${aBean.label}" target="_blank">&lt;${aBean.label }&gt;</a>
                    </div>
                </div>
                <!--文章middle-->
                <div class="r_articles_middle">
                	<div align="center">
                    <img src="${aBean.cover }">
                    </div>
                    <div id="r_articles_middle_w" align="center">
                  		 ${aBean.text }
                    </div>
                </div>
                <!--文章down-->
                <div class="r_articles_down" align="center">
                	<table>
                    	<tr>
                        	<td><strong>阅读:</strong> <span>${aBean.click_num }</span></td>
                            <td><strong>评论:</strong> <span>${aBean.comment_num }</span></td>
                            <td><strong>收藏: </strong><span>${aBean.collect_num }</span></td>
                            <td id="down_td"><strong>喜欢: </strong><span>${aBean.liked_num}</span></td>
                        </tr>
                    </table>
                </div>
            </div>
            </c:if>
            	<!--游戏漫画 -->
            	<c:if test="${at=='y'&& atBean.article_type=='游戏漫画'}">
        		<div class="introduce_right_articles">
            	<!--文章up-->
            	<div class="r_articles_top">
                	<a href="${pageContext.request.contextPath}/jsp/article/article.jsp?id=${aBean.id}" target="_blank"><span>${aBean.title}</span></a> 
                    <span><a href="javascript:;" onclick="deleteArticle('${aBean.id}')">删除</a></span>
                    <script type="text/javascript">
                    	function deleteArticle(id) {
                    		var aid=id;//文章id
							var s = confirm("你确定要删除此文章吗？");
							if (s) {
								$.ajax({
									type:"POST",//用post方式传输
									dataType:"json",//数据格式:JSON
									url:"/ThreeBlog_V1.0/ArticleServlet?method=DeleteArticle" ,//目标地址
									data:{"id":aid},
									error:function(){
										alert("出错！请稍后再试...");
									},
									success:function(data){
										if (data) {
											alert("删除成功！");
											window.location.reload();
										} else {
											alert("删除失败，本文可能处于屏蔽或非正常状态！");		
											window.location.reload();
										}
									}
								});
							}
						}
                    </script>
                    <div class="r_articles_top_l">
                    	<span>作者 : </span><a href="${pageContext.request.contextPath}/RedirectServlet?method=personalCenterUI">${userBean.username}</a>
                        <span>${aBean.publish_date}</span>
                        <span>分类: </span><strong>${atBean.article_type}</strong>
                        <span>标签: </span><a href="${pageContext.request.contextPath}/jsp/homepage/search_result.jsp?content=${aBean.label}" target="_blank">&lt;${aBean.label }&gt;</a>
                    </div>
                </div>
                <!--文章middle-->
                <div class="r_articles_middle">
                	<div align="center">
                    <img src="${aBean.cover }">
                    </div>
                    <div id="r_articles_middle_w" align="center">
                  		 ${aBean.text }
                    </div>
                </div>
                <!--文章down-->
                <div class="r_articles_down" align="center">
                	<table>
                    	<tr>
                        	<td><strong>阅读:</strong> <span>${aBean.click_num }</span></td>
                            <td><strong>评论:</strong> <span>${aBean.comment_num }</span></td>
                            <td><strong>收藏: </strong><span>${aBean.collect_num }</span></td>
                            <td id="down_td"><strong>喜欢: </strong><span>${aBean.liked_num}</span></td>
                        </tr>
                    </table>
                </div>
            </div>
            </c:if>
            	<!--旅游摄影  -->
            	<c:if test="${at=='l'&& atBean.article_type=='旅游摄影'}">
        		<div class="introduce_right_articles">
            	<!--文章up-->
            	<div class="r_articles_top">
                	<a href="${pageContext.request.contextPath}/jsp/article/article.jsp?id=${aBean.id}" target="_blank"><span>${aBean.title}</span></a> 
                    <span><a href="javascript:;" onclick="deleteArticle('${aBean.id}')">删除</a></span>
                    <script type="text/javascript">
                    	function deleteArticle(id) {
                    		var aid=id;//文章id
							var s = confirm("你确定要删除此文章吗？");
							if (s) {
								$.ajax({
									type:"POST",//用post方式传输
									dataType:"json",//数据格式:JSON
									url:"/ThreeBlog_V1.0/ArticleServlet?method=DeleteArticle" ,//目标地址
									data:{"id":aid},
									error:function(){
										alert("出错！请稍后再试...");
									},
									success:function(data){
										if (data) {
											alert("删除成功！");
											window.location.reload();
										} else {
											alert("删除失败，本文可能处于屏蔽或非正常状态！");		
											window.location.reload();
										}
									}
								});
							}
						}
                    </script>
                    <div class="r_articles_top_l">
                    	<%
                    		
                    	%>
                    	<span>作者 : </span><a href="${pageContext.request.contextPath}/RedirectServlet?method=personalCenterUI">${userBean.username}</a>
                        <span>${aBean.publish_date}</span>
                        <span>分类: </span><strong>${atBean.article_type}</strong>
                        <span>标签: </span><a href="${pageContext.request.contextPath}/jsp/homepage/search_result.jsp?content=${aBean.label}" target="_blank">&lt;${aBean.label }&gt;</a>
                    </div>
                </div>
                <!--文章middle-->
                <div class="r_articles_middle">
                	<div align="center">
                    <img src="${aBean.cover }">
                    </div>
                    <div id="r_articles_middle_w" align="center">
                  		 ${aBean.text }
                    </div>
                </div>
                <!--文章down-->
                <div class="r_articles_down" align="center">
                	<table>
                    	<tr>
                        	<td><strong>阅读:</strong> <span>${aBean.click_num }</span></td>
                            <td><strong>评论:</strong> <span>${aBean.comment_num }</span></td>
                            <td><strong>收藏: </strong><span>${aBean.collect_num }</span></td>
                            <td id="down_td"><strong>喜欢: </strong><span>${aBean.liked_num}</span></td>
                        </tr>
                    </table>
                </div>
            </div>
            </c:if>
            	<!--时尚美食  -->
            	<c:if test="${at=='s'&& atBean.article_type=='时尚美食'}">
        		<div class="introduce_right_articles">
            	<!--文章up-->
            	<div class="r_articles_top">
                	<a href="${pageContext.request.contextPath}/jsp/article/article.jsp?id=${aBean.id}" target="_blank"><span>${aBean.title}</span></a> 
                    <span><a href="javascript:;" onclick="deleteArticle('${aBean.id}')">删除</a></span>
                    <script type="text/javascript">
                    	function deleteArticle(id) {
                    		var aid=id;//文章id
							var s = confirm("你确定要删除此文章吗？");
							if (s) {
								$.ajax({
									type:"POST",//用post方式传输
									dataType:"json",//数据格式:JSON
									url:"/ThreeBlog_V1.0/ArticleServlet?method=DeleteArticle" ,//目标地址
									data:{"id":aid},
									error:function(){
										alert("出错！请稍后再试...");
									},
									success:function(data){
										if (data) {
											alert("删除成功！");
											window.location.reload();
										} else {
											alert("删除失败，本文可能处于屏蔽或非正常状态！");		
											window.location.reload();
										}
									}
								});
							}
						}
                    </script>
                    <div class="r_articles_top_l">
                    	<span>作者 : </span><a href="${pageContext.request.contextPath}/RedirectServlet?method=personalCenterUI">${userBean.username}</a>
                        <span>${aBean.publish_date}</span>
                        <span>分类: </span><strong>${atBean.article_type}</strong>
                        <span>标签: </span><a href="${pageContext.request.contextPath}/jsp/homepage/search_result.jsp?content=${aBean.label}" target="_blank">&lt;${aBean.label }&gt;</a>
                    </div>
                </div>
                <!--文章middle-->
                <div class="r_articles_middle">
                	<div align="center">
                    <img src="${aBean.cover }">
                    </div>
                    <div id="r_articles_middle_w" align="center">
                  		 ${aBean.text }
                    </div>
                </div>
                <!--文章down-->
                <div class="r_articles_down" align="center">
                	<table>
                    	<tr>
                        	<td><strong>阅读:</strong> <span>${aBean.click_num }</span></td>
                            <td><strong>评论:</strong> <span>${aBean.comment_num }</span></td>
                            <td><strong>收藏: </strong><span>${aBean.collect_num }</span></td>
                            <td id="down_td"><strong>喜欢: </strong><span>${aBean.liked_num}</span></td>
                        </tr>
                    </table>
                </div>
            </div>
            </c:if>
            	<!--校园青春  -->
            	<c:if test="${at=='q'&& atBean.article_type=='校园青春'}">
        		<div class="introduce_right_articles">
            	<!--文章up-->
            	<div class="r_articles_top">
                	<a href="${pageContext.request.contextPath}/jsp/article/article.jsp?id=${aBean.id}" target="_blank"><span>${aBean.title}</span></a> 
                    <span><a href="javascript:;" onclick="deleteArticle('${aBean.id}')">删除</a></span>
                    <script type="text/javascript">
                    	function deleteArticle(id) {
                    		var aid=id;//文章id
							var s = confirm("你确定要删除此文章吗？");
							if (s) {
								$.ajax({
									type:"POST",//用post方式传输
									dataType:"json",//数据格式:JSON
									url:"/ThreeBlog_V1.0/ArticleServlet?method=DeleteArticle" ,//目标地址
									data:{"id":aid},
									error:function(){
										alert("出错！请稍后再试...");
									},
									success:function(data){
										if (data) {
											alert("删除成功！");
											window.location.reload();
										} else {
											alert("删除失败，本文可能处于屏蔽或非正常状态！");		
											window.location.reload();
										}
									}
								});
							}
						}
                    </script>
                    <div class="r_articles_top_l">
                    	<span>作者 : </span><a href="${pageContext.request.contextPath}/RedirectServlet?method=personalCenterUI">${userBean.username}</a>
                        <span>${aBean.publish_date}</span>
                        <span>分类: </span><strong>${atBean.article_type}</strong>
                        <span>标签: </span><a href="${pageContext.request.contextPath}/jsp/homepage/search_result.jsp?content=${aBean.label}" target="_blank">&lt;${aBean.label }&gt;</a>
                    </div>
                </div>
                <!--文章middle-->
                <div class="r_articles_middle">
                	<div align="center">
                    <img src="${aBean.cover }">
                    </div>
                    <div id="r_articles_middle_w" align="center">
                  		 ${aBean.text }
                    </div>
                </div>
                <!--文章down-->
                <div class="r_articles_down" align="center">
                	<table>
                    	<tr>
                        	<td><strong>阅读:</strong> <span>${aBean.click_num }</span></td>
                            <td><strong>评论:</strong> <span>${aBean.comment_num }</span></td>
                            <td><strong>收藏: </strong><span>${aBean.collect_num }</span></td>
                            <td id="down_td"><strong>喜欢: </strong><span>${aBean.liked_num}</span></td>
                        </tr>
                    </table>
                </div>
            </div>
            </c:if>
            	<!--媒体科技  -->
            	<c:if test="${at=='k'&& atBean.article_type=='媒体科技'}">
        		<div class="introduce_right_articles">
            	<!--文章up-->
            	<div class="r_articles_top">
                	<a href="${pageContext.request.contextPath}/jsp/article/article.jsp?id=${aBean.id}" target="_blank"><span>${aBean.title}</span></a> 
                    <span><a href="javascript:;" onclick="deleteArticle('${aBean.id}')">删除</a></span>
                    <script type="text/javascript">
                    	function deleteArticle(id) {
                    		var aid=id;//文章id
							var s = confirm("你确定要删除此文章吗？");
							if (s) {
								$.ajax({
									type:"POST",//用post方式传输
									dataType:"json",//数据格式:JSON
									url:"/ThreeBlog_V1.0/ArticleServlet?method=DeleteArticle" ,//目标地址
									data:{"id":aid},
									error:function(){
										alert("出错！请稍后再试...");
									},
									success:function(data){
										if (data) {
											alert("删除成功！");
											window.location.reload();
										} else {
											alert("删除失败，本文可能处于屏蔽或非正常状态！");		
											window.location.reload();
										}
									}
								});
							}
						}
                    </script>
                    <div class="r_articles_top_l">
                    	<span>作者 : </span><a href="${pageContext.request.contextPath}/RedirectServlet?method=personalCenterUI">${userBean.username}</a>
                        <span>${aBean.publish_date}</span>
                        <span>分类: </span><strong>${atBean.article_type}</strong>
                        <span>标签: </span><a href="${pageContext.request.contextPath}/jsp/homepage/search_result.jsp?content=${aBean.label}" target="_blank">&lt;${aBean.label }&gt;</a>
                    </div>
                </div>
                <!--文章middle-->
                <div class="r_articles_middle">
                	<div align="center">
                    <img src="${aBean.cover }">
                    </div>
                    <div id="r_articles_middle_w" align="center">
                  		 ${aBean.text }
                    </div>
                </div>
                <!--文章down-->
                <div class="r_articles_down" align="center">
                	<table>
                    	<tr>
                        	<td><strong>阅读:</strong> <span>${aBean.click_num }</span></td>
                            <td><strong>评论:</strong> <span>${aBean.comment_num }</span></td>
                            <td><strong>收藏: </strong><span>${aBean.collect_num }</span></td>
                            <td id="down_td"><strong>喜欢: </strong><span>${aBean.liked_num}</span></td>
                        </tr>
                    </table>
                </div>
            </div>
            </c:if>
            	<!--体育健康  -->
            	<c:if test="${at=='t'&& atBean.article_type=='体育健康'}">
        		<div class="introduce_right_articles">
            	<!--文章up-->
            	<div class="r_articles_top">
                	<a href="${pageContext.request.contextPath}/jsp/article/article.jsp?id=${aBean.id}" target="_blank"><span>${aBean.title}</span></a> 
                    <span><a href="javascript:;" onclick="deleteArticle('${aBean.id}')">删除</a></span>
                    <script type="text/javascript">
                    	function deleteArticle(id) {
                    		var aid=id;//文章id
							var s = confirm("你确定要删除此文章吗？");
							if (s) {
								$.ajax({
									type:"POST",//用post方式传输
									dataType:"json",//数据格式:JSON
									url:"/ThreeBlog_V1.0/ArticleServlet?method=DeleteArticle" ,//目标地址
									data:{"id":aid},
									error:function(){
										alert("出错！请稍后再试...");
									},
									success:function(data){
										if (data) {
											alert("删除成功！");
											window.location.reload();
										} else {
											alert("删除失败，本文可能处于屏蔽或非正常状态！");		
											window.location.reload();
										}
									}
								});
							}
						}
                    </script>
                    <div class="r_articles_top_l">
                    	<span>作者 : </span><a href="${pageContext.request.contextPath}/RedirectServlet?method=personalCenterUI">${userBean.username}</a>
                        <span>${aBean.publish_date}</span>
                        <span>分类: </span><strong>${atBean.article_type}</strong>
                        <span>标签: </span><a href="${pageContext.request.contextPath}/jsp/homepage/search_result.jsp?content=${aBean.label}" target="_blank">&lt;${aBean.label }&gt;</a>
                    </div>
                </div>
                <!--文章middle-->
                <div class="r_articles_middle">
                	<div align="center">
                    <img src="${aBean.cover }">
                    </div>
                    <div id="r_articles_middle_w" align="center">
                  		 ${aBean.text }
                    </div>
                </div>
                <!--文章down-->
                <div class="r_articles_down" align="center">
                	<table>
                    	<tr>
                        	<td><strong>阅读:</strong> <span>${aBean.click_num }</span></td>
                            <td><strong>评论:</strong> <span>${aBean.comment_num }</span></td>
                            <td><strong>收藏: </strong><span>${aBean.collect_num }</span></td>
                            <td id="down_td"><strong>喜欢: </strong><span>${aBean.liked_num}</span></td>
                        </tr>
                    </table>
                </div>
            </div>
            </c:if>
				<!--2018年-->
            	<c:if test="${year=='2018'&& aBean.publish_date<='2018-12-31 23:59:59'&& aBean.publish_date>='2018-01-01 00:00:00'}">
        		<div class="introduce_right_articles">
            	<!--文章up-->
            	<div class="r_articles_top">
                	<a href="${pageContext.request.contextPath}/jsp/article/article.jsp?id=${aBean.id}" target="_blank"><span>${aBean.title}</span></a> 
                    <span><a href="javascript:;" onclick="deleteArticle('${aBean.id}')">删除</a></span>
                    <script type="text/javascript">
                    	function deleteArticle(id) {
                    		var aid=id;//文章id
							var s = confirm("你确定要删除此文章吗？");
							if (s) {
								$.ajax({
									type:"POST",//用post方式传输
									dataType:"json",//数据格式:JSON
									url:"/ThreeBlog_V1.0/ArticleServlet?method=DeleteArticle" ,//目标地址
									data:{"id":aid},
									error:function(){
										alert("出错！请稍后再试...");
									},
									success:function(data){
										if (data) {
											alert("删除成功！");
											window.location.reload();
										} else {
											alert("删除失败，本文可能处于屏蔽或非正常状态！");		
											window.location.reload();
										}
									}
								});
							}
						}
                    </script>
                    <div class="r_articles_top_l">
                    	<span>作者 : </span><a href="${pageContext.request.contextPath}/RedirectServlet?method=personalCenterUI">${userBean.username}</a>
                        <span>${aBean.publish_date}</span>
                        <span>分类: </span><strong>${atBean.article_type}</strong>
                        <span>标签: </span><a href="${pageContext.request.contextPath}/jsp/homepage/search_result.jsp?content=${aBean.label}" target="_blank">&lt;${aBean.label }&gt;</a>
                    </div>
                </div>
                <!--文章middle-->
                <div class="r_articles_middle">
                	<div align="center">
                    <img src="${aBean.cover }">
                    </div>
                    <div id="r_articles_middle_w" align="center">
                  		 ${aBean.text }
                    </div>
                </div>
                <!--文章down-->
                <div class="r_articles_down" align="center">
                	<table>
                    	<tr>
                        	<td><strong>阅读:</strong> <span>${aBean.click_num }</span></td>
                            <td><strong>评论:</strong> <span>${aBean.comment_num }</span></td>
                            <td><strong>收藏: </strong><span>${aBean.collect_num }</span></td>
                            <td id="down_td"><strong>喜欢: </strong><span>${aBean.liked_num}</span></td>
                        </tr>
                    </table>
                </div>
            </div>
            </c:if>
				 <!--2019年-->
            	<c:if test="${year=='2019'&& aBean.publish_date<='2019-12-31 23:59:59'&& aBean.publish_date>='2019-01-01 00:00:00'}">
        		<div class="introduce_right_articles">
            	<!--文章up-->
            	<div class="r_articles_top">
                	<a href="${pageContext.request.contextPath}/jsp/article/article.jsp?id=${aBean.id}" target="_blank"><span>${aBean.title}</span></a> 
                    <span><a href="javascript:;" onclick="deleteArticle('${aBean.id}')">删除</a></span>
                    <script type="text/javascript">
                    	function deleteArticle(id) {
                    		var aid=id;//文章id
							var s = confirm("你确定要删除此文章吗？");
							if (s) {
								$.ajax({
									type:"POST",//用post方式传输
									dataType:"json",//数据格式:JSON
									url:"/ThreeBlog_V1.0/ArticleServlet?method=DeleteArticle" ,//目标地址
									data:{"id":aid},
									error:function(){
										alert("出错！请稍后再试...");
									},
									success:function(data){
										if (data) {
											alert("删除成功！");
											window.location.reload();
										} else {
											alert("删除失败，本文可能处于屏蔽或非正常状态！");		
											window.location.reload();
										}
									}
								});
							}
						}
                    </script>
                    <div class="r_articles_top_l">
                    	<span>作者 : </span><a href="${pageContext.request.contextPath}/RedirectServlet?method=personalCenterUI">${userBean.username}</a>
                        <span>${aBean.publish_date}</span>
                        <span>分类: </span><strong>${atBean.article_type}</strong>
                        <span>标签: </span><a href="${pageContext.request.contextPath}/jsp/homepage/search_result.jsp?content=${aBean.label}" target="_blank">&lt;${aBean.label }&gt;</a>
                    </div>
                </div>
                <!--文章middle-->
                <div class="r_articles_middle">
                	<div align="center">
                    <img src="${aBean.cover }">
                    </div>
                    <div id="r_articles_middle_w" align="center">
                  		 ${aBean.text }
                    </div>
                </div>
                <!--文章down-->
                <div class="r_articles_down" align="center">
                	<table>
                    	<tr>
                        	<td><strong>阅读:</strong> <span>${aBean.click_num }</span></td>
                            <td><strong>评论:</strong> <span>${aBean.comment_num }</span></td>
                            <td><strong>收藏: </strong><span>${aBean.collect_num }</span></td>
                            <td id="down_td"><strong>喜欢: </strong><span>${aBean.liked_num}</span></td>
                        </tr>
                    </table>
                </div>
            </div>
            </c:if>           	 
            	
            </c:if>         
           <%}} %>
           <!-- 点击的类型文章数目为0 -->
            <c:if test="${flag==0 }">         	
        		<div class="introduce_right_articles">
            		<p style="margin-top: 120px; margin-left: 250px;"><strong>还没有发表过此类文章！</strong></p>
            	</div>                 	
           </c:if>
   				 <%
             	 	ArticleBean aBeanF = aService.getFirstArticlesByUid(uid);
   				 	if(aBeanF!=null){
	             		String idF = aBeanF.getId();
	             		ArticleTypeBean atBeanF =  aService.getArticleTypeByAid(idF);
	     				request.setAttribute("atBeanF", atBeanF);
	             		request.setAttribute("aBeanF", aBeanF);
             		}
             	%>
           <!--第一条博文-->         
            	<c:if test="${year=='0'}">
        		<div class="introduce_right_articles">
            	<!--文章up-->
            	<div class="r_articles_top">
                	<a href="${pageContext.request.contextPath}/jsp/article/article.jsp?id=${aBeanF.id}" target="_blank"><span>${aBeanF.title}</span></a> 
                    <span><a href="javascript:;" onclick="deleteArticle('${aBeanF.id}')">删除</a></span>
                    <script type="text/javascript">
                    	function deleteArticle(id) {
                    		var aid=id;//文章id
							var s = confirm("你确定要删除此文章吗？");
							if (s) {
								$.ajax({
									type:"POST",//用post方式传输
									dataType:"json",//数据格式:JSON
									url:"/ThreeBlog_V1.0/ArticleServlet?method=DeleteArticle" ,//目标地址
									data:{"id":aid},
									error:function(){
										alert("出错！请稍后再试...");
									},
									success:function(data){
										if (data) {
											alert("删除成功！");
											window.location.reload();
										} else {
											alert("删除失败，本文可能处于屏蔽或非正常状态！");		
											window.location.reload();
										}
									}
								});
							}
						}
                    </script>
                    <div class="r_articles_top_l">
                    	<span>作者 : </span><a href="${pageContext.request.contextPath}/RedirectServlet?method=personalCenterUI">${userBean.username}</a>
                        <span>${aBeanF.publish_date}</span>
                        <span>分类: </span><strong>${atBeanF.article_type}</strong>
                        <span>标签: </span><a href="#">&lt;${aBeanF.label }&gt;</a>
                    </div>
                </div>
                <!--文章middle-->
                <div class="r_articles_middle">
                	<div align="center">
                    <img src="${aBeanF.cover }">
                    </div>
                    <div id="r_articles_middle_w" align="center">
                  		 ${aBeanF.text }
                    </div>
                </div>
                <!--文章down-->
                <div class="r_articles_down" align="center">
                	<table>
                    	<tr>
                        	<td><strong>阅读:</strong> <span>${aBeanF.click_num }</span></td>
                            <td><strong>评论:</strong> <span>${aBeanF.comment_num }</span></td>
                            <td><strong>收藏: </strong><span>${aBeanF.collect_num }</span></td>
                            <td id="down_td"><strong>喜欢: </strong><span>${aBeanF.liked_num}</span></td>
                        </tr>
                    </table>
                </div>
            </div>
            </c:if>
           
        </div>
</body>
</html>
<%}else{
	response.sendRedirect(request.getContextPath()+"/jsp/login/login.jsp");
}%>