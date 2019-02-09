<%@page import="com.threeblog.domain.AblumBean"%>
<%@page import="java.util.List"%>
<%@page import="com.threeblog.serviceImpl.UserServiceImpl"%>
<%@page import="com.threeblog.service.UserService"%>
<%@page import="com.threeblog.domain.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
			UserBean userBean = (UserBean)request.getSession().getAttribute("userBean");
			String uid = userBean.getId();
			UserService uService = new UserServiceImpl();
			int countReviews =  Integer.valueOf( uService.countReviews(uid).toString());//评论消息数
			int countFollows =  Integer.valueOf( uService.countFollows(uid).toString());//关注消息数
			int countCollects =  Integer.valueOf( uService.countCollects(uid).toString());//收藏消息数
			int countZans =  Integer.valueOf( uService.countZans(uid).toString());//点赞消息数
			int countAll=countReviews+countFollows+countCollects+countZans;//消息总数
			request.setAttribute("countAll", countAll);
			request.setAttribute("countReviews", countReviews);
    		request.setAttribute("countFollows", countFollows);
    		request.setAttribute("countCollects", countCollects);
    		request.setAttribute("countZans", countZans);
%>
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
            	<li><a href="${pageContext.request.contextPath}/RedirectServlet?method=personalCenterUI"><span>我的主页</span></a></li>
                <li><a href="${pageContext.request.contextPath}/RedirectServlet?method=personalCenterUI"><span>我的收藏</span></a></li>
                <li><a href="${pageContext.request.contextPath}/RedirectServlet?method=PablumUI"><span>我的相册</span></a></li>
                <li><a href="${pageContext.request.contextPath}/RedirectServlet?method=PreportCenterUI"><span>举报中心</span></a></li>
            </ul>
        </div>
        <!--个人资料-->
        <div id="introduce_all">
        	<!--上传/删除照片-->
        	<div id="personalcenter_UDpic">
            	<h3 id="changeinfo_head">█ 上传照片</h3>
               	<div id="upload_pic">
                	<div id="upload_input">
                    	<input type="submit" value="立即上传" id="upload_now" class="submit">
                        <span>Tips : 支持上传jpg/png/jpeg格式。</span>
                    </div>
                    <div id="upload_content">
                    	<div id="upload"> </div>
                    </div>
                    <script>
					var options = {
						path: '${pageContext.request.contextPath}/AblumServlet?method=uploadPhotos',
						onSuccess: function (res) {
							console.log(res);
							if (res==0) {
								alert("你还未添加任何图片！");
							}else if(res==1){
								var result =confirm("上传成功！确定:回到相册;取消:继续上传");
								if (result) {
									window.location.href='${pageContext.request.contextPath}/RedirectServlet?method=PablumUI'; 
								} else {
									window.location.reload();
								}
							}else if (res==-1) {
								alert("出错，请稍后再试...");
							}
							
						},
						onFailure: function (res) {
							console.log(res);
							alert("出错，请稍后再试...");
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
                	<%
		        		//UserBean userBean=(UserBean)request.getSession().getAttribute("userBean");
		        		//String uid = userBean.getId();//获取用户id
		        		//UserService uService=new UserServiceImpl();
		        		List<AblumBean> photos = uService.findUserPhotosByUid(uid);
		        		if(photos.isEmpty()){		        			
		        	%>
		        		<li style="width: 100%;">
                            <div align="center">
		                      	<p><strong>未上传过照片</strong></p>
		                      </div>
                        </li>	        	  	        	
		        	<%		
		        			
		        		}else{
							for(int i=0;i<photos.size();i++){
		        				AblumBean photo=photos.get(i);//拿到每张图片信息
		        				request.setAttribute("photo", photo);
		        	%>
		        		<c:if test="${photo.status=='正常'}">
                    	<li>
                            <div class="delete_pic_n" style="background:url(${photo.photo}) no-repeat center;">
								<a href="javascript:;" onclick="deletePhoto('${photo.id}')">删除</a>
                            </div>
                            <script type="text/javascript">
                            	function deletePhoto(id) {
                            		var pid=id;//照片id
        							var s = confirm("你确定要删除此照片吗？");
        							if (s) {
        								$.ajax({
        									type:"POST",//用post方式传输
        									dataType:"json",//数据格式:JSON
        									url:"/ThreeBlog_V1.0/AblumServlet?method=DeletePhoto" ,//目标地址
        									data:{"id":pid},
        									error:function(){
        										alert("出错！请稍后再试...");
        									},
        									success:function(data){
        										if (data) {
        											alert("删除成功！");
        											window.location.reload();
        										} else {
        											alert("删除失败，本照片可能处于屏蔽或非正常状态！");		
        											window.location.reload();
        										}
        									}
        								});
        							}
								}
                            </script>
                        </li>
                        </c:if>
                        <%}} %>
                    </ul>
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
