<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="com.threeblog.serviceImpl.UserServiceImpl"%>
<%@page import="com.threeblog.service.UserService"%>
<%@page import="com.threeblog.domain.AblumBean"%>
<%@page import="com.threeblog.domain.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="toTop" content="true">
<title>我的相册</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/homepage.css" type="text/css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/personalcenter.css" type="text/css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/calendar.css">

<link href="${pageContext.request.contextPath}/css/owl.carousel.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/owl.carousel.js"></script>
<script src="${pageContext.request.contextPath}/js/changePage.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-rebox.css"/>

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

<body>
<!--顶端栏begin-->
<div id="index_head">
  <div id="index_head_logo"> <img src="${pageContext.request.contextPath}/image/logo.png"> </div>
  <div id="index_head_menu">
    <ul>
      <li><a href="${pageContext.request.contextPath}/RedirectServlet?method=homePageUI" >首页</a></li>
      <li><a href="${pageContext.request.contextPath}/RedirectServlet?method=blogUI" >博文</a></li>
      <li><a href="${pageContext.request.contextPath}/RedirectServlet?method=picturesUI" >画廊</a></li>
      <c:if test="${not empty userBean }">
      	<li><a href="${pageContext.request.contextPath}/RedirectServlet?method=personalCenterUI" >我的</a></li>
      </c:if>
      <c:if test="${empty userBean }">
       <li style="visibility: hidden;"><a href="javascript:;" >我的</a></li>
      </c:if>
    </ul>
  </div>
  <div id="index_head_tools"> 
  <ul>
  	<li>
    	<a href="${pageContext.request.contextPath}/RedirectServlet?method=searchUI">
        	<img  src="${pageContext.request.contextPath}/image/search.png" style="float:left;" />
       	</a> 
    </li>
    <c:if test="${not empty userBean }">
    <li id="messagepic">
    	<a href="javascript:;">
        	<div style="float:left; position:relative;">
    			<img src="${pageContext.request.contextPath}/image/message.png"/>
                	<span  id="tools_messagenumber">0</span>
             </div>
         </a> 
         <ul class="index_tools_messages">
         	<li><a href="${pageContext.request.contextPath}/RedirectServlet?method=reviewsUI">评论消息</a><span   class="index_tools_messagesnumber"style="top:20px;" >0</span></li>
	        <li><a href="${pageContext.request.contextPath}/RedirectServlet?method=followUI">关注消息</a><span  class="index_tools_messagesnumber" style="top:80px; ">0</span></li>
	        <li><a href="${pageContext.request.contextPath}/RedirectServlet?method=favorUI">收藏消息</a><span  class="index_tools_messagesnumber" style="top:140px;" >0</span></li>
	        <li><a href="${pageContext.request.contextPath}/RedirectServlet?method=zanUI">点赞消息</a><span  class="index_tools_messagesnumber" style=" top:200px;" >0</span></li>
         </ul>
    </li>
    <li>
    	<a href="javascript:;">
        	<img src="${pageContext.request.contextPath}/image/setting.png"/>
        </a>
        <ul class="index_tools_setting">
            
            <li><a href="${pageContext.request.contextPath}/RedirectServlet?method=personalCenterUI">&ensp;个人中心&ensp;</a></li>
	        <li><a href="${pageContext.request.contextPath}/RedirectServlet?method=changePasswordUI">&ensp;账号设置&ensp;</a></li>
	        <li><a href="${pageContext.request.contextPath}/RedirectServlet?method=PreportCenterUI">&ensp;举报中心&ensp;</a></li>
	        <li><a href="${pageContext.request.contextPath}/UserServlet?method=LoginOut">&ensp;退出账号&ensp;</a></li>
         </ul>
    </li>
    </c:if>
    <c:if test="${empty userBean }">
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
    </c:if>
     </ul>
     </div>
  <span style="color:#FFF; font-size:36px;float:left; margin-top:15px;"> |</span>
  <div id="index_head_signin">
    <c:if test="${empty userBean }">
    <ul>
      <li><a href="${pageContext.request.contextPath}/RedirectServlet?method=registUI">注册</a></li>
      <li><a href="${pageContext.request.contextPath}/RedirectServlet?method=LoginUI">登录</a></li>
    </ul>
    </c:if>
    <c:if test="${not empty userBean }">
     <a href="${pageContext.request.contextPath}/RedirectServlet?method=personalCenterUI" id="signin_headpic"><img src="${userBean.head }"></a>
    <a href="${pageContext.request.contextPath}/RedirectServlet?method=personalCenterUI"><span id="signin_username">${userBean.username}</span></a>
    </c:if>
  </div>
