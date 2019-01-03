<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="toTop" content="true">
<title>评论举报</title>
<link rel="stylesheet" href="css/homepage.css" type="text/css"/>
<link type="text/css" rel="stylesheet" href="css/report.css">
<link rel="stylesheet" href="css/messagecenter.css" type="text/css">
<link rel="stylesheet" href="css/personalcenter.css" type="text/css"/>
<link rel="stylesheet" href="css/calendar.css">

<link href="css/owl.carousel.css" rel="stylesheet">
<script src="js/class.js"></script>
<script src="js/MsgBox.js"></script>
<script src="js/jquery-1.min.js"></script>
<script src="js/owl.carousel.js"></script>
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
        <div id="report_all">
           	<h3>█ 举报</h3>
            <form>
            <div id="report_article">
            	<!--举报博文up-->
            	<div id="report_a_up">
                	<span>您要举报的是 </span>&ensp;
        			<a href="#"><u> jerry</u></a>
        			&ensp;<span>发表的</span>&ensp;
        			<a href="#"><u>《我们都是时间的旅行者》</u></a>
                    <span>中</span>&ensp;
                    <a href="#"><u>tom</u></a>
                    &ensp;<span>发表的评论</span>
        			&ensp;,&ensp;<span>其摘要如下</span>：&ensp;<br/><br/>
        			<textarea>她们，是这些年，我收到过的最好的礼物</textarea>
                </div>
                <!--举报博文middle-->
            	<div id="report_a_middle">
                	<span>选择举报类型（必选）：</span>
                    <br/><br/>
        			<input class="middle_report_class" type="radio" name="radio" onclick="check(this.value)" value="色情">色情&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                    <input type="radio" name="radio" onclick="check(this.value)" value="广告" class="middle_report_class">广告
                    <br/><br/>
                    <input type="radio" name="radio" onclick="check(this.value)" value="虚假信息" class="middle_report_class">虚假信息&emsp;&emsp;&emsp;&emsp;
                    <input type="radio" name="radio" onclick="check(this.value)" value="违反社会主义核心价值观" class="middle_report_class">违反社会主义核心价值观
                    <br/><br/>
                    <input type="radio" name="radio" onclick="check(this.value)" value="其他（请在括号内填写）" class="middle_report_class">其他
                    <br/><br/>
                   <span> 您的选择是：</span>
                   <input type="text" id="answer" size="50" placeholder="若选择其他，请直接在此填写">
                   <!--举报类型选择js-->
				   <script type="text/javascript">
                        function check(browser){
                            document.getElementById("answer").value=browser
                            }
                    </script>
                </div>
                <!--举报博文down-->
                <div id="report_a_down">
                	<span>填写详细违规说明：</span>
                    <br/><br/>
        			<textarea placeholder="详细违规理由"></textarea>
                </div>
                <div id="report_a_click" align="center">
                
        		<input type="reset" value="取消" id="click_reset"/>
                <input type="submit" value="提交" id="click_submit"/>
        		</div>
            </div>
            </form>
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
