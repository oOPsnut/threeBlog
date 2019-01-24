<%@page import="com.threeblog.serviceImpl.UserServiceImpl"%>
<%@page import="com.threeblog.service.UserService"%>
<%@page import="com.threeblog.domain.*"%>
<%@page import="java.util.List"%>
<%@page import="com.threeblog.serviceImpl.ArticleServiceImpl"%>
<%@page import="com.threeblog.service.ArticleService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/personalcenter.css" type="text/css"/>
<script src="${pageContext.request.contextPath}/js/jquery-1.min.js"></script> 
</head>

<body>
        <!--介绍栏右侧-->
        <div id="introduce_right">
        <%
      		//作者是指此中心的用户
      		String uid =  request.getParameter("uid");//作者id
        	UserService uService = new UserServiceImpl();
        	ArticleService aService = new ArticleServiceImpl();
        	List<CollectBean> collects = aService.getCollectByUid(uid);
        	if(collects.isEmpty()){
        %>
        	
        		<div class="introduce_right_articles">
            		<p style="margin-top: 120px; margin-left: 250px;"><strong>Ta还没有收藏过文章！</strong></p>
            	</div>                 
        
        <% 	}else{
        		for(int i = 0; i <collects.size();i++){
        		 	CollectBean collect =collects.get(i);
        		 	String id =  collect.getAuthor_id();//收藏的文章作者id
        			String aid=collect.getArticle_id();//收藏的文章id
        			ArticleBean aBean = aService.findArticle(aid);//收藏的文章信息
        			UserBean uBean =  uService.findUserInfo(id);//收藏的文章作者信息
        			ArticleTypeBean atBean =  aService.getArticleTypeByAid(aid);//收藏的文章类型信息
        			request.setAttribute("cBean", collect);
        			request.setAttribute("aBean", aBean);
        			request.setAttribute("uBean", uBean);
        			request.setAttribute("atBean", atBean);
        %>
        	<c:if test="${aBean.status=='正常'|| aBean.status=='举报中'}">
        	<div class="introduce_right_articles">
            	<!--文章up-->
            	<div class="r_articles_top">
                	<a href="${pageContext.request.contextPath}/jsp/article/article.jsp?id=${aBean.id}" target="_blank"><span>${aBean.title }</span></a>                   
                    <div class="r_articles_top_l">
                    	<span>作者 : </span><a href="${pageContext.request.contextPath}/jsp/othercenter/othercenter.jsp?id=${uBean.id}" target="_blank">${aBean.author}</a>
                        <span>${aBean.publish_date }</span>
                        <span>分类: </span><strong>${atBean.article_type}</strong>
                        <span>标签: </span><a href="${pageContext.request.contextPath}/jsp/homepage/search_result.jsp?content=${aBean.label}" target="_blank">&lt;${aBean.label }&gt;</a>
                    </div>
                </div>
                <!--文章middle-->
                <div class="r_articles_middle">
                	<div align="center">
                    <img src="${aBean.cover}">
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
            <%}}%>
            
            
            
            
        </div>
<!--内容end-->
</body>
</html>