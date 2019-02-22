<%@page import="com.threeblog.domain.UserBean"%>
<%@page import="com.threeblog.serviceImpl.UserServiceImpl"%>
<%@page import="com.threeblog.serviceImpl.ArticleServiceImpl"%>
<%@page import="com.threeblog.service.ArticleService"%>
<%@page import="com.threeblog.service.UserService"%>
<%@page import="java.util.Date"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Choose"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%   	
    	//作者是指此中心的用户
 		//从地址栏获取作者id
		String uid =  request.getQueryString().substring(3);
    	UserService uService = new UserServiceImpl();
    	UserBean uBean = uService.findUserInfo(uid);//找出作者的信息
    	if(uBean!=null){
    	request.setAttribute("uBean", uBean);
    	 UserBean userBean = (UserBean)request.getSession().getAttribute("userBean");//本登录用户
    	if(userBean!=null){
    		String userId = userBean.getId();
    		if(userId.equals(uid)){  
    			response.sendRedirect(request.getContextPath()+"/RedirectServlet?method=personalCenterUI");
    		}else{	
	    		String id =  userBean.getId();//登录用户id	    	
	    		
	    		int countReviews =  Integer.valueOf( uService.countReviews(id).toString());//评论消息数
				int countFollows =  Integer.valueOf( uService.countFollows(id).toString());//关注消息数
				int countCollects =  Integer.valueOf( uService.countCollects(id).toString());//收藏消息数
				int countZans =  Integer.valueOf( uService.countZans(id).toString());//点赞消息数
				int countAll=countReviews+countFollows+countCollects+countZans;//消息总数
				request.setAttribute("countAll", countAll);
				request.setAttribute("countReviews", countReviews);
	    		request.setAttribute("countFollows", countFollows);
	    		request.setAttribute("countCollects", countCollects);
	    		request.setAttribute("countZans", countZans);
	    		
	        	boolean following = uService.findFollowStatus(id,uid);//用户有没有关注作者
	        	boolean follower = uService.findFollowStatus(uid,id);//作者有没有关注我
	        	if(following && follower){
	        		//相互关注 eachfollow
	        		String eachf="相互关注";
	        		request.setAttribute("eachf", eachf);
	        	}else if(following && !follower){
	        		//用户关注了作者UserFollowAuthor
	        		String ufa="用户关注了作者";
	        		request.setAttribute("ufa", ufa);
	        	}else if(!following && follower){
	        		//作者关注了用户AuthorFollowUser
	        		String afu="作者关注了用户";
	        		request.setAttribute("afu", afu);
	        	}else if(!following && !follower){
	        		//均未关注对方notfollow
	        		String notf="均未关注对方";
	        		request.setAttribute("notf", notf);
	        	}  				        	
    		}
        }
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="toTop" content="true">
<title>${uBean.username}的主页</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/homepage.css" type="text/css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/personalcenter.css" type="text/css"/>
<script src="${pageContext.request.contextPath}/js/class.js"></script>
<script src="${pageContext.request.contextPath}/js/MsgBox.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/calendar.css">

<link href="${pageContext.request.contextPath}/css/owl.carousel.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/owl.carousel.js"></script>
<script src="${pageContext.request.contextPath}/js/changeP.js"></script>
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

<body onload="taChangeP()">
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
    			<c:if test="${countAll<100 }">
                	<span  id="tools_messagenumber">${countAll }</span>
                </c:if>
                <c:if test="${countAll>99 }">
                	<span  id="tools_messagenumber">...</span>
                </c:if>
             </div>
         </a> 
         <ul class="index_tools_messages">
         	<li><a href="${pageContext.request.contextPath}/RedirectServlet?method=reviewsUI">评论消息</a>
         	<c:if test="${countReviews<99 }">
         		<span   class="index_tools_messagesnumber"style="top:20px;" >${countReviews }</span>
         	</c:if>
         	<c:if test="${countReviews>100 }">
         		<span   class="index_tools_messagesnumber"style="top:20px;" >...</span>
         	</c:if>
         	</li>
	        <li><a href="${pageContext.request.contextPath}/RedirectServlet?method=followUI">关注消息</a>
	        <c:if test="${countReviews<99 }">
         		<span  class="index_tools_messagesnumber" style="top:80px; ">${countFollows }</span>
         	</c:if>
         	<c:if test="${countReviews>100 }">
         		<span  class="index_tools_messagesnumber" style="top:80px; ">...</span>
         	</c:if>
	        </li>
	        <li><a href="${pageContext.request.contextPath}/RedirectServlet?method=favorUI">收藏消息</a>	        	
	        <c:if test="${countReviews<99 }">
         		<span  class="index_tools_messagesnumber" style="top:140px;" >${countCollects }</span>
         	</c:if>
         	<c:if test="${countReviews>100 }">
         		<span  class="index_tools_messagesnumber" style="top:140px;" >...</span>
         	</c:if>
	        </li>
	        <li><a href="${pageContext.request.contextPath}/RedirectServlet?method=zanUI">点赞消息</a>	        
	        <c:if test="${countReviews<99 }">
         		<span  class="index_tools_messagesnumber" style=" top:200px;" >${countZans }</span>
         	</c:if>
         	<c:if test="${countReviews>100 }">
         		<span  class="index_tools_messagesnumber" style=" top:200px;" >...</span>
         	</c:if>
	        </li>
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
          	<img src="${uBean.head }">	
            </div>			   			
            <div id="head_name" align="center">
            	<span>${uBean.username}</span>		 				
            </div>
            
            <div id="head_introduce_o" align="center">
              
              	<span><strong>个人简介:</strong></span><br>
                <span>▷${uBean.introduction}</span>
            </div>
            <div id="head_follow_oo">
            <div id="head_follow_o" align="center">
	            <c:if test="${empty userBean }">
	            	<a href="javascript:;" onclick="clickfollow()"><img title="关注" src="${pageContext.request.contextPath}/image/canfollow.png" ></a>
	            </c:if>
	            <c:if test="${not empty userBean }">
	            	<c:choose>
	            		<c:when test="${not empty eachf}">
	            			<a href="javascript:;" onclick="cancelfollow()"><img title="取消关注" src="${pageContext.request.contextPath}/image/cancelfollow.png" ></a>
            				<a href="javascript:;"><img title="相互关注" src="${pageContext.request.contextPath}/image/followtogether.png" ></a>
	            		</c:when>
	            		<c:when test="${not empty ufa}">
	            			<a href="javascript:;" onclick="cancelfollow()"><img title="取消关注" src="${pageContext.request.contextPath}/image/cancelfollow.png" ></a>
             				<a href="javascript:;"><img title="我关注了Ta" src="${pageContext.request.contextPath}/image/follow.png" ></a>
	            		</c:when>
	            		<c:when test="${not empty afu}">
	            			<a href="javascript:;" onclick="follow()"><img title="关注" src="${pageContext.request.contextPath}/image/canfollow.png" ></a>
             				<a href="javascript:;"><img title="Ta关注了我" src="${pageContext.request.contextPath}/image/Tafollow.png" ></a>
	            		</c:when>
	            		<c:when test="${not empty notf}">
	            			<a href="javascript:;" onclick="follow()"><img title="关注" src="${pageContext.request.contextPath}/image/canfollow.png" ></a>            				
	            		</c:when>
	            	</c:choose>	            	
	            </c:if>	            
            	<script type="text/javascript">
            		function follow(){
            			var id = "${userBean.id}";//用户id
            			var author_id="${uBean.id}";//获取作者id
            			$.ajax({
            				type:"POST",//用post方式传输
            				dataType:"json",//数据格式:JSON
            				url:"/ThreeBlog_V1.0/UserServlet?method=addFollow" ,//目标地址
            				data:{
            					"following_id":id,
            					"follower_id":author_id
            				},
            				error:function(){
            					alert("出错！");
            				},
            				success:function(data){
            					if(data){
            						alert("关注成功！");    
            						$("#head_follow_oo").load(location.href+" #head_follow_o");
            					}else{
            						alert("关注失败！");
            					}
            				}
            			});
					}
            		
            		function cancelfollow() {
            			var id = "${userBean.id}";//用户id
            			var author_id="${uBean.id}";//作者id
            			$.ajax({
            				type:"POST",//用post方式传输
            				dataType:"json",//数据格式:JSON
            				url:"/ThreeBlog_V1.0/UserServlet?method=cancelFollow" ,//目标地址
            				data:{
            					"following_id":id,
            					"follower_id":author_id
            				},
            				error:function(){
            					alert("出错！");
            				},
            				success:function(data){
            					if(data){
            						alert("取消关注成功！");  
            						$("#head_follow_oo").load(location.href+" #head_follow_o");
            					}else{
            						alert("取消关注失败！");
            					}
            				}
            			});
					}
            	</script>
            </div>
            </div>
    	</div>
        <!--导航栏-->
        <div id="othercenter_lead">
        	<ul>
            	<li><a href="javascript:;" onclick="taHome()"><span>Ta的主页</span></a></li>
                <li><a href="javascript:;" onclick="taCollect()"><span>Ta的收藏</span></a></li>
                <li><a href="${pageContext.request.contextPath}/jsp/othercenter/othercenter_ablum.jsp?id=${uBean.id}"><span>Ta的相册</span></a></li>
            </ul>
        </div>
        <!--介绍栏左侧-->
        <div id="introduce_all">
        <!--统计-->
        <div id="introduce_left">
        	<div id="introduce_left_total">
            	 <%	
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
            		int countFollowing =  Integer.valueOf(uService.countFollowing(uid).toString());//关注
            		int countFollower =  Integer.valueOf(uService.countFollower(uid).toString());//粉丝
            		request.setAttribute("countFollowing", countFollowing);
            		request.setAttribute("countFollower", countFollower);
            %> 
            	<table>
                	<tr>
                    	<td class="total_td">
                        <a href="javascript:;" onclick="taHome()">
                        <span>博文</span>
                        <strong>${countArticle}</strong>
                        </a>
                        </td>
                        <td class="total_td" id="total_td">
                        <a href="javascript:;" onclick="taFollowing()">
                        <span>关注</span>
                        <strong>${countFollowing}</strong>
                        </a>
                        </td>
                        <td class="total_td">
                        <a href="javascript:;" onclick="taFollower()">
                        <span>粉丝</span>
                        <strong>${countFollower}</strong>
                        </a>
                        </td>
                    </tr>
                </table>  
            </div>
        	<!--个人信息-->
        	<div id="introduce_left_info_other">					
        	<ul>
            <li><img src="${pageContext.request.contextPath}/image/sex.png"><span>${uBean.sex }</span></li>
            <li><img src="${pageContext.request.contextPath}/image/years_old.png" ><span >${uBean.age}</span></li>
            <li><img src="${pageContext.request.contextPath}/image/register_time.png" ><span >${uBean.register_time }</span></li>
            <li><img src="${pageContext.request.contextPath}/image/location.png" > <span >${uBean.province }-${uBean.city }</span></li>
            </ul>
              </div>
        	<!--博文分类-->
        	<div id="introduce_left_classify">
              	<span>█ 博文分类</span>
                <ul>
                	<li><a href="javascript:;" onclick="taHome()">全部博文(${countArticle})</a></li><br>
                    <li><a href="javascript:;" onclick="taPub(1)">默认分类(${countMArticle})</a></li><br>
                    <li><a href="javascript:;" onclick="taPub(2)">个人心情(${countGArticle})</a></li><br>
                    <li><a href="javascript:;" onclick="taPub(3)">杂乱无章(${countZArticle})</a></li><br>
                    <li><a href="javascript:;" onclick="taPub(4)">休闲 & 娱乐(${countXArticle})</a></li><br>
                    <li><a href="javascript:;" onclick="taPub(5)">游戏 & 漫画(${countYArticle})</a></li><br>
                    <li><a href="javascript:;" onclick="taPub(6)">旅游 & 摄影(${countLArticle})</a></li><br>
                  	<li><a href="javascript:;" onclick="taPub(7)">时尚 & 美食(${countSArticle})</a></li><br>
                  	<li><a href="javascript:;" onclick="taPub(8)">校园 & 青春(${countQArticle})</a></li><br>
                  	<li><a href="javascript:;" onclick="taPub(9)">媒体 & 科技(${countKArticle})</a></li><br>
                  	<li><a href="javascript:;" onclick="taPub(0)">体育 & 健康(${countTArticle})</a></li><br>
                </ul>
        	</div>
        	<input type="hidden" id="hid" value="${uBean.id}" />
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
                	<li><a href="javascript:;" onclick="taPubT(2019)">2019年(${y2019})</a></li><br>
                    <li><a href="javascript:;" onclick="taPubT(2018)">2018年(${y2018})</a></li><br>
                    <li><a href="javascript:;" onclick="taPubT(0)">第一条博文</a></li><br>
                </ul>
                <input type="hidden" id="y2018" value="${y2018}" /> 
	        	<input type="hidden" id="y2019" value="${y2019}" /> 
	        	<input type="hidden" id="y2020" value="${y2020}" /> 
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
<%	}else{
		//id不存在
		response.sendRedirect(request.getContextPath()+"/jsp/error/error.jsp");
}%>