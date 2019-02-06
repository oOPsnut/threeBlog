<%@page import="com.threeblog.serviceImpl.ArticleServiceImpl"%>
<%@page import="com.threeblog.service.ArticleService"%>
<%@page import="com.threeblog.domain.ArticleBean"%>
<%@page import="com.threeblog.domain.FollowBean"%>
<%@page import="com.threeblog.domain.MessageBean"%>
<%@page import="java.util.List"%>
<%@page import="com.threeblog.serviceImpl.UserServiceImpl"%>
<%@page import="com.threeblog.service.UserService"%>
<%@page import="com.threeblog.domain.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
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
<title>消息中心</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/homepage.css" type="text/css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/messagecenter.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/personalcenter.css" type="text/css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/calendar.css">
<link href="${pageContext.request.contextPath}/css/owl.carousel.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/messagechangeP.js"></script>
<script src="${pageContext.request.contextPath}/js/class.js"></script>
<script src="${pageContext.request.contextPath}/js/MsgBox.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/owl.carousel.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/messagechangeP.js"></script>
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

<body onload="Read()">
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
	        <li><a href="javascript:;">&ensp;账号设置&ensp;</a></li>
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
        <div id="messagecenter_all">
           	<h3>█ 消息中心</h3>
        		<!--列表up-->
           	<div id="messagecenter_up">
            	<div class="up_labels">
                    <a href="${pageContext.request.contextPath}/RedirectServlet?method=reviewsUI"><span>评论消息</span></a>
                    <c:if test="${countReviews<100 }">
                    	<span class="up_labels_num">${countReviews }</span>
                    </c:if>
                    <c:if test="${countReviews>99 }">
                    	<span class="up_labels_num">...</span>
                    </c:if>
             	</div>
                <span id="messagecenter_up_span">|</span>
                <div class="up_labels">
                    <a href="${pageContext.request.contextPath}/RedirectServlet?method=followUI"><span>关注消息</span></a>
                    <c:if test="${countFollows<100 }">
                    	<span class="up_labels_num">${countFollows }</span>
                    </c:if>
                    <c:if test="${countFollows>99 }">
                    	<span class="up_labels_num">...</span>
                    </c:if>
             	</div>
                <span id="messagecenter_up_span">|</span>
                <div class="up_labels">
                    <a href="${pageContext.request.contextPath}/RedirectServlet?method=favorUI"><span>收藏消息</span></a>
                    <c:if test="${countCollects<100 }">
                    	<span class="up_labels_num">${countCollects }</span>
                    </c:if>
                    <c:if test="${countCollects>99 }">
                    	<span class="up_labels_num">...</span>
                    </c:if>
             	</div>
                <span id="messagecenter_up_span">|</span>
                <div class="up_labels">
                    <a href="javascript:;"><span>点赞消息</span></a>
                    <c:if test="${countZans<100 }">
                    	<span class="up_labels_num">${countZans }</span>
                    </c:if>
                    <c:if test="${countZans>99 }">
                    	<span class="up_labels_num">...</span>
                    </c:if>
             	</div>
           	</div>
                <!--列表down-->
            <div id="messagecenter_down">
            	<span id="messagecenter_down_id">█ 点赞消息</span>
            <select id="selectRead" onchange="Readselect()">
    			<option value="notread" selected="selected">未读</option>
    			<option value="read">已读</option>
    	    </select>
            <br>
            <br>
            <!--未读消息  -->
            <div id="notreadDiv">
            <table id="messagecenter_table" border="1">
                <tr>
                <th width="5%">#</th>
                <th width="55%">点赞消息</th>
                <th width="25%">时间</th>
                <th width="15%">操作</th>
                </tr>
            <%
            	ArticleService aService = new ArticleServiceImpl();
            	List<MessageBean> notRZanmessages = uService.findnotReadZanMessagesByUid(uid);
            	if(notRZanmessages.isEmpty()){
           	%>
           	 	<tr>
                    <td colspan="4" style="padding: 20px;"><strong>没有消息记录！</strong></td>                     
                </tr>
             <%
             	}else{
             		//following_id :关注者， follower_id: 被关注者
		        	  //接受消息者:receiver_id  发送消息者:answer_id
		        		for(int i=0;i<notRZanmessages.size();i++){
		        			int number=i+1;
		        			request.setAttribute("number", number);
		        			MessageBean mBean = notRZanmessages.get(i);
		        			request.setAttribute("mBean", mBean);
		        			String sendMUserId = mBean.getAnswer_id();//发消息用户id
		        			UserBean uBean = uService.findUserInfo(sendMUserId);
		        			request.setAttribute("uBean", uBean);
		        			String aid = mBean.getArticle_id();//文章id
		        			ArticleBean aBean = aService.findArticle(aid);
		        			request.setAttribute("aBean", aBean);           	 
           	 %>
           	 	<c:if test="${mBean.type=='文章点赞' }">
                <tr>
                <td>${number}</td>
                <td>
                	<a href="${pageContext.request.contextPath}/jsp/othercenter/othercenter.jsp?id=${uBean.id}" target="_blank" id="m_review_author">${uBean.username } </a>
                		点赞了你的博文
                	<a href="${pageContext.request.contextPath}/jsp/article/article.jsp?id=${aBean.id}" target="_blank" id="m_review_article">《${aBean.title }》</a>
                </td>
                <td>${mBean.add_time }</td>
                <td>
                	<a href="${pageContext.request.contextPath}/jsp/article/article.jsp?id=${aBean.id}" target="_blank">
                		<img  id="read" src="${pageContext.request.contextPath}/image/unread.png"  onclick="cRead('${mBean.id}');">
                	</a>
					 <!--查看图标更换的jq-->
						<script type="text/javascript">
		                   function cRead(id){  
		                          var mid=id;//消息的id
		                          //console.log(mid);
		                          $.ajax({
		                        	  	type:"POST",//用post方式传输
										dataType:"json",//数据格式:JSON
										url:"/ThreeBlog_V1.0/MessageServlet?method=Read" ,//目标地址
										data:{"id":mid},
										error:function(){
											alert("出错！请稍后再试...");
										},
										success:function(data){
											if (data) {
												window.location.reload();
												//window.open("${pageContext.request.contextPath}/jsp/article/article.jsp?id=${aBean.id}");
											} else {
												alert("出错，此消息可能处于非正常状态！");		
												window.location.reload();
											}
										}
		                          }); 
		                    }  
	                    </script>
            </td>
            </tr>
            </c:if>
            <c:if test="${mBean.type=='留言点赞' }">
                <tr>
                <td>${number}</td>
                <td>
                	<a href="${pageContext.request.contextPath}/jsp/othercenter/othercenter.jsp?id=${uBean.id}" target="_blank" id="m_review_author">${uBean.username } </a>
                		点赞了你在博文
                	<a href="${pageContext.request.contextPath}/jsp/article/article.jsp?id=${aBean.id}" target="_blank" id="m_review_article">《${aBean.title }》</a>
                		下的留言
                </td>
                <td>${mBean.add_time }</td>
                <td>
                	<a href="${pageContext.request.contextPath}/jsp/article/article.jsp?id=${aBean.id}" target="_blank">
                		<img  id="read" src="${pageContext.request.contextPath}/image/unread.png"  onclick="cRead('${mBean.id}');">
                	</a>
					 <!--查看图标更换的jq-->
						<script type="text/javascript">
		                   function cRead(id){  
		                          var mid=id;//消息的id
		                          //console.log(mid);
		                          $.ajax({
		                        	  	type:"POST",//用post方式传输
										dataType:"json",//数据格式:JSON
										url:"/ThreeBlog_V1.0/MessageServlet?method=Read" ,//目标地址
										data:{"id":mid},
										error:function(){
											alert("出错！请稍后再试...");
										},
										success:function(data){
											if (data) {
												window.location.reload();
												//window.open("${pageContext.request.contextPath}/jsp/article/article.jsp?id=${aBean.id}");
											} else {
												alert("出错，此消息可能处于非正常状态！");		
												window.location.reload();
											}
										}
		                          }); 
		                    }  
	                    </script>
            </td>
            </tr>
            </c:if>
           <%}} %>
            </table>
           	</div>
           	
           	<!--已读消息  -->
            <div id="readDiv">
            <table id="messagecenter_table" border="1">
                <tr>
                <th width="5%">#</th>
                <th width="55%">点赞消息</th>
                <th width="25%">时间</th>
                <th width="15%">操作</th>
                </tr>
                <%
	            	List<MessageBean> RZanmessages = uService.findReadZanMessagesByUid(uid);
	            	if(RZanmessages.isEmpty()){
           		%>
                <tr>
                    <td colspan="4" style="padding: 20px;"><strong>没有消息记录！</strong></td>                     
                </tr>
                <%
                	}else{
                		//following_id :关注者， follower_id: 被关注者
  		        	  //接受消息者:receiver_id  发送消息者:answer_id
  		        		for(int i=0;i<RZanmessages.size();i++){
  		        			int number=i+1;
  		        			request.setAttribute("number", number);
  		        			MessageBean mBean = RZanmessages.get(i);
  		        			request.setAttribute("mBean", mBean);
  		        			String sendMUserId = mBean.getAnswer_id();//发消息用户id
  		        			UserBean uBean = uService.findUserInfo(sendMUserId);
  		        			request.setAttribute("uBean", uBean);
  		        			String aid = mBean.getArticle_id();//文章id
  		        			ArticleBean aBean = aService.findArticle(aid);
  		        			request.setAttribute("aBean", aBean); 	
               %>       
               		<c:if test="${mBean.type=='文章点赞' }">       
	                <tr>
		                <td>${number}</td>
		                <td><a href="${pageContext.request.contextPath}/jsp/othercenter/othercenter.jsp?id=${uBean.id}" target="_blank" id="m_review_author">${uBean.username } </a>点赞了你的博文<a href="${pageContext.request.contextPath}/jsp/article/article.jsp?id=${aBean.id}" target="_blank" id="m_review_article">《${aBean.title }》</a></td>
		                <td>${mBean.add_time }</td>
		                <td><a href="${pageContext.request.contextPath}/jsp/article/article.jsp?id=${aBean.id}" target="_blank"><img  id="read" src="${pageContext.request.contextPath}/image/read.png"></a>	                    
			            </td>
		            </tr>   
		            </c:if>  
		            <c:if test="${mBean.type=='留言点赞' }">       
	                <tr>
		                <td>${number}</td>
		                <td><a href="${pageContext.request.contextPath}/jsp/othercenter/othercenter.jsp?id=${uBean.id}" target="_blank" id="m_review_author">${uBean.username } </a>点赞了你在博文<a href="${pageContext.request.contextPath}/jsp/article/article.jsp?id=${aBean.id}" target="_blank" id="m_review_article">《${aBean.title }》</a>下的留言</td>
		                <td>${mBean.add_time }</td>
		                <td><a href="${pageContext.request.contextPath}/jsp/article/article.jsp?id=${aBean.id}" target="_blank"><img  id="read" src="${pageContext.request.contextPath}/image/read.png"></a>	                    
			            </td>
		            </tr>   
		            </c:if>  
            	<%}} %>
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
