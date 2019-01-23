<%@page import="com.threeblog.domain.*"%>
<%@page import="com.threeblog.serviceImpl.*"%>
<%@page import="com.threeblog.service.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%   	
    	//作者是指此个人中心的用户
 		//从地址栏获取作者id
		String uid =  request.getQueryString().substring(3);
    	UserService uService = new UserServiceImpl();
    	UserBean uBean = uService.findUserInfo(uid);//找出作者的信息
    	request.setAttribute("uBean", uBean);
    	UserBean userBean = (UserBean)request.getSession().getAttribute("userBean");
    	if(userBean!=null){
    		String id =  userBean.getId();//登录用户id
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
    	
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="toTop" content="true">
<title>${uBean.username}的主页</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/homepage.css" type="text/css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/personalcenter.css" type="text/css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/calendar.css">

<link href="${pageContext.request.contextPath}/css/owl.carousel.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/class.js"></script>
<script src="${pageContext.request.contextPath}/js/MsgBox.js"></script>
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
          	<img src="${uBean.head }">	
            </div>			   			
            <div id="head_name" align="center">
            	<span>${uBean.username}</span>		 				
            </div>
            
            <div id="head_introduce_o" align="center">
              
              	<span><strong>个人简介:</strong></span><br>
                <span>▷${uBean.introduction}</span>
            </div>
            <div id="head_follow_o" align="center">
	            <c:if test="${empty userBean }">
	            	<a href="javascript:;" onclick="clickfollow()"><img title="关注" src="${pageContext.request.contextPath}/image/canfollow.png" ></a>
	            </c:if>
	            <c:if test="${not empty userBean }">
	            	<c:choose>
	            		<c:if test="${not empty eachf}">
	            			<a href="javascript:;" onclick="cancelfollow()"><img title="取消关注" src="${pageContext.request.contextPath}image/cancelfollow.png" ></a>
            				<a href="javascript:;"><img title="相互关注" src="${pageContext.request.contextPath}image/followtogether.png" ></a>
	            		</c:if>
	            		<c:if test="${not empty ufa}">
	            			<a href="javascript:;" onclick="cancelfollow()"><img title="取消关注" src="${pageContext.request.contextPath}image/cancelfollow.png" ></a>
             				<a href="javascript:;"><img title="我关注了Ta" src="${pageContext.request.contextPath}image/follow.png" ></a>
	            		</c:if>
	            		<c:if test="${not empty afu}">
	            			<a href="javascript:;" onclick="follow()"><img title="关注" src="${pageContext.request.contextPath}/image/canfollow.png" ></a>
             				<a href="javascript:;"><img title="Ta关注了我" src="${pageContext.request.contextPath}image/Tafollow.png" ></a>
	            		</c:if>
	            		<c:if test="${not empty notf}">
	            			<a href="javascript:;" onclick="follow()"><img title="关注" src="${pageContext.request.contextPath}/image/canfollow.png" ></a>            				
	            		</c:if>
	            	</c:choose>	            	
	            </c:if>	            
            	<script type="text/javascript">
            		function follow(){
            			var id = "${userBean.id}";//用户id
            			var username="${userBean.username}";//用户名
            			var author_id="${uBean.id}";//获取作者id
            			var author_name="${uBean.username}";//获取作者名
            			alert(uid+"+"+author_id+"+"+username+"+"+author_name);
            			$.ajax({
            				type:"POST",//用post方式传输
            				dataType:"json",//数据格式:JSON
            				url:"/ThreeBlog_V1.0/UserServlet?method=addFollow" ,//目标地址
            				data:{
            					"following_id":id,
            					"follower_id":author_id,
            					"text1":author_name,
            					"text2":username
            				},
            				error:function(){
            					alert("出错！");
            				},
            				success:function(data){
            					if(data){
            						alert("关注成功！");          					
            					}else{
            						alert("关注失败！");
            					}
            				}
            			});
					}
            		
            		function cancelfollow() {
            			var id = "${userBean.id}";//用户id
            			var author_id="${uBean.id}";//作者id
            			alert(uid+"+"+author_id);
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
            					}else{
            						alert("取消关注失败！");
            					}
            				}
            			});
					}
            	</script>
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
        <!--介绍栏左侧-->
        <div id="introduce_all">
        <!--统计-->
        <div id="introduce_left">
        	<div id="introduce_left_total">
            	
            	<table>
                	<tr>
                    	<td class="total_td">
                        <a href="#">
                        <span>博文</span>
                        <strong >56</strong>
                        </a>
                        </td>
                        <td class="total_td" id="total_td">
                        <a href="#">
                        <span>关注</span>
                        <strong>152</strong>
                        </a>
                        </td>
                        <td class="total_td">
                        <a href="#">
                        <span>粉丝</span>
                        <strong>45625</strong>
                        </a>
                        </td>
                    </tr>
                </table>  
            </div>
        	<!--个人信息-->
        	<div id="introduce_left_info_other">					
        	<ul>
            <li><img src="image/sex.png"><span>男</span></li>
            <li><img src="image/years_old.png" ><span >20</span></li>
            <li><img src="image/register_time.png" ><span >2018-05-18</span></li>
            <li><img src="image/location.png" > <span >广东省韶关市</span></li>
            </ul>
              </div>
        	<!--博文分类-->
        	<div id="introduce_left_classify">
              	<span>█ 博文分类</span>
                <ul>
                	<li><a href="#">全部博文(4)</a></li><br>
                    <li><a href="#">默认分类(2)</a></li><br>
                    <li><a href="#">游戏(2)</a></li><br>
                </ul>
        	</div>
            <!--日期归档-->
        	<div id="introduce_left_years">
              	<h4>█ 日期归档</h4>
                <ul>
                	<li><a href="#">最近(4)</a></li><br>
                    <li><a href="#">2018年(2)</a></li><br>
                    <li><a href="#">2017年(2)</a></li><br>
                    <li><a href="#">第一条博文</a></li><br>
                </ul>
        	</div>
        </div>
        <!--介绍栏右侧-->
        <div id="introduce_right">
        	<div class="introduce_right_articles">
            	<!--文章up-->
            	<div class="r_articles_top">
                	<a href="#"><span>闹心的孩子千遍一律，智慧的父母万里挑一</span></a> 
                    <div class="r_articles_top_l">
                    	<span>作者 : </span><a href="#">oopx</a>
                        <span>2018-10-02 18:41</span>
                        <span>分类 ： </span><a href="#">默认分类</a>
                        <span>标签 ： </span><a href="#">&lt;父母&gt;</a>
                    </div>
                </div>
                <!--文章middle-->
                <div class="r_articles_middle">
                	<div align="center">
                    <img src="image/pic3.jpg">
                    </div>
                    <div id="r_articles_middle_w" align="center">
                    <p>我小时候在农村长大，村里的娱乐活动不多，大人们盘腿坐在炕上打麻将，我就坐小板凳上写作业，成绩基本稳定在全校前十。全村都夸我爹妈运气好，白捡了个好孩子。后来我家有了二胎，妹妹学习不太好，大家担心她考本科都悬，我妈仍然一意孤行地执行“放养”策略。结果我妹一路逆袭，现在模拟考试的名次已经在考入985/211水平。

