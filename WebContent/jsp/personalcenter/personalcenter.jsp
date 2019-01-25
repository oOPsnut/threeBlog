<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="com.threeblog.serviceImpl.ArticleServiceImpl"%>
<%@page import="com.threeblog.service.ArticleService"%>
<%@page import="com.threeblog.serviceImpl.UserServiceImpl"%>
<%@page import="com.threeblog.service.UserService"%>
<%@page import="com.threeblog.domain.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="toTop" content="true">
<title>个人中心</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/homepage.css" type="text/css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/personalcenter.css" type="text/css"/>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/calendar.css">

<link href="${pageContext.request.contextPath}/css/owl.carousel.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/owl.carousel.js"></script>
<script src="${pageContext.request.contextPath}/js/changePage.js"></script>
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

<body onload="myChangePage()">
<!--顶端栏begin-->
<div id="index_head">
  <div id="index_head_logo"> <img src="${pageContext.request.contextPath}/image/logo.png"> </div>
  <div id="index_head_menu">
    <ul>
      <li><a href="${pageContext.request.contextPath}/RedirectServlet?method=homePageUI" >首页</a></li>
      <li><a href="${pageContext.request.contextPath}/RedirectServlet?method=blogUI" >博文</a></li>
      <li><a href="${pageContext.request.contextPath}/RedirectServlet?method=picturesUI" >画廊</a></li>
      <c:if test="${not empty userBean }">
      	<li><a href="javascript:;" >我的</a></li>
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
            
            <li><a href="javascript:;">&ensp;个人中心&ensp;</a></li>
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
     <a href="javascript:;" id="signin_headpic"><img src="${userBean.head }"></a>
    <a href="javascript:;"><span id="signin_username">${userBean.username}</span></a>
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
            	<li><a href="javascript:;" onclick="myHome()"><span>我的主页</span></a></li>
                <li><a href="javascript:;" onclick="myCollect()"><span>我的收藏</span></a></li>
                <li><a href="${pageContext.request.contextPath}/RedirectServlet?method=PablumUI"><span>我的相册</span></a></li>
                <li><a href="${pageContext.request.contextPath}/RedirectServlet?method=PreportCenterUI"><span>举报中心</span></a></li>
            </ul>
        </div>
        <!--介绍栏左侧-->
        <div id="introduce_all">
        <!--统计-->
        <div id="introduce_left">
        	<div id="introduce_left_total">
            	<%	 //取用户的信息
            		UserBean userBean = (UserBean) request.getSession().getAttribute("userBean");
            		String uid = userBean.getId();
            		ArticleService  aService = new ArticleServiceImpl();
            		String Mtype="默认分类";
            		String Gtype="个人心情";
            		String Ztype="杂乱无章";
            		String Xtype="休闲娱乐";
            		String Ytype="游戏漫画";
            		String Ltype="旅游摄影";
            		String Stype="时尚美食";
            		String Qtype="校园青春";
            		String Ktype="媒体科技";
            		String Ttype="体育健康";
            		int countArticle =  Integer.valueOf( aService.countArticles(uid).toString());//全部文章
            		int countMArticle =  Integer.valueOf( aService.countMArticles(uid,Mtype).toString());//默认分类
            		int countGArticle =  Integer.valueOf( aService.countGArticles(uid,Gtype).toString());//个人心情
            		int countZArticle =  Integer.valueOf( aService.countZArticles(uid,Ztype).toString());//杂乱无章
            		int countXArticle =  Integer.valueOf( aService.countXArticles(uid,Xtype).toString());//休闲娱乐
            		int countYArticle =  Integer.valueOf( aService.countYArticles(uid,Ytype).toString());//游戏漫画
            		int countLArticle =  Integer.valueOf( aService.countLArticles(uid,Ltype).toString());//旅游摄影
            		int countSArticle =  Integer.valueOf( aService.countSArticles(uid,Stype).toString());//时尚美食
            		int countQArticle =  Integer.valueOf( aService.countQArticles(uid,Qtype).toString());//校园青春
            		int countKArticle =  Integer.valueOf( aService.countKArticles(uid,Ktype).toString());//媒体科技
            		int countTArticle =  Integer.valueOf( aService.countTArticles(uid,Ttype).toString());//体育健康
            		request.setAttribute("countArticle", countArticle);
            		request.setAttribute("countMArticle", countMArticle);
            		request.setAttribute("countGArticle", countGArticle);
            		request.setAttribute("countZArticle", countZArticle);
            		request.setAttribute("countXArticle", countXArticle);
            		request.setAttribute("countYArticle", countYArticle);
            		request.setAttribute("countLArticle", countLArticle);
            		request.setAttribute("countSArticle", countSArticle);
            		request.setAttribute("countQArticle", countQArticle);
            		request.setAttribute("countKArticle", countKArticle);
            		request.setAttribute("countTArticle", countTArticle);
            		UserService uService = new UserServiceImpl();
            		int countFollowing =  Integer.valueOf(uService.countFollowing(uid).toString());//关注
            		int countFollower =  Integer.valueOf(uService.countFollower(uid).toString());//粉丝
            		request.setAttribute("countFollowing", countFollowing);
            		request.setAttribute("countFollower", countFollower);
            		
            	%>
            	<table>
                	<tr>
                    	<td class="total_td">
                        <a href="javascript:;" onclick="myHome()">
                        <span>博文</span>
                        <strong>${countArticle}</strong>
                        </a>
                        </td>
                        <td class="total_td" id="total_td">
                        <a href="javascript:;" onclick="myFollowing()">
                        <span>关注</span>
                        <strong>${countFollowing}</strong>
                        </a>
                        </td>
                        <td class="total_td">
                        <a href="javascript:;" onclick="myFollower()">
                        <span>粉丝</span>
                        <strong>${countFollower}</strong>
                        </a>
                        </td>
                    </tr>
                </table>  
            </div>
        	<!--个人信息-->
        	<div id="introduce_left_info">					
        	<ul>
            <li><img src="${pageContext.request.contextPath}/image/sex.png"><span>${userBean.sex }</span></li>
            <li><img src="${pageContext.request.contextPath}/image/years_old.png" ><span >${userBean.age }</span></li>
            <li><img src="${pageContext.request.contextPath}/image/register_time.png" ><span >${userBean.register_time }</span></li>
            <li><img src="${pageContext.request.contextPath}/image/location.png" > <span >${userBean.province }-${userBean.city }</span></li>
            </ul>
              </div>
             <div id="info_edit" align="center">
              <a href="${pageContext.request.contextPath}/RedirectServlet?method=PchangeInfoUI">
              <span>编辑个人资料 &gt;</span></a>
              </div>
        	<!--博文分类-->
        	<div id="introduce_left_classify">
              	<span>█ 博文分类</span>
                <ul>
               		<li><a href="javascript:;" onclick="myHome()">全部博文(${countArticle})</a></li><br>
                    <li><a href="javascript:;" onclick="myPub(1)">默认分类(${countMArticle})</a></li><br>
                    <li><a href="javascript:;" onclick="myPub(2)">个人心情(${countGArticle})</a></li><br>
                    <li><a href="javascript:;" onclick="myPub(3)">杂乱无章(${countZArticle})</a></li><br>
                    <li><a href="javascript:;" onclick="myPub(4)">休闲 & 娱乐(${countXArticle})</a></li><br>
                    <li><a href="javascript:;" onclick="myPub(5)">游戏 & 漫画(${countYArticle})</a></li><br>
                    <li><a href="javascript:;" onclick="myPub(6)">旅游 & 摄影(${countLArticle})</a></li><br>
                  	<li><a href="javascript:;" onclick="myPub(7)">时尚 & 美食(${countSArticle})</a></li><br>
                  	<li><a href="javascript:;" onclick="myPub(8)">校园 & 青春(${countQArticle})</a></li><br>
                  	<li><a href="javascript:;" onclick="myPub(9)">媒体 & 科技(${countKArticle})</a></li><br>
                  	<li><a href="javascript:;" onclick="myPub(0)">体育 & 健康(${countTArticle})</a></li><br>
                </ul>
        	</div>
        	<input type="hidden" id="hid0" value="${countMArticle}" /> 
        	<input type="hidden" id="hid1" value="${countGArticle}" /> 
        	<input type="hidden" id="hid2" value="${countZArticle}" /> 
        	<input type="hidden" id="hid3" value="${countXArticle}" /> 
        	<input type="hidden" id="hid4" value="${countYArticle}" /> 
        	<input type="hidden" id="hid5" value="${countLArticle}" /> 
        	<input type="hidden" id="hid6" value="${countSArticle}" /> 
        	<input type="hidden" id="hid7" value="${countQArticle}" /> 
        	<input type="hidden" id="hid8" value="${countKArticle}" /> 
        	<input type="hidden" id="hid9" value="${countTArticle}" /> 
        	
   			<%
           		List<Object[]> years = aService.getAYearsfrom(uid);
				String start="2019-01-01 00:00:00";
				String end="2019-12-31 23:59:59";   
				int y2019 =  Integer.valueOf( aService.countAByYears(uid,start,end).toString());
				request.setAttribute("y2019", y2019);
				String start1="2018-01-01 00:00:00";
				String end1="2018-12-31 23:59:59";   
				int y2018 =  Integer.valueOf( aService.countAByYears(uid,start1,end1).toString());
				request.setAttribute("y2018", y2018);   	
				String start2="2020-01-01 00:00:00";
				String end2="2020-12-31 23:59:59";   
				int y2020 =  Integer.valueOf( aService.countAByYears(uid,start2,end2).toString());
				request.setAttribute("y2020", y2020);
               %>
        	
            <!--日期归档-->
        	<div id="introduce_left_years">
              	<h4>█ 日期归档</h4>
                <ul id="years_ul">               	
                    <li><a href="javascript:;" onclick="myPubT(2019)">2019年(${y2019})</a></li><br>
                    <li><a href="javascript:;" onclick="myPubT(2018)">2018年(${y2018})</a></li><br>
                    <li><a href="javascript:;" onclick="myPubT(0)">第一条博文</a></li><br>
                </ul>
                <!-- 动态创建日期列表 -->
                <script type="text/javascript">
							var currentDate=new Date();
							var currentYear=currentDate.getFullYear();//获取当前年份
							var currentHtml='<li><a href="javascript:;" onclick="myPubT('+currentYear+')">'+currentYear+'年(${y2020})</a></li><br>';
							var years_ul=document.getElementById("years_ul").innerHTML;
							if (years_ul.toString().indexOf(currentYear)>-1) {
								
							}else {
								$("#years_ul").append(currentHtml);
							}						
                 </script>
        	</div>
        </div>
        <!--介绍栏右侧-->
        <div id="introduce_right_Frame">   
        <div id="introduce_right">    	
            
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
