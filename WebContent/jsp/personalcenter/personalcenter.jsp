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
            	<li><a href="javascript:;"><span>我的主页</span></a></li>
                <li><a href="javascript:;"><span>我的收藏</span></a></li>
                <li><a href="${pageContext.request.contextPath}/RedirectServlet?method=PablumUI"><span>我的相册</span></a></li>
                <li><a href="${pageContext.request.contextPath}/RedirectServlet?method=PreportCenterUI"><span>举报中心</span></a></li>
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
        	<div id="introduce_left_info">					
        	<ul>
            <li><img src="${pageContext.request.contextPath}/image/sex.png"><span>${userBean.sex }</span></li>
            <li><img src="${pageContext.request.contextPath}/image/years_old.png" ><span >${userBean.age }</span></li>
            <li><img src="${pageContext.request.contextPath}/image/register_time.png" ><span >${userBean.register_time }</span></li>
            <li><img src="${pageContext.request.contextPath}/image/location.png" > <span >${userBean.province }${userBean.city }</span></li>
            </ul>
              </div>
             <div id="info_edit" align="center">
              <a href="${pageContext.request.contextPath}/RedirectServlet?method=PchangeInfoUI">
              <span>编辑个人资料 &gt;</span></a>
              </div>
        	<!--博文分类-->
        	<div id="introduce_left_classify">
              	<span>█ 博文分类</span><a href="javascript:void(0);" id="navmanage" onclick="navmanage();">分类管理</a>
                <ul>
                	<li><a href="#">全部博文(4)</a></li><br>
                    <li><a href="#">默认分类(2)</a></li><br>
                    <li><a href="#">草稿(2)</a></li><br>
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
                    <span><a href="#">删除</a></span>
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
                    <img src="${pageContext.request.contextPath}/image/pic3.jpg">
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
                    <span><a href="#">删除</a></span>
                    <div class="r_articles_top_l">
                    	<span>作者 : </span><a href="#">oopx</a>
                        <span>2018-10-02 18:41</span>
                        <span>分类 ： </span><a href="#">默认分类</a>
                        <span>标签 ： </span><a href="#">父母</a>
                    </div>
                </div>
                <!--文章middle-->
                <div class="r_articles_middle">
                	<div align="center">
                    <img src="${pageContext.request.contextPath}/image/pic3.jpg">
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
                    <span><a href="#">删除</a></span>
                    <div class="r_articles_top_l">
                    	<span>作者 : </span><a href="#">oopx</a>
                        <span>2018-10-02 18:41</span>
                        <span>分类 ： </span><a href="#">默认分类</a>
                        <span>标签 ： </span><a href="#">父母</a>
                    </div>
                </div>
                <!--文章middle-->
                <div class="r_articles_middle">
                	<div align="center">
                    <img src="${pageContext.request.contextPath}/image/pic3.jpg">
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
                    <span><a href="#">删除</a></span>
                    <div class="r_articles_top_l">
                    	<span>作者 : </span><a href="#">oopx</a>
                        <span>2018-10-02 18:41</span>
                        <span>分类 ： </span><a href="#">默认分类</a>
                        <span>标签 ： </span><a href="#">父母</a>
                    </div>
                </div>
                <!--文章middle-->
                <div class="r_articles_middle">
                	<div align="center">
                    <img src="${pageContext.request.contextPath}/image/pic3.jpg">
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
                    <span><a href="#">删除</a></span>
                    <div class="r_articles_top_l">
                    	<span>作者 : </span><a href="#">oopx</a>
                        <span>2018-10-02 18:41</span>
                        <span>分类 ： </span><a href="#">默认分类</a>
                        <span>标签 ： </span><a href="#">父母</a>
                    </div>
                </div>
                <!--文章middle-->
                <div class="r_articles_middle">
                	<div align="center">
                    <img src="${pageContext.request.contextPath}/image/pic3.jpg">
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
                    <span><a href="#">删除</a></span>
                    <div class="r_articles_top_l">
                    	<span>作者 : </span><a href="#">oopx</a>
                        <span>2018-10-02 18:41</span>
                        <span>分类 ： </span><a href="#">默认分类</a>
                        <span>标签 ： </span><a href="#">父母</a>
                    </div>
                </div>
                <!--文章middle-->
                <div class="r_articles_middle">
                	<div align="center">
                    <img src="${pageContext.request.contextPath}/image/pic3.jpg">
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
