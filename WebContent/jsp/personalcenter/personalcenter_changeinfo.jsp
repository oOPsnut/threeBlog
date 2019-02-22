<%@page import="com.threeblog.serviceImpl.UserServiceImpl"%>
<%@page import="com.threeblog.service.UserService"%>
<%@page import="com.threeblog.domain.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
			UserBean userBean = (UserBean)request.getSession().getAttribute("userBean");
			if(userBean!=null){
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
<title>编辑个人资料</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/homepage.css" type="text/css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/personalcenter.css" type="text/css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/calendar.css">

<link href="${pageContext.request.contextPath}/css/owl.carousel.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/owl.carousel.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-rebox.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/city.js"></script>
<script src="${pageContext.request.contextPath}/js/changeInfo.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-rebox.js"></script>
<!--重置表单 -->
<script type="text/javascript">
//重置表单
function resetForm(){
	//重置头像	
	$("#userhead").attr("src","${userBean.head}");
	//重置年龄
	$("#age").val([ "${userBean.age}" ]);
	//重置个人简介
	$("#introduction").val([ "${userBean.introduction}" ]);
	//重置性别
	$("#sex").val([ "${userBean.sex}" ]);
	//重置所在地区
	//$("#province").val([ "${userBean.province}" ]);	
	//$("#city").val([ "${userBean.city}" ]);
	(function(){  

	var pHtmlStr = '';
			for ( var name in pc) {
				if (name == '${userBean.province}') {
					pHtmlStr = pHtmlStr
							+ '<option value="'+name+'" selected="selected">'
							+ name + '</option>';
				} else {
					pHtmlStr = pHtmlStr + '<option value="'+name+'">' + name
							+ '</option>';
				}
			}
			$("#province").html(pHtmlStr);
			$("#province")
					.change(
							function() {
								var pname = $("#province option:selected")
										.text();
								var pHtmlStr = '';
								var cityList = pc[pname];
								for ( var index in cityList) {
									if (cityList[index] == '${userBean.city}') {
										pHtmlStr = pHtmlStr
												+ '<option value="'+cityList[index]+'" selected="selected">'
												+ cityList[index] + '</option>';
									} else {
										pHtmlStr = pHtmlStr
												+ '<option value="'+cityList[index]+'">'
												+ cityList[index] + '</option>';
									}

								}
								$("#city").html(pHtmlStr);
							});
			$("#province").change();

			//$("#province").val([ "${userBean.province}" ]);	
			$("#city").val([ "${userBean.city}" ]);
			//$("#sex").val([ "${userBean.sex}" ]);
		})();
	};
</script>
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
        	<!--修改个人资料-->
        	<div id="personalcenter_changeinfo">
            	<h3 id="changeinfo_head">█ 我的资料</h3>
            	<form action="${pageContext.request.contextPath}/UserServlet?method=PchangeInfo"  method="post"  enctype="multipart/form-data" id="form1" name="form1">
                <!--右边-->
                <div id="changeinfo_right">
                	<input type="file"  id="changeinfo_headpic" accept="image/*" name="head" onchange="change()">	
                </div>
                <img src="${userBean.head }" id="userhead">
                <!--左边-->
				<div id="changeinfo_left">
                <span class="changeinfo_left_h">用&ensp;户&ensp;名：</span><span  class="changeinfo_left_t" >${userBean.username}</span><br><br>
                <span class="changeinfo_left_h">注册时间：</span><span class="changeinfo_left_t" >${userBean.register_time }</span><br><br>
                <span class="changeinfo_left_h">注册手机：</span><span class="changeinfo_left_t" >${userBean.phone }</span><br><br>
                <span class="changeinfo_left_h">性&ensp;&ensp;&ensp;&ensp;别：</span>
                <select id="sex" name="sex"> 
                	<option value="男">男</option>
                    <option value="女">女</option>
                </select><br><br>
                 <span class="changeinfo_left_h">年&ensp;&ensp;&ensp;&ensp;龄：</span>
                <input type="text" class="changeinfo_left_t" onblur="formatAge();checkAge();" id="age" name="age" placeholder="正常人不超过150岁 :-)" value="${userBean.age }" required/><br/><br/>
                 <span class="changeinfo_left_h">所在地区：</span>
               	<select id="province" name="province"></select>  
				<select id="city" name="city"></select>
				<script type="text/javascript">  
					//所在地区
					(function(){  
							var pHtmlStr = '';  
							for(var name in pc){  
								if (name=='${userBean.province}') {
					            	pHtmlStr = pHtmlStr + '<option value="'+name+'" selected="selected">'+name+'</option>';  	
								}else {
									pHtmlStr = pHtmlStr + '<option value="'+name+'">'+name+'</option>'; 
								}
					}  
							$("#province").html(pHtmlStr);  
							$("#province").change(function(){  
									var pname = $("#province option:selected").text();  
									var pHtmlStr = '';  
									var cityList = pc[pname];  
								for(var index in cityList){  
									if (cityList[index]=='${userBean.city}') {
										pHtmlStr = pHtmlStr + '<option value="'+cityList[index]+'" selected="selected">'+cityList[index]+'</option>';  
									} else {
										pHtmlStr = pHtmlStr + '<option value="'+cityList[index]+'">'+cityList[index]+'</option>';  
									}
					    			
					}  
							$("#city").html(pHtmlStr);  
					});  
							$("#province").change();  
							
							//$("#province").val([ "${userBean.province}" ]);	
							$("#city").val([ "${userBean.city}" ]);		
							$("#sex").val([ "${userBean.sex}" ]);
					})();  
				</script><br><br>
                <span class="changeinfo_left_h">个人简介：</span><br><textarea placeholder="一句话介绍你自己！" name="introduction" id="introduction" required>${userBean.introduction}</textarea>
                </div>	
                <!--下面-->
                <div id="changeinfo_down" align="center">
                <input type="submit" value="保存" id="changeinfo_down_save" onclick="checkForm()"/>
                <input type="button" value="取消" id="changeinfo_down_cancel"  onclick="resetForm()"/>
                </div>
                </form>
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
<%}else{
	response.sendRedirect(request.getContextPath()+"/jsp/login/login.jsp");
}%>