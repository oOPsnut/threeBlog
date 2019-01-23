<%@page import="com.threeblog.serviceImpl.*"%>
<%@page import="com.threeblog.service.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        	<%
        		UserBean userBean = (UserBean) request.getSession().getAttribute("userBean");
        		String uid = userBean.getId();
        		UserService uService = new UserServiceImpl();
        		
        	%>
        	<!--粉丝/关注列表-->
        	<div class="introduce_right_f">
            	<!--列表up-->
            	<div class="r_f_top">
                	<a href="#"><span>全部粉丝</span></a>
                    <span id="r_f_top_span">|</span>
                </div>
                <!--列表middle-->
                <div class="r_f_middle">
                	<div class="r_f_m_left">
                    	<a href="#"><img src="image/head.png"></a>
                    </div>
                   	<div class="r_f_m_right">
                    	<a href="#"><span>Jane</span></a>
                        <br>
                        <div class="r_f_m_right_total">
                        	<span>博文</span><span>12</span>
                            <span>|</span>
                            <span>关注</span><span>12</span>
                            <span>|</span>
                            <span>粉丝</span><span>12</span>
                        </div>
                        <div class="r_f_m_right_shortintroduce">
                        <span><strong>个人简介 : </strong></span>
                        <span>超喜欢吃西红柿的小伙子！是个程序员，爱打代码，你说怎么办？</span>
                        </div>
                    </div>
                </div>
                <div class="r_f_middle">
                	<div class="r_f_m_left">
                    	<a href="#"><img src="image/head1.png"></a>
                    </div>
                   	<div class="r_f_m_right">
                    	<a href="#"><span>Jane</span></a>
                        <br>
                        <div class="r_f_m_right_total">
                        	<span>博文</span><span>12</span>
                            <span>|</span>
                            <span>关注</span><span>12</span>
                            <span>|</span>
                            <span>粉丝</span><span>12</span>
                        </div>
                        <div class="r_f_m_right_shortintroduce">
                        <span><strong>个人简介 : </strong></span>
                        <span>超喜欢吃西红柿的小伙子！是个程序员，爱打代码，你说怎么办？</span>
                        </div>
                    </div>
                </div>
                <div class="r_f_middle">
                	<div class="r_f_m_left">
                    	<a href="#"><img src="image/head1.png"></a>
                    </div>
                   	<div class="r_f_m_right">
                    	<a href="#"><span>CAT</span></a>
                        <br>
                        <div class="r_f_m_right_total">
                        	<span>博文</span><span>12</span>
                            <span>|</span>
                            <span>关注</span><span>12</span>
                            <span>|</span>
                            <span>粉丝</span><span>12</span>
                        </div>
                        <div class="r_f_m_right_shortintroduce">
                        <span><strong>个人简介 : </strong></span>
                        <span>超喜欢吃西红柿的小伙子！是个程序员，爱打代码，你说怎么办？</span>
                        </div>
                    </div>
                </div>
                <div class="r_f_middle">
                	<div class="r_f_m_left">
                    	<a href="#"><img src="image/head.png"></a>
                    </div>
                   	<div class="r_f_m_right">
                    	<a href="#"><span>mimi</span></a>
                        <br>
                        <div class="r_f_m_right_total">
                        	<span>博文</span><span>12</span>
                            <span>|</span>
                            <span>关注</span><span>12</span>
                            <span>|</span>
                            <span>粉丝</span><span>12</span>
                        </div>
                        <div class="r_f_m_right_shortintroduce">
                        <span><strong>个人简介 : </strong></span>
                        <span>超喜欢吃西红柿的小伙子！是个程序员，爱打代码，你说怎么办？</span>
                        </div>
                    </div>
                </div><div class="r_f_middle">
                	<div class="r_f_m_left">
                    	<a href="#"><img src="image/head1.png"></a>
                    </div>
                   	<div class="r_f_m_right">
                    	<a href="#"><span>Tom</span></a>
                        <br>
                        <div class="r_f_m_right_total">
                        	<span>博文</span><span>12</span>
                            <span>|</span>
                            <span>关注</span><span>12</span>
                            <span>|</span>
                            <span>粉丝</span><span>12</span>
                        </div>
                        <div class="r_f_m_right_shortintroduce">
                        <span><strong>个人简介 : </strong></span>
                        <span>超喜欢吃西红柿的小伙子！是个程序员，爱打代码，你说怎么办？</span>
                        </div>
                    </div>
                </div>
                <div class="r_f_middle">
                	<div class="r_f_m_left">
                    	<a href="#"><img src="image/head.png"></a>
                    </div>
                   	<div class="r_f_m_right">
                    	<a href="#"><span>Tom</span></a>
                        <br>
                        <div class="r_f_m_right_total">
                        	<span>博文</span><span>12</span>
                            <span>|</span>
                            <span>关注</span><span>12</span>
                            <span>|</span>
                            <span>粉丝</span><span>12</span>
                        </div>
                        <div class="r_f_m_right_shortintroduce">
                        <span><strong>个人简介 : </strong></span>
                        <span>超喜欢吃西红柿的小伙子！是个程序员，爱打代码，你说怎么办？</span>
                        </div>
                    </div>
                </div>
                <div class="r_f_middle">
                	<div class="r_f_m_left">
                    	<a href="#"><img src="image/head1.png"></a>
                    </div>
                   	<div class="r_f_m_right">
                    	<a href="#"><span>Tom</span></a>
                        <br>
                        <div class="r_f_m_right_total">
                        	<span>博文</span><span>12</span>
                            <span>|</span>
                            <span>关注</span><span>12</span>
                            <span>|</span>
                            <span>粉丝</span><span>12</span>
                        </div>
                        <div class="r_f_m_right_shortintroduce">
                        <span><strong>个人简介 : </strong></span>
                        <span>超喜欢吃西红柿的小伙子！是个程序员，爱打代码，你说怎么办？</span>
                        </div>
                    </div>
                </div>
                
            </div>
            
        </div>
</body>
</html>
