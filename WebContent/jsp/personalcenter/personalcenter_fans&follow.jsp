<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="toTop" content="true">
<title>粉丝和关注</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/homepage.css" type="text/css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/personalcenter.css" type="text/css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/calendar.css">

<link href="${pageContext.request.contextPath}/css/owl.carousel.css" rel="stylesheet">
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
  <div id="index_head_logo"> <img src="image/logo.png"> </div>
  <div id="index_head_menu">
    <ul>
      <li><a href="#" >首页</a></li>
      <li><a href="#" >博文</a></li>
      <li><a href="#" >画廊</a></li>
      <li><a href="#" >我的</a></li>
    </ul>
  </div>
  <div id="index_head_tools"> 
  <ul>
  	<li>
    	<a href="#">
        	<img  src="image/search.png" style="float:left;" />
       	</a> 
    </li>
    <li id="messagepic">
    	<a href="#">
        	<div style="float:left; position:relative;">
    			<img src="image/message.png"/>
                	<span  id="tools_messagenumber">0</span>
             </div>
         </a> 
         <ul class="index_tools_messages">
         	<li><a href="#home">评论消息</a><span   class="index_tools_messagesnumber"style="top:20px;" >0</span></li>
          	<li><a href="#home">关注消息</a><span  class="index_tools_messagesnumber" style="top:80px; ">0</span></li>
            <li><a href="#home">收藏消息</a><span  class="index_tools_messagesnumber" style="top:140px;" >0</span></li>
            <li><a href="#home">点赞消息</a><span  class="index_tools_messagesnumber" style=" top:200px;" >0</span></li>
         </ul>
    </li>
    <li>
    	<a href="#">
        	<img src="image/setting.png"/>
        </a>
        <ul class="index_tools_setting">
            
            <li><a href="#home">&ensp;个人中心&ensp;</a></li>
            <li><a href="#home">&ensp;账号设置&ensp;</a></li>
            <li><a href="#home">&ensp;举报中心&ensp;</a></li>
            <li><a href="#home">&ensp;退出账号&ensp;</a></li>
         </ul>
    </li>
     </ul>
     </div>
  <span style="color:#FFF; font-size:36px;float:left; margin-top:15px;"> |</span>
  <div id="index_head_signin">
    <ul>
      <li><a href="register.html">注册</a></li>
      <li><a href="signin.html">登录</a></li>
    </ul>
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
            
            <div id="head_introduce" align="center">
              
              	<span><strong>个人简介:</strong></span><br>
                <span>▷1984<br>
					  ▷美丽新世界<br>
					  ▷我们
                </span>
            </div>
    	</div>
        <!--导航栏-->
        <div id="personalcenter_lead">
        	<ul>
            	<li><span>我的主页</span></li>
                <li><span>我的收藏</span></li>
                <li><span>我的相册</span></li>
                <li><span>举报中心</span></li>
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
            <li><img src="image/sex.png"><span>男</span></li>
            <li><img src="image/years_old.png" ><span >20</span></li>
            <li><img src="image/register_time.png" ><span >2018-05-18</span></li>
            <li><img src="image/location.png" > <span >广东省韶关市</span></li>
            </ul>
              </div>
             <div id="info_edit" align="center">
              <a href="#">
              <span>编辑个人资料 &gt;</span></a>
              </div>
        	<!--博文分类-->
        	<div id="introduce_left_classify">
              	<h4>█ 博文分类</h4>
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
        	<!--粉丝/关注列表-->
        	<div class="introduce_right_f">
            	<!--列表up-->
            	<div class="r_f_top">
                	<a href="#"><span>全部关注</span></a>
                    <span id="r_f_top_span">|</span>
                   	<a href="#"><span>全部粉丝</span></a>
                </div>
                <!--列表middle-->
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
