<%@page import="com.threeblog.serviceImpl.UserServiceImpl"%>
<%@page import="com.threeblog.service.UserService"%>
<%@page import="com.threeblog.domain.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="toTop" content="true">
<title>消息中心</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/homepage.css" type="text/css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/messagecenter.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/personalcenter.css" type="text/css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/calendar.css">
<link href="${pageContext.request.contextPath}/css/owl.carousel.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/messagechangeP.js"></script>
<script src="${pageContext.request.contextPath}/js/class.js"></script>
<script src="${pageContext.request.contextPath}/js/MsgBox.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/owl.carousel.js"></script>
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

<body onload="m_reviews()">
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
	        <li><a href="javascript:;">&ensp;账号设置&ensp;</a></li>
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
		<%
			UserBean userBean = (UserBean)request.getSession().getAttribute("userBean");
			String uid = userBean.getId();
			UserService uService = new UserServiceImpl();
			int countReviews =  Integer.valueOf( uService.countReviews(uid).toString());//评论消息数
			int countFollows =  Integer.valueOf( uService.countFollows(uid).toString());//关注消息数
			int countCollects =  Integer.valueOf( uService.countCollects(uid).toString());//收藏消息数
			int countZans =  Integer.valueOf( uService.countZans(uid).toString());//点赞消息数
			request.setAttribute("countReviews", countReviews);
    		request.setAttribute("countFollows", countFollows);
    		request.setAttribute("countCollects", countCollects);
    		request.setAttribute("countZans", countZans);
		%>
        <div id="messagecenter_all">
           	<h3>█ 消息中心</h3>
        		<!--列表up-->
           	<div id="messagecenter_up">
            	<div class="up_labels">
                    <a href="javascript:;"><span>评论消息</span></a>
                    <span class="up_labels_num">0</span>
             	</div>
                <span id="messagecenter_up_span">|</span>
                <div class="up_labels">
                    <a href="${pageContext.request.contextPath}/RedirectServlet?method=followUI"><span>关注消息</span></a>
                    <span class="up_labels_num">0</span>
             	</div>
                <span id="messagecenter_up_span">|</span>
                <div class="up_labels">
                    <a href="${pageContext.request.contextPath}/RedirectServlet?method=favorUI"><span>收藏消息</span></a>
                    <span class="up_labels_num">0</span>
             	</div>
                <span id="messagecenter_up_span">|</span>
                <div class="up_labels">
                    <a href="${pageContext.request.contextPath}/RedirectServlet?method=zanUI"><span>点赞消息</span></a>
                    <span class="up_labels_num">0</span>
             	</div>
           	</div>
                <!--列表down-->
            <div id="messagecenter_down">
            	<span id="messagecenter_down_id">█ 评论消息</span>
            <select>
    			<option value="notread">未读</option>
    			<option value="read">已读</option>
    	    </select>
            <br>
            <br>
            <table id="messagecenter_table" border="1">
                <tr>
                <th width="5%">#</th>
                <th width="55%">评论及回复</th>
                <th width="25%">时间</th>
                <th width="15%">操作</th>
                </tr>
                <tr>
                <td>1</td>
                <td><a href="#" id="m_review_author">xxx </a>评论了你的博文<a href="#" id="m_review_article">《我们是时间的旅行者》</a></td>
                <td>2018-05-20</td>
                <td><a href="" target="_blank"><img  id="eye" src="image/eye.png"></a>
                    <!--查看图标更换的jq-->
					<script>
                    $('#eye').click(function(){  
                              
                            if($('#eye').attr('src')=='image/eye.png'){  
                                $('#eye').attr('src','image/eyes.png');  
                            }
                              
                    });  
                    </script>
            </td>
            </tr>
            <tr>
                <td>3</td>
                <td><a href="#" id="m_review_author">miniK </a>评论了你的博文<a href="#" id="m_review_article">《我们是时间的旅行者》</a></td>
                <td>2018-05-20</td>
                <td><a href="" target="_blank"><img  id="eye" src="image/eye.png"></a>
                    <!--查看图标更换的jq-->
					<script>
                    $('#eye').click(function(){  
                              
                            if($('#eye').attr('src')=='image/eye.png'){  
                                $('#eye').attr('src','image/eyes.png');  
                            }
                              
                    });  
                    </script>
            </td>
            </tr>
            <tr>
                <td>1</td>
                <td><a href="#" id="m_review_author">shell </a>评论了你的博文<a href="#" id="m_review_article">《我们是时间的旅行者》</a></td>
                <td>2018-05-20</td>
                <td><a href="" target="_blank"><img  id="eye" src="image/eye.png"></a>
                    <!--查看图标更换的jq-->
					<script>
                    $('#eye').click(function(){  
                              
                            if($('#eye').attr('src')=='image/eye.png'){  
                                $('#eye').attr('src','image/eyes.png');  
                            }
                              
                    });  
                    </script>
            </td>
            </tr>
            </table>
            </div> 
        </div>
     </div>
</div>
<!--内容end-->
<!--置顶框begin-->
	<script type="text/javascript" src="js/toTop.js"></script>
<!--置顶框end-->
<!--底部begin-->
<footer>
	<img src="image/footer_logo.png">
    <div id="footer_about">
    <p>&emsp;关于我们 | 意见反馈 | 服务条例 | 隐私政策</p>
    <p>Copyright © 2018 | Three Blog | All Right Reserved</p>
    </div>
</footer>
<!--底部end-->
</body>
</html>
