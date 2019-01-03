<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="toTop" content="true">
<title>个人中心</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/homepage.css" type="text/css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/personalcenter.css" type="text/css"/>
<link rel="stylesheet" href="css/calendar.css">

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
        <div id="introduce_all">
           <div id="personalcenter_reportcenter">
        		<!--列表up-->
            	<div class="reportcenter_top">
                	<a href="#"><span>我的举报</span></a>
                    <span id="reportcenter_top_span">|</span>
                   	<a href="#"><span>我的违规</span></a>
                </div>
                <!--列表down-->
                <div class="reportcenter_down">
                	<table border="1" id="down_report">
                        <tr>
                        <th width="15%">被举报人</th>
                        <th width="45%">被举报内容与说明</th>
                        <th width="20%">举报类型</th>
                        <th width="20%">处理状态</th>
                        </tr>
                        <tr>
                            <td>jerry</td>
                            <td>被举报博文：“我们是时间的旅行者”；详细理由：这个人开挂</td>
                            <td>其他</td>
                            <td>博文已删除</td>
                        </tr>
                        <tr>
                            <td>用户007</td>
                            <td>被举报评论:“丢”；详细理由：</td>
                            <td>违反社会主义核心价值观</td>
                            <td>等待处理</td>
                        </tr>
                        <tr>
                            <td>shui</td>
                            <td>被举报评论:“丢”；详细理由：</td>
                            <td>违反社会主义核心价值观</td>
                            <td>等待处理</td>
                        </tr>
                        <tr>
                            <td>456</td>
                            <td>被举报评论:“haha”；详细理由：</td>
                            <td>违反社会主义核心价值观</td>
                            <td>等待处理</td>
                        </tr>
                    </table>
                    
                    <table id="down_illegal" border="1">
                    <tr>
                        <th width="55%">违规通知</th>
                        <th width="25%">通知时间</th>
                        <th width="30%">处理</th>
                    </tr>
                    <tr>
                        <td>你在博文“···”下的评论因涉嫌违规，已被删除</td>
                        <td>2018-05-15</td>
                        <td>
                        	<input type="button" value="确定"/>
                            <a href="feedback_reviews.html">反馈</a></td>
                    </tr>
                    <tr>
                    <td>你的博文“···”因涉嫌违规，已被删除</td>
                    <td>2018-05-30</td>
                    <td>
                    	<input type="button" value="确定" />
                    	<a href="feedback_article.html">反馈</a></td>
                    </tr>
                    <tr>
                    <td>你多次涉嫌违规，账号已被锁定，限制时间：<span>2018-05-30到2019-05-01</span></td>
                    <td>2018-06-01</td>
                    <td><input type="button" value="确定" /><a href="feedback_user.html">反馈</a></td>
                    </tr>
                    <tr>
                    <td>你的博文“···”因涉嫌违规，已被删除</td>
                    <td>2018-04-30</td>
                    <td><span>已确定</span></td>
                    </tr>
                    <tr>
                    <td>你的博文“···”因涉嫌违规，已被删除</td>
                    <td>2018-03-03</td>
                    <td><span>反馈等待审核</span></td>
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