每次我妈向别人夸耀，说自己特别会带孩子，我内心就吐槽，你会啥啊，就会打麻将吧。后来慢慢读了一些养育孩子的书，发现我妈“农村妇女”身份的背后，其实是一个教育孩子的高手。</p>
                    </div>
                </div>
                <!--文章down-->
                <div class="r_articles_down" align="center">
                	<table>
                    	<tr>
                        	<td><strong>阅读 ：</strong> <span>70</span></td>
                            <td><strong>评论 ：</strong> <span>70</span></td>
                            <td><strong>收藏 ： </strong><span>70</span></td>
                            <td id="down_td"><strong>喜欢 ： </strong><span>70</span></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="introduce_right_articles">
            	<!--文章up-->
            	<div class="r_articles_top">
                	<a href="#"><span>闹心的孩子千遍一律，智慧的父母万里挑一</span></a> 
                    <div class="r_articles_top_l">
                    	<span>作者 : </span><a href="#">oopx</a>
                        <span>2018-10-02 18:41</span>
                        <span>分类 ： </span><a href="#">默认分类</a>
                        <span>标签 ： </span><a href="#">&lt;父母&gt;</a>
                    </div>
                </div>
                <!--文章middle-->
                <div class="r_articles_middle">
                	<div align="center">
                    <img src="image/pic3.jpg">
                    </div>
                    <div id="r_articles_middle_w" align="center">
                    <p>我小时候在农村长大，村里的娱乐活动不多，大人们盘腿坐在炕上打麻将，我就坐小板凳上写作业，成绩基本稳定在全校前十。全村都夸我爹妈运气好，白捡了个好孩子。后来我家有了二胎，妹妹学习不太好，大家担心她考本科都悬，我妈仍然一意孤行地执行“放养”策略。结果我妹一路逆袭，现在模拟考试的名次已经在考入985/211水平。

