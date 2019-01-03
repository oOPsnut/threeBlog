<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="toTop" content="true">
<title>上传/修改图片</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/homepage.css" type="text/css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/personalcenter.css" type="text/css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/calendar.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/tinyImgUpload.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-rebox.css"/>
<link href="${pageContext.request.contextPath}/css/owl.carousel.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/owl.carousel.js"></script>
<script src="${pageContext.request.contextPath}/js/tinyImgUpload.js"></script> 

<script type="text/javascript" src="${pageContext.request.contextPath}/js/city.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-rebox.js"></script>

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
        <!--个人资料-->
        <div id="introduce_all">
        	<!--上传/删除照片-->
        	<div id="personalcenter_UDpic">
            	<h3 id="changeinfo_head">█ 上传照片</h3>
               	<div id="upload_pic">
                	<div id="upload_input">
                    	<input type="submit" value="立即上传" id="upload_now">
                        <span>Tips : 支持上传jpg/png/jpeg格式。</span>
                    </div>
                    <div id="upload_content">
                    	<div id="upload"> </div>
                    </div>
                    <script>
					var options = {
						path: '/',
						onSuccess: function (res) {
							console.log(res);
						},
						onFailure: function (res) {
							console.log(res);
						}
					}
					
					var upload = tinyImgUpload('#upload', options);
					document.getElementsByClassName('submit')[0].onclick = function (e) {
						upload();
					}
					</script> 
                </div>
                
                
            </div>
            <div id="personalcenter_UDpic">
                <h3 id="changeinfo_head">█ 删除照片</h3>
                <div id="delete_pic">
                	<ul>
                    	<li>
                            <div class="delete_pic_n" style="background:url(image/2.jpg) no-repeat center;">
							<button onClick="return confirm('您确定要删除?');">删 除</button>
                            </div>
                        </li>
                        <li>
                            <div class="delete_pic_n" style="background:url(image/1.jpg) no-repeat center;">
							<button onClick="return confirm('您确定要删除?');">删 除</button>
                            </div>
                        </li>
                        <li>
                            <div class="delete_pic_n" style="background:url(image/3.jpg) no-repeat center;">
							<button onClick="return confirm('您确定要删除?');">删 除</button>
                            </div>
                        </li>
                        <li>
                            <div class="delete_pic_n" style="background:url(image/pic2.jpg) no-repeat center;">
							<button onClick="return confirm('您确定要删除?');">删 除</button>
                            </div>
                        </li>
                        <li>
                            <div class="delete_pic_n" style="background:url(image/pic4.jpg) no-repeat center;">
							<button onClick="return confirm('您确定要删除?');">删 除</button>
                            </div>
                        </li>
                        <li>
                            <div class="delete_pic_n" style="background:url(image/pic3.jpg) no-repeat center;">
							<button onClick="return confirm('您确定要删除?');">删 除</button>
                            </div>
                        </li>
                    </ul>
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
