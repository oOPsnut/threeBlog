<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>博文</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/homepage.css" type="text/css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/blog.css" type="text/css"/>
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
<!--内容栏begin-->
<div id="index_all">
    <!--右侧栏begin-->
    <div id="index_body_right">
    	<!--写作入口-->
    	<div id="index_body_enter">
        	<div id="index_body_enter_write" >
            	<a href="#"><img src="image/write.png">
                <div id="enter_writer_w">
                	<span id="enter_writer_span1">写博文</span>&emsp;
                    <span id="enter_writer_span2">|&emsp;记录你生活的剪影</span>
                </div>
                </a>
            </div>
            <div id="index_body_enter_guideboard" >
            	<h3 >█ 指路牌</h3>
                <a href="#"><span >博客文章欣赏</span></a><br/><br/>
                <a href="#"><span>博客图片画廊</span></a><br /><br/>
                <a href="#"><span>博客举报中心入口</span></a>
            </div>
        </div>
        <!--介绍-->
        <div id="index_body_total">
        	<h2>记录生活，分享快乐。</h2>
            <span class="body_total_span_e">Life is short,</span><br/>
            <span class="body_total_span_e">have some pride.</span><br/><br/>
            <span class="body_total_span_c">已经有xxx位朋友</span><br/>
             <span class="body_total_span_c">在这里</span><br/>
              <span class="body_total_span_c">留下他们生活的剪影</span>
    	</div>
        <!--公告-->
        <div id="index_body_notice">
        	<h3 >█ 公告</h3>
            <div id="body_notice_w">
            <span>【2018.07.21 公告】</span><br/><br/>
            <span><strong>新封号用户:</strong>张三、李四、王五......</span><br/><br/>
            <span><strong>简要原因:</strong>违反社会主义核心价值观，违反隐私条例，传播虚假信息，打广告</span><br><br/>
            <span><strong>本次封号期限:</strong>30天</span><br/><br/>
            <span><strong>以往封号用户:</strong>张三、李四......</span><br/><br/>
            </div>
            <a href="#"><span id="body_notice_detail">本告详情</span></a>
            <img src="image/notice.png">
            <a href="javascript:;"><span id="body_notice_old">以往公告</span></a>
        </div>
        <!--日历-->
        <div id="index_body_calendar">
        	<div id="calendar" class="calendar"></div>
  			<script src="js/calendar.js"></script>
        </div>
        <!--热门标签标签-->
        <div id="index_body_labels">
        	<h3>█ 热门标签</h3>
            <input  type="submit" value="关键词" class="body_labels_input">
            <input  type="submit" value="左岸"  class="body_labels_input">	
            <input  type="submit" value="最爱的，还是这人和烟火"  class="body_labels_input">	
             <input  type="submit" value="圣诞节撒点就扫大街哦啊就是都似的撒旦"  class="body_labels_input">	
        </div>
    </div>
    <!--右侧栏end-->
    <!--左侧栏begin-->
    <div id="index_body_left">  	
    <!--内容begin-->
   <div id="index_body_middle">
    	<div id="index_body_middle_article">
        	<!--具体N篇文章begin-->
        	<div class="article_n">
        		<div class="article_pic">
            		<img  src="image/pic1.png" title="灯塔">
                    <span>陌上行</span><br/>
                    <span>2018-05-18</span>
                </div>
            	<div class="article_details">
                <div id="details_h1">
                	<a href="#" ><h1>最爱的，还是这人和烟火</h1></a>
                    </div>
                    <div id="details_p">	<a>
                    <p>关于孤独，到此为止。
天空很蓝，却很悲伤。 阳光很暖，却很刺眼。 花儿很美，却很碍眼。 世界很好，却不温柔。</p>
					</a>
                    </div><br/>
					<div id="details_click">
						<a href="#" id="details_click_a">查看全文</a>
					</div>
            	</div>
            </div>
           
            <!--文章end-->
            </div>
        </div>
    </div>
    <!--内容end-->
</div>
<!--内容栏end-->
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
