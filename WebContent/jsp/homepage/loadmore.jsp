<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/homepage.css" type="text/css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/blog.css" type="text/css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/calendar.css">
<link href="${pageContext.request.contextPath}/css/owl.carousel.css" rel="stylesheet">

</head>
<body>
<c:forEach items="${list}" var="l">
        	<div class="article_n">
        		<div class="article_pic">
            		<img  src="${l.cover }">
                    <a href="${pageContext.request.contextPath}/jsp/othercenter/othercenter.jsp?id=${l.author_id}" target="_blank"><span id="Homepage_username">${l.author }</span></a><br/>
                    <span>${l.publish_date }</span>
                </div>
            	<div class="article_details">
                <div id="details_h1">
                	<a href="${pageContext.request.contextPath}/jsp/article/article.jsp?id=${l.id}" target="_blank"><h1 id="Homepage_title">${l.title}</h1></a>
                    </div>
                    <div id="details_p">	<a>
                    <p>${l.introduction }</p>
					</a>
                    </div><br/>
					<span>阅读：${l.click_num }&emsp;|</span>
                    <span>评论：${l.comment_num }&emsp;|</span>
                    <span>喜欢：${l.liked_num }&emsp;|</span>
                    <span>收藏：${l.collect_num}</span>
            	</div>
            </div>
           </c:forEach>
</body>
</html>