每次我妈向别人夸耀，说自己特别会带孩子，我内心就吐槽，你会啥啊，就会打麻将吧。后来慢慢读了一些养育孩子的书，发现我妈“农村妇女”身份的背后，其实是一个教育孩子的高手。</p>
                    </div>
                </div>
                <!--文章down-->
                <div class="r_articles_down" align="center">
                	<table>
                    	<tr>
                        	<td><strong>阅读 ：</strong> <span>70</span></td>
                            <td><strong>评论 ：</strong> <span>70</span></td>
                            <td><strong>收藏 ： </strong><span>70</span></td>
                            <td id="down_td"><strong>喜欢 ： </strong><span>70</span></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="introduce_right_articles">
            	<!--文章up-->
            	<div class="r_articles_top">
                	<a href="#"><span>闹心的孩子千遍一律，智慧的父母万里挑一</span></a> 
                    <div class="r_articles_top_l">
                    	<span>作者 : </span><a href="#">oopx</a>
                        <span>2018-10-02 18:41</span>
                        <span>分类 ： </span><a href="#">默认分类</a>
                        <span>标签 ： </span><a href="#">&lt;父母&gt;</a>
                    </div>
                </div>
                <!--文章middle-->
                <div class="r_articles_middle">
                	<div align="center">
                    <img src="image/pic3.jpg">
                    </div>
                    <div id="r_articles_middle_w" align="center">
                    <p>我小时候在农村长大，村里的娱乐活动不多，大人们盘腿坐在炕上打麻将，我就坐小板凳上写作业，成绩基本稳定在全校前十。全村都夸我爹妈运气好，白捡了个好孩子。后来我家有了二胎，妹妹学习不太好，大家担心她考本科都悬，我妈仍然一意孤行地执行“放养”策略。结果我妹一路逆袭，现在模拟考试的名次已经在考入985/211水平。

每次我妈向别人夸耀，说自己特别会带孩子，我内心就吐槽，你会啥啊，就会打麻将吧。后来慢慢读了一些养育孩子的书，发现我妈“农村妇女”身份的背后，其实是一个教育孩子的高手。</p>
                    </div>
                </div>
                <!--文章down-->
                <div class="r_articles_down" align="center">
                	<table>
                    	<tr>
                        	<td><strong>阅读 ：</strong> <span>70</span></td>
                            <td><strong>评论 ：</strong> <span>70</span></td>
                            <td><strong>收藏 ： </strong><span>70</span></td>
                            <td id="down_td"><strong>喜欢 ： </strong><span>70</span></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="introduce_right_articles">
            	<!--文章up-->
            	<div class="r_articles_top">
                	<a href="#"><span>闹心的孩子千遍一律，智慧的父母万里挑一</span></a> 
                    <div class="r_articles_top_l">
                    	<span>作者 : </span><a href="#">oopx</a>
                        <span>2018-10-02 18:41</span>
                        <span>分类 ： </span><a href="#">默认分类</a>
                        <span>标签 ： </span><a href="#">&lt;父母&gt;</a>
                    </div>
                </div>
                <!--文章middle-->
                <div class="r_articles_middle">
                	<div align="center">
                    <img src="image/pic3.jpg">
                    </div>
                    <div id="r_articles_middle_w" align="center">
                    <p>我小时候在农村长大，村里的娱乐活动不多，大人们盘腿坐在炕上打麻将，我就坐小板凳上写作业，成绩基本稳定在全校前十。全村都夸我爹妈运气好，白捡了个好孩子。后来我家有了二胎，妹妹学习不太好，大家担心她考本科都悬，我妈仍然一意孤行地执行“放养”策略。结果我妹一路逆袭，现在模拟考试的名次已经在考入985/211水平。

