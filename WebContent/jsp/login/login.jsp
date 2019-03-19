<%@page import="com.threeblog.domain.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="toTop" content="true">
<title>登录</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/homepage.css" type="text/css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css" type="text/css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/personalcenter.css" type="text/css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/calendar.css">

<link href="${pageContext.request.contextPath}/css/owl.carousel.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/owl.carousel.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/md5.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-rebox.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/encryptionPassword.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-rebox.js"></script>
<!--头部show的js-->
<script>
$(function(){
    $('#owl-demo').owlCarousel({
        items: 1,
        autoPlay: true
    });
});
</script>
<!--消息栏显示-->
<script>

$(function() {
    $('li').hover(function() {
            $(this).find('ul').css({
                'display': 'block',
                'animation:': '2s'
            })
        },
        function() {
            $(this).find('ul').css({
                'display': 'none',
                'animation:': '2s'
            })
        });
});
</script>

</head>

<%
	UserBean userBean = (UserBean) request.getSession().getAttribute("userBean");
	if(userBean==null){
%>

<body>
<!--顶端栏begin-->
<div id="index_head">
  <div id="index_head_logo"> <img src="${pageContext.request.contextPath}/image/logo.png"> </div>
  <div id="index_head_menu">
    <ul>
      <li><a href="${pageContext.request.contextPath}/RedirectServlet?method=homePageUI" >首页</a></li>
      <li><a href="${pageContext.request.contextPath}/RedirectServlet?method=blogUI" >博文</a></li>
      <li><a href="${pageContext.request.contextPath}/RedirectServlet?method=picturesUI" >画廊</a></li>
      <li style="visibility: hidden;"><a href="javascript:;" >我的</a></li>
    </ul>
  </div>
  <div id="index_head_tools"> 
  <ul>
  	<li>
    	<a href="${pageContext.request.contextPath}/RedirectServlet?method=searchUI">
        	<img  src="${pageContext.request.contextPath}/image/search.png" style="float:left;" />
       	</a> 
    </li>
	    <li id="messagepic" style=" visibility: hidden;">
	    	<a href="javascript:;">
	        	<div style="float:left; position:relative;">
	    			<img src="${pageContext.request.contextPath}/image/message.png"/>
	                	<span  id="tools_messagenumber">0</span>
	             </div>
	         </a> 
	         <ul class="index_tools_messages">
	         	<li><a href="javascript:;">评论消息</a><span   class="index_tools_messagesnumber"style="top:20px;" >0</span></li>
	          	<li><a href="javascript:;">关注消息</a><span  class="index_tools_messagesnumber" style="top:80px; ">0</span></li>
	            <li><a href="javascript:;">收藏消息</a><span  class="index_tools_messagesnumber" style="top:140px;" >0</span></li>
	            <li><a href="javascript:;">点赞消息</a><span  class="index_tools_messagesnumber" style=" top:200px;" >0</span></li>
	         </ul>
	    </li>
	    <li style="visibility: hidden;">
    	<a href="javascript:;">
        	<img src="${pageContext.request.contextPath}/image/setting.png"/>
        </a>
        <ul class="index_tools_setting">
            
            <li><a href="javascript:;">&ensp;个人中心&ensp;</a></li>
            <li><a href="javascript:;">&ensp;账号设置&ensp;</a></li>
            <li><a href="javascript:;">&ensp;举报中心&ensp;</a></li>
            <li><a href="javascript:;">&ensp;退出账号&ensp;</a></li>
         </ul>
    </li>
     </ul>
     </div>
  <span style="color:#FFF; font-size:36px;float:left; margin-top:15px;"> |</span>
  <div id="index_head_signin">
    <ul>
      <li><a href="${pageContext.request.contextPath}/RedirectServlet?method=registUI">注册</a></li>
      <li><a href="javascript:;">登录</a></li>
    </ul>
  </div>
</div>
</div>
<!--顶端栏end-->
<!--内容begin-->
<div id="login_all">
	<div id="login_left">
    	<table>
        	<tr>
            	<td>
                	<p>最情深的故事，掺和最烈的酒</p>
                    <span>Blend the most profound story with the most intense wine.</span>
                </td>
            </tr>
        </table>
    </div>
    <div id="login_right">
    	<div id="right_content">
        	<img src="${pageContext.request.contextPath}/image/footer_logo.png">
            <div id="right_content_f" align="center">
            	<form action="${pageContext.request.contextPath}/UserServlet?method=UserLogin" method="post">
            	<input class="f_input" type="text" name="phone" placeholder=" 请 输 入 手 机 号" id="phone" onkeyup="isPhoneNum()"  required>
                <input class="f_input" type="password" name="password" placeholder=" 请 输 入 密 码"id="password" required><br>
                	 <span class="errorMsg" style="color: red;">${errorMsg}</span>
                <a href="${pageContext.request.contextPath}/RedirectServlet?method=forgetPasswdUI" id="forget_passwd">忘记密码？</a><br>
                <div id="f_remember">
                <input type="checkbox" id="remember" checked  name="auto_login"/>
                <label for="remember">三天内免登录</label>
                </div>
                <input class="f_input" type="submit" name="submit" id="login" value="登&emsp;录" onclick="encryptionPassword()"/>
                
                <a id="register" href="${pageContext.request.contextPath}/RedirectServlet?method=registUI">注&emsp;册</a>
                </form>
            </div>
        </div>
    </div>
</div>
<!--内容end-->
<!--置顶框begin-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/toTop.js"></script>
<!--置顶框end-->
<!--底部begin-->
<footer>
	<img src="${pageContext.request.contextPath}/image/footer_logo.png">
    <div id="footer_about">
    <p>&emsp;关于我们 | 意见反馈 | 服务条例 | 隐私政策</p>
    <p>Copyright © 2018 | Three Blog | All Right Reserved</p>
    </div>
</footer>
<!--底部end-->
</body>
	<%
		}else{
			response.sendRedirect(request.getContextPath()+"/jsp/homepage/Homepage.jsp");
		} 
	%>
</html>
