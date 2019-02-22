<%@page import="java.util.List"%>
<%@page import="com.threeblog.serviceImpl.*"%>
<%@page import="com.threeblog.service.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@page import="com.threeblog.domain.*"%>
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
       	 	<!--粉丝/关注列表-->
        	<div class="introduce_right_f">
            	<!--列表up-->
            	<div class="r_f_top">
                	<a href="javascript:;"><span>全部关注</span></a>
                    <span id="r_f_top_span">|</span>
                </div>
        	<%
        		UserBean userBean = (UserBean) request.getSession().getAttribute("userBean");
        		if(userBean!=null){
	        		String uid = userBean.getId();
	        		UserService uService = new UserServiceImpl();
	        		ArticleService aService = new ArticleServiceImpl();
	        		List<FollowBean> follows = uService.getFollowingsByUid(uid);
	        		if(follows.isEmpty()){   		
        	%>
        		<!--列表middle-->
                <div class="r_f_middle">
                	<p style="margin-top: 40px; margin-left: 230px;"><strong>还没有关注过用户！</strong></p>
                </div>
        		
        	<%
        		}else{
        			for(int i = 0; i <follows.size();i++) {
        				FollowBean follow = follows.get(i); 
        				String followerId = follow.getFollower_id();//关注的用户的id
        				UserBean followerBean =  uService.findUserInfo(followerId);//关注的用户的信息
        				request.setAttribute("fBean", followerBean);
        				int countArticle =  Integer.valueOf( aService.countArticles(followerId).toString());//关注用户的文章数
        				int countFollowing =  Integer.valueOf(uService.countFollowing(followerId).toString());//关注用户的关注数目
                		int countFollower =  Integer.valueOf(uService.countFollower(followerId).toString());//关注用户的粉丝数目
                		request.setAttribute("countArticle", countArticle);
                		request.setAttribute("countFollowing", countFollowing);
                		request.setAttribute("countFollower", countFollower);
        	%>      	
                <!--列表middle-->
                <div class="r_f_middle">
                	<div class="r_f_m_left">
                    	<a href="${pageContext.request.contextPath}/jsp/othercenter/othercenter.jsp?id=${fBean.id}" target="_blank"><img src="${fBean.head}"></a>
                    </div>
                   	<div class="r_f_m_right">
                    	<a href="${pageContext.request.contextPath}/jsp/othercenter/othercenter.jsp?id=${fBean.id}" target="_blank"><span>${fBean.username}</span></a>
                        <br>
                        <div class="r_f_m_right_total">
                        	<span>博文</span><span>${countArticle}</span>
                            <span>|</span>
                            <span>关注</span><span>${countFollowing}</span>
                            <span>|</span>
                            <span>粉丝</span><span>${countFollower}</span>
                        </div>
                        <div class="r_f_m_right_shortintroduce">
                        <span><strong>个人简介 : </strong></span>
                        <span>▷${fBean.introduction }</span>
                        </div>
                    </div>
                </div>
                
                <%}}}else{
                	response.sendRedirect(request.getContextPath()+"/jsp/login/login.jsp");
                } %>
                
            </div>
            
        </div>
</body>
</html>