</div>
</div>
<!--顶端栏end-->
<!--内容begin-->
<div id="personalcenter_content">
		<!--头部栏-->
    	<div id="personalcenter_head">
    		<div id="head_pic" align="center">
          	<img src="${userBean.head }">	
            </div>			   			
            <div id="head_name" align="center">
            	<span>${userBean.username}</span>		 				
            </div>
            
            <div id="head_introduce" align="center">
              
              	<span><strong>个人简介:</strong></span><br>
                <span>▷${userBean.introduction }
                </span>
            </div>
    	</div>
        <!--导航栏-->
        <div id="personalcenter_lead">
        	<ul>
            	<li><a href="${pageContext.request.contextPath}/RedirectServlet?method=personalCenterUI"><span>我的主页</span></a></li>
                <li><a href="${pageContext.request.contextPath}/RedirectServlet?method=personalCenterUI"><span>我的收藏</span></a></li>
                <li><a href="javascript:;"><span>我的相册</span></a></li>
                <li><a href="${pageContext.request.contextPath}/RedirectServlet?method=PreportCenterUI"><span>举报中心</span></a></li>
            </ul>
        </div>
        <!--相册-->
        <div id="introduce_all">       	  
        	<div id="personalcenter_ablum">
            	<span>█ 相册</span>
                <a href="${pageContext.request.contextPath}/RedirectServlet?method=PUploadAblumUI"><span>上传/修改图片</span><img id="ablum_uploadimg" src="${pageContext.request.contextPath}/image/ablum.png" /></a>
                <div id="gallery2" class="gallery">  
                	  <%
		        		UserBean userBean=(UserBean)request.getSession().getAttribute("userBean");
		        		String uid = userBean.getId();//获取用户id
		        		UserService uService=new UserServiceImpl();
		        		List<AblumBean> photos = uService.findUserPhotosByUid(uid);
		        		if(photos.isEmpty()){		        			
		        			Calendar c=Calendar.getInstance();
		        			int nowYear = c.get(Calendar.YEAR);
		        			request.setAttribute("nowYear", nowYear);
		        	%>
		        	  <div class="gallery_years">
		                      <span>${nowYear}</span><br>
		                      <div align="center">
		                      	<p><strong>未上传过照片</strong></p>
		                      </div>
                      </div>	        	
			        <%}else{%>
                        <!--2019年图片  -->
                      <div class="gallery_years">
	                    <span>2019</span><br>			                    	        	
			        	<%	
			        		int y2019=2019;
	        				List<AblumBean> ps2019 = uService.findPhotosByUidYear(uid,y2019);
			        		if(ps2019.isEmpty()){
			        	%>
			        	
			        		<div align="center">
		                      	<p><strong>此年未上传过照片</strong></p>
		                    </div>
		                    
			        	<%	
			        		}else{
								for(int i=0;i<ps2019.size();i++){
			        				AblumBean photo2019=ps2019.get(i);//拿到 2019年 每张图片信息
			        				request.setAttribute("photo2019", photo2019);
			        	%>
			        	<%-- <c:when test="${photo.upload_date<='2019-12-31 23:59:59' && photo.upload_date>='2019-01-01 00:00:00' }">  --%>               	
	                      	<a href="${photo2019.photo }" title="${photo2019.upload_date }"><div class="gallery_div" style="background:url(${photo2019.photo }) no-repeat center;"></div></a>                     
	                    <%--  </c:when> --%> 
	                   <%}}%>
	                    </div>
	                   	 <!--2018年图片  -->
	                   <div class="gallery_years">	
                       	 <span>2018</span><br>
	                    <%	
			        		int y2018=2018;
	        				List<AblumBean> ps2018 = uService.findPhotosByUidYear(uid,y2018);
			        		if(ps2018.isEmpty()){
			        	%>
			        	
			        		<div align="center">
		                      	<p><strong>此年未上传过照片</strong></p>
		                    </div>
		                    
			        	<%	
			        		}else{
								for(int i=0;i<ps2018.size();i++){
			        				AblumBean photo2018=ps2018.get(i);//拿到 2019年 每张图片信息
			        				request.setAttribute("photo2018", photo2018);
			        	%>              	
	                      	<a href="${photo2018.photo }" title="${photo2018.upload_date }"><div class="gallery_div" style="background:url(${photo2018.photo }) no-repeat center;"></div></a>                     
	                   	<%	}}%>
                      </div>              
	                <%}%>
                </div>
				<script>
                $('#gallery2').rebox({ selector: 'a' });
                </script>
				
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
</html>