每次我妈向别人夸耀，说自己特别会带孩子，我内心就吐槽，你会啥啊，就会打麻将吧。后来慢慢读了一些养育孩子的书，发现我妈“农村妇女”身份的背后，其实是一个教育孩子的高手。</p>
                    </div>
                </div>
                <!--文章down-->
                <div class="r_articles_down" align="center">
                	<table>
                    	<tr>
                        	<td><strong>阅读 ：</strong> <span>70</span></td>
                            <td><strong>评论 ：</strong> <span>70</span></td>
                            <td><strong>收藏 ： </strong><span>70</span></td>
                            <td id="down_td"><strong>喜欢 ： </strong><span>70</span></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="introduce_right_articles">
            	<!--文章up-->
            	<div class="r_articles_top">
                	<a href="#"><span>闹心的孩子千遍一律，智慧的父母万里挑一</span></a> 
                    <div class="r_articles_top_l">
                    	<span>作者 : </span><a href="#">oopx</a>
                        <span>2018-10-02 18:41</span>
                        <span>分类 ： </span><a href="#">默认分类</a>
                        <span>标签 ： </span><a href="#">&lt;父母&gt;</a>
                    </div>
                </div>
                <!--文章middle-->
                <div class="r_articles_middle">
                	<div align="center">
                    <img src="image/pic3.jpg">
                    </div>
                    <div id="r_articles_middle_w" align="center">
                    <p>我小时候在农村长大，村里的娱乐活动不多，大人们盘腿坐在炕上打麻将，我就坐小板凳上写作业，成绩基本稳定在全校前十。全村都夸我爹妈运气好，白捡了个好孩子。后来我家有了二胎，妹妹学习不太好，大家担心她考本科都悬，我妈仍然一意孤行地执行“放养”策略。结果我妹一路逆袭，现在模拟考试的名次已经在考入985/211水平。

每次我妈向别人夸耀，说自己特别会带孩子，我内心就吐槽，你会啥啊，就会打麻将吧。后来慢慢读了一些养育孩子的书，发现我妈“农村妇女”身份的背后，其实是一个教育孩子的高手。</p>
                    </div>
                </div>
                <!--文章down-->
                <div class="r_articles_down" align="center">
                	<table>
                    	<tr>
                        	<td><strong>阅读 ：</strong> <span>70</span></td>
                            <td><strong>评论 ：</strong> <span>70</span></td>
                            <td><strong>收藏 ： </strong><span>70</span></td>
                            <td id="down_td"><strong>喜欢 ： </strong><span>70</span></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="introduce_right_articles">
            	<!--文章up-->
            	<div class="r_articles_top">
                	<a href="#"><span>闹心的孩子千遍一律，智慧的父母万里挑一</span></a> 
                    <div class="r_articles_top_l">
                    	<span>作者 : </span><a href="#">oopx</a>
                        <span>2018-10-02 18:41</span>
                        <span>分类 ： </span><a href="#">默认分类</a>
                        <span>标签 ： </span><a href="#">&lt;父母&gt;</a>
                    </div>
                </div>
                <!--文章middle-->
                <div class="r_articles_middle">
                	<div align="center">
                    <img src="image/pic3.jpg">
                    </div>
                    <div id="r_articles_middle_w" align="center">
                    <p>我小时候在农村长大，村里的娱乐活动不多，大人们盘腿坐在炕上打麻将，我就坐小板凳上写作业，成绩基本稳定在全校前十。全村都夸我爹妈运气好，白捡了个好孩子。后来我家有了二胎，妹妹学习不太好，大家担心她考本科都悬，我妈仍然一意孤行地执行“放养”策略。结果我妹一路逆袭，现在模拟考试的名次已经在考入985/211水平。

每次我妈向别人夸耀，说自己特别会带孩子，我内心就吐槽，你会啥啊，就会打麻将吧。后来慢慢读了一些养育孩子的书，发现我妈“农村妇女”身份的背后，其实是一个教育孩子的高手。</p>
                    </div>
                </div>
                <!--文章down-->
                <div class="r_articles_down" align="center">
                	<table>
                    	<tr>
                        	<td><strong>阅读 ：</strong> <span>70</span></td>
                            <td><strong>评论 ：</strong> <span>70</span></td>
                            <td><strong>收藏 ： </strong><span>70</span></td>
                            <td id="down_td"><strong>喜欢 ： </strong><span>70</span></td>
                        </tr>
                    </table>
                </div>
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
