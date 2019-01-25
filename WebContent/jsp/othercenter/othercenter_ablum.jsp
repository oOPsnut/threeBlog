<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="toTop" content="true">
<title>ta的相册</title>
<link rel="stylesheet" href="css/homepage.css" type="text/css"/>
<link rel="stylesheet" href="css/personalcenter.css" type="text/css"/>
<link rel="stylesheet" href="css/calendar.css">

<link href="css/owl.carousel.css" rel="stylesheet">
<script src="js/class.js"></script>
<script src="js/MsgBox.js"></script>
<script src="js/jquery-1.min.js"></script>
<script src="js/owl.carousel.js"></script>
<link rel="stylesheet" href="css/jquery-rebox.css"/>

<script src="js/jquery-rebox.js"></script>
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
         		<img src="image/head.png">	
            </div>			   			
            <div id="head_name" align="center">
            	<span>Tom</span>		 				
            </div>
            
            <div id="head_introduce_o" align="center">
              
              	<span><strong>个人简介:</strong></span><br>
                <span>心灵美才是真的美丽！</span>
            </div>
            <div id="head_follow_o" align="center">
            	<a href="#"><img title="取消关注" src="image/cancelfollow.png" ></a>
             <a href="#"><img title="相互关注" src="image/followtogether.png" ></a>
            </div>
    	</div>
        <!--导航栏-->
        <div id="othercenter_lead">
        	<ul>
            	<li><span>Ta的主页</span></li>
                <li><span>Ta的收藏</span></li>
                <li><span>Ta的相册</span></li>
            </ul>
        </div>
         <!--相册-->
        <div id="introduce_all">
        	<div id="personalcenter_ablum">
            	<span>█ 相册</span>
                
                <div id="gallery2" class="gallery">
                	<div class="gallery_years">
                    <span>2018</span><br>
                    <a href="image/pic2.jpg" title="2018-05-04"><div class="gallery_div" style="background:url(image/pic2.jpg) no-repeat center;"></div></a>
                    <a href="image/pic3.jpg" title="2018-05-04"><div class="gallery_div" style="background:url(image/pic3.jpg) no-repeat center;"></div></a>
                    <a href="image/pic4.jpg" title="2018-05-04"><div class="gallery_div" style="background:url(image/pic4.jpg) no-repeat center;"></div></a>
                    </div>
                    <div class="gallery_years">
                    <span>2017</span><br>
                     <a href="image/2.jpg" title="2018-05-04"><div class="gallery_div" style="background:url(image/2.jpg) no-repeat center;"></div></a>
                      <a href="image/3.jpg" title="2018-05-04"><div class="gallery_div" style="background:url(image/3.jpg) no-repeat center;"></div></a>
                      <a href="image/1.jpg" title="2018-05-04"><div class="gallery_div" style="background:url(image/1.jpg) no-repeat center;"></div></a>
                      </div>
                      <div class="gallery_years">
                      <span>2016</span><br>
                      <a href="image/background_1.jpg" title="2018-05-04"><div class="gallery_div" style="background:url(image/background_1.jpg) no-repeat center;"></div></a>
                      <a href="image/background_2.jpg" title="2018-05-04"><div  class="gallery_div" style="background:url(image/background_2.jpg) no-repeat center;"></div></a>
                      <a href="image/background_3.jpg" title="2018-05-04"><div class="gallery_div" style="background:url(image/background_3.jpg) no-repeat center;"></div></a>
                      <a href="image/background_4.jpg" title="2018-05-04"><div class="gallery_div" style="background:url(image/background_4.jpg) no-repeat center;"></div></a>
                      <a href="image/background_5.jpg" title="2018-05-04"><div class="gallery_div" style="background:url(image/background_5.jpg) no-repeat center;"></div></a>
                      </div>
                    <div class="gallery_years">
                    <span>2015</span><br>
                      <a href="image/background_6.jpg" title="2018-05-04"><div class="gallery_div" style="background:url(image/background_6.jpg) no-repeat center;"></div></a>
                      <a href="image/background_7.jpg" title="2018-05-04"><div class="gallery_div" style="background:url(image/background_7.jpg) no-repeat center;"></div></a>
                      </div>
                </div>
				<script>
                $('#gallery2').rebox({ selector: 'a' });
                </script>

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
</html>
