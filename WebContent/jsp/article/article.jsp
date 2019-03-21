<%@page import="com.threeblog.util.UUIDUtils"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="com.threeblog.service.*"%>
<%@page import="com.threeblog.serviceImpl.*"%>
<%@page import="com.threeblog.domain.*" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
			UserService uService = new UserServiceImpl();
			//从地址栏获取文章id
			String id =  request.getQueryString().substring(3);
			//通过文章id获取作者id
			ArticleService aService = new ArticleServiceImpl();
			ArticleBean aBean =  aService.findArticle(id);
			if(aBean!=null){
				String author_id = aBean.getAuthor_id();
				int click_num = aBean.getClick_num();
				Date pub_time =  aBean.getPublish_date();
				//更新点击量
				click_num+=1;
				aService.updateClickNumByAId(id,click_num);
				ArticleBean aBean4 =  aService.findArticle(id);
				
				//通过作者id取作者的头像、名字
				UserBean author = uService.findUserInfo(author_id);
				//将作者的信息取出
				request.setAttribute("author", author);
				
				//通过文章id获取文章类型
				ArticleTypeBean aTypeBean = aService.findArticleType(id);
				//System.out.println(aTypeBean);
				//找上一篇和下一篇的id
				ArticleBean last_aBean = aService.findLastAId(author_id,pub_time);
				ArticleBean next_aBean = aService.findNextAId(author_id,pub_time);
				//判断为空,不为空则取出
				if(last_aBean!=null){request.setAttribute("last_aBean", last_aBean);}
				if(next_aBean!=null){request.setAttribute("next_aBean", next_aBean);}
				//将上一篇、下一篇和本文章信息和文章类型取出
				request.setAttribute("aBean", aBean4);
				request.setAttribute("aTypeBean", aTypeBean);
				//从userBean中取用户id
				UserBean userBean = (UserBean)request.getSession().getAttribute("userBean");
				if(userBean!=null){
					String uid = userBean.getId();
					//查找用户与赞的关系表
					ZanBean zBean = aService.findAZan(uid, id);
					request.setAttribute("zBean", zBean);
					//查找用户与收藏的关系表
					CollectBean cBean = aService.findACollect(uid, id);
					request.setAttribute("cBean", cBean);
					
					//找到用户的消息
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
				}
		%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="toTop" content="true">
<title>${aBean.title }</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/homepage.css" type="text/css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/personalcenter.css" type="text/css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/calendar.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/comment.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
<link href="${pageContext.request.contextPath}/css/owl.carousel.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/owl.carousel.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/clipboard.min.js"></script>
<!--为分享按钮添加本页面网址  -->
<script type="text/javascript">
window.onload=function(){
	var url =  window.location.href;
	$("#share").attr("data-clipboard-text",url);
	}
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
<div id="article_all">
	<div id="article_all_content">
    	<!--文章up-->
        <div class="article_a_up">
        	<h2>${aBean.title }</h2>
            <div id="a_up_info">
            <c:if test="${userBean.id == aBean.author_id }">
            <a href="${pageContext.request.contextPath}/RedirectServlet?method=personalCenterUI">
              <img src="${author.head }"/>
              <span>${aBean.author}</span>
           	</a>
           	</c:if>
           	<c:if test="${userBean.id != aBean.author_id }">
            <a href="${pageContext.request.contextPath}/jsp/othercenter/othercenter.jsp?id=${author.id}">
              <img src="${author.head }"/>
              <span>${aBean.author}</span>
           	</a>
           	</c:if>
                        <span>${aBean.publish_date}</span>
                        <span>分类 : </span><span><strong>${aTypeBean.article_type }</strong></span>
                        <span>标签 : </span><a href="${pageContext.request.contextPath}/jsp/homepage/search_result.jsp?content=${aBean.label}" id="article_a_up_a"  target="_blank">&lt;${aBean.label}&gt;</a>
                        <span>阅读 : </span><span>${aBean.click_num}</span>
            </div>
        </div>
        <c:if test="${aBean.status != '屏蔽'}">
	        <!--文章middle-->
	        <div class="article_a_middle">${aBean.text}</div>
	        <!--文章down-->
        </c:if>
        <c:if test="${aBean.status == '屏蔽'}">
	        <!--文章middle-->
	        <div class="article_a_middle"><p>该文章涉嫌违规内容，已被屏蔽！！请浏览其他文章...</p></div>
	        <!--文章down-->
        </c:if>
        <div class="article_a_down" >
        	<div id="a_down_lead">
        	<c:if test="${empty last_aBean }">
            	<a href="javascript:;" style="float:left;">◁上一篇  没有了</a>
            </c:if>
            <c:if test="${not empty last_aBean }">
            	<a href="${pageContext.request.contextPath}/jsp/article/article.jsp?id=${last_aBean.id}" style="float:left;">◁上一篇  ${last_aBean.title}</a>
            </c:if>
            <c:if test="${empty next_aBean }">
            	<a href="javascript:;" style="float:right">▷下一篇  没有了</a><br>
            </c:if>
       		 <c:if test="${not empty next_aBean }">
            	<a href="${pageContext.request.contextPath}/jsp/article/article.jsp?id=${next_aBean.id}" style="float:right">▷下一篇  ${next_aBean.title}</a><br>
            </c:if>	
            </div>
            <div id="a_down_tools">
            	<div id="tools_like">
            	<c:if test="${not empty userBean }">
            		<c:if test="${userBean.id==aBean.author_id }">
            			<img  id="like" src="${pageContext.request.contextPath}/image/unlike.png"  title="赞">
            		</c:if>
            		<c:if test="${userBean.id!=aBean.author_id }">
            			<c:if test="${empty zBean }">
            				<img  id="like" src="${pageContext.request.contextPath}/image/unlike.png"  title="赞">
            			</c:if>
            			<c:if test="${not empty zBean }">
            			<img  id="like" src="${zBean.zpic}"  title="赞">
            			</c:if>
            		</c:if>
            	</c:if>
            		<c:if test="${empty userBean }">
            			<img  id="like" src="${pageContext.request.contextPath}/image/unlike.png"  title="赞">
            		</c:if>
            	
                    <span>点赞</span>
                    <span id="slike">${aBean.liked_num }</span>
                    <!--点赞图标更换的js-->
                    <c:if test="${not empty userBean }">
	                    <script type="text/javascript">
	                    $('#like').click(function(){  
	                    	//生成点赞id
	                    	<% String zid = UUIDUtils.getId(); request.setAttribute("zid", zid);%>
	                            var article_id="${aBean.id}";//文章id
	    						var receiver_id="${aBean.author_id}";//作者id
	    						var sender_id="${userBean.id}";//用户id
	    						var article_title="${aBean.title}";//文章标题
	    						var id="${zid}";//点赞id
	    						if(receiver_id != sender_id){
		                            if($('#like').attr('src')=='${pageContext.request.contextPath}/image/unlike.png'){  	    								
		    							$.ajax({
		    								type:"POST",//用post方式传输
		    								dataType:"json",//数据格式:JSON
		    								url:"/ThreeBlog_V1.0/ArticleServlet?method=AddArticleZan" ,//目标地址
		    								data:{
		    									"article_id" : article_id,
			    								"receiver_id":receiver_id,
			    								"sender_id":sender_id,
			    								"zpic":"/ThreeBlog_V1.0/image/like.png",
			    								"text":article_title,
			    								"id":id
			    							},
		    								error:function(){
		    									alert("出错！请稍后再试...");
		    								},
		    								success:function(data){
		    									if(data){
		    										alert("感谢您的赞！");
		    										$('#like').attr('src','${pageContext.request.contextPath}/image/like.png');
		    										var zNum=$("#slike").text();//点赞数量
		    										zNum++;
		    										$("#slike").text(zNum);
		    									}else{
		    										alert("点赞失败，心碎！");	    										
		    									}
		    								}
		    							});
		    							
		                            }else{ 
		                            	$.ajax({
		    								type:"POST",//用post方式传输
		    								dataType:"json",//数据格式:JSON
		    								url:"/ThreeBlog_V1.0/ArticleServlet?method=UpdateArticleZan" ,//目标地址
		    								data:{
		    									"article_id":article_id,
		    									"id": "${zBean.id}",
		    									"zpic":"/ThreeBlog_V1.0/image/unlike.png"
			    								},
		    								error:function(){
		    									alert("出错！请稍后再试...");
		    								},
		    								success:function(data){
		    									if(data){
		    										alert("你不喜欢吗？");
		    										$('#like').attr('src','${pageContext.request.contextPath}/image/unlike.png');
		    										var zNum=$("#slike").text();//点赞数量
		    										if (zNum>0) {
		    											zNum--;														
													} else {
														zNum=0;	
													}
		    										$("#slike").text(zNum);
		    									}else{
		    										alert("取消点赞失败，心碎！");		    		
		    									}
		    								}
		    							});  
		                            } 
	    						}else {
									alert("不能给自己点赞哟！");
								}
	                    });  
	                    </script>  
                    </c:if>
                    <c:if test="${empty userBean }">
	                    <script type="text/javascript">
		                    $('#like').click(function(){  
		                    	window.location.href='${pageContext.request.contextPath}/RedirectServlet?method=LoginUI';       
		                    });  
	                    </script>  
                    </c:if>
                </div>
                <div id="tools_favor">
                <c:choose>
                	<c:when test="${userBean.id==aBean.author_id }">
        				<img  id="favor" src="${pageContext.request.contextPath}/image/unfavor.png" title="收藏"/>
        			</c:when>
        			<c:when test="${userBean.id!=aBean.author_id }">  
        				<c:if test="${empty cBean }">  			
            				<img  id="favor" src="${pageContext.request.contextPath}/image/unfavor.png" title="收藏"/>
            			</c:if> 
            			<c:if test="${not empty cBean }">  			
            				<img  id="favor" src="${cBean.cpic}" title="收藏"/>
            			</c:if> 
            		</c:when>
            		<c:when test="${empty userBean }">
            			<img  id="favor" src="${pageContext.request.contextPath}/image/unfavor.png" title="收藏"/>
            		</c:when>
            	</c:choose>
                    <span>收藏</span>
                    <span id="scollect">${aBean.collect_num }</span>                   
        			<!--收藏图标更换的js-->
        			<c:if test="${not empty userBean }">
        				<%-- <%String id  = UUIDUtils.getId(); %> --%>
	                    <script type="text/javascript">
	                    $('#favor').click(function(){  
	                    	//生成收藏id
	                    	<% String cid = UUIDUtils.getId(); request.setAttribute("cid", cid);%>
	                            var article_id="${aBean.id}";//文章id
	    						var author_id="${aBean.author_id}";//作者id
	    						var user_id="${userBean.id}";//用户id
	    						var id="${cid}";//收藏id
	    						if(author_id != user_id){
		                            if($('#favor').attr('src')=='${pageContext.request.contextPath}/image/unfavor.png'){  	    								
		    							$.ajax({
		    								type:"POST",//用post方式传输
		    								dataType:"json",//数据格式:JSON
		    								url:"/ThreeBlog_V1.0/ArticleServlet?method=AddArticleCollect" ,//目标地址
		    								data:{
		    									"article_id" : article_id,
			    								"author_id":author_id,
			    								"user_id":user_id,
			    								"cpic":"/ThreeBlog_V1.0/image/favor.png",
			    								"id":id
			    							},
		    								error:function(){
		    									alert("出错！请稍后再试...");
		    								},
		    								success:function(data){
		    									if(data){
		    										alert("收藏成功！"); 
		    										$('#favor').attr('src','${pageContext.request.contextPath}/image/favor.png');
		    										var cNum=$("#scollect").text();//收藏数目
		    										cNum++;																											
		    										$("#scollect").text(cNum);
		    									}else{
		    										alert("收藏失败，心碎！");	    										
		    									}
		    								}
		    							});
		    							
		                            }else{ 
		                            	$.ajax({
		    								type:"POST",//用post方式传输
		    								dataType:"json",//数据格式:JSON
		    								url:"/ThreeBlog_V1.0/ArticleServlet?method=UpdateArticleCollect" ,//目标地址
		    								data:{
		    									"article_id":article_id,
		    									"id": "${cBean.id}",
		    									"cpic":"/ThreeBlog_V1.0/image/unfavor.png"
			    								},
		    								error:function(){
		    									alert("出错！请稍后再试...");
		    								},
		    								success:function(data){
		    									if(data){
		    										alert("你不喜欢吗？"); 
		    										$('#favor').attr('src','${pageContext.request.contextPath}/image/unfavor.png');
		    										var cNum=$("#scollect").text();//收藏数目
		    										if (cNum>0) {
		    											cNum--;														
													} else {
														cNum=0;	
													}
		    										$("#scollect").text(cNum);
		    									}else{
		    										alert("取消收藏失败，心碎！");	    										
		    									}
		    								}
		    							});  
		                            } 
	    						}else {
									alert("不能收藏自己的文章哟！");
								}
	                    });  
	                    </script>  
                    </c:if>
                    <c:if test="${empty userBean }">
	                    <script type="text/javascript">
		                    $('#favor').click(function(){  
		                    	window.location.href='${pageContext.request.contextPath}/RedirectServlet?method=LoginUI';       
		                    });  
	                    </script>  
                    </c:if>                   
        		</div>
                <div id="tools_share">	
                		<img src="${pageContext.request.contextPath}/image/share.png" id="share" onClick="copyLink();" title="分享"  data-clipboard-text="">
        				<span>分享</span>
                        <!--分享js-->
                        <script type="text/javascript">
		                      //如果是ie8及其以下版本
		                        function copyLink(){		
		                           if(judge_ie()<=8&&judge_ie()!=null){
		                    			 var url =  window.location.href;
		                                 window.clipboardData.setData("Text",url);
		                                 alert("你已经复制链接，赶快粘贴给好友吧！");
		                           }else{
		                                  //clipboard
		                    			  //添加一个销毁之前事件的活动
		                                var clipboard = new ClipboardJS('#share');
		                                clipboard.on('success', function(e) {
		                                alert('你已经复制链接，赶快粘贴给好友吧!');			 
		                    			 e.clearSelection();
		                    			 clipboard.destroy();
		                               });
		                               clipboard.on('error', function(e) {
		                                alert('很遗憾，您的浏览器版本过低，复制失败，请手动复制链接！');
		                               });
		                           }
		                    	   		   
		                        }
		                            
		                        //判断是否是ie，及ie的版本
		                        function judge_ie(){
		                            var win = window;
		                            var doc = win.document;
		                            var input = doc.createElement ("input");
		                            
		                            var ie = (function (){
		                                if (win.ActiveXObject === undefined) return null;
		                                if (!win.XMLHttpRequest) return 6;
		                                if (!doc.querySelector) return 7;
		                                if (!doc.addEventListener) return 8;
		                                if (!win.atob) return 9;
		                                if (!input.dataset) return 10;
		                                return 11;
		                            })();
		                            return ie;
		                        }
						    </script>
        		</div>
                <div id="tools_report">
                	<c:if test="${not empty userBean }">
	                	<c:if test="${userBean.id!=aBean.author_id }">
	        				<a href="${pageContext.request.contextPath}/jsp/reportcenter/report_article.jsp?id=${aBean.id}">
		        				<img src="${pageContext.request.contextPath}/image/report.png" id="report" title="举报">
		        				<span>举报</span>
	        				</a>
	        			</c:if>	
	        			<c:if test="${userBean.id==aBean.author_id }">       				
		        			<img src="${pageContext.request.contextPath}/image/report.png" id="report" title="举报" onclick="reportA()">
		        			<span>举报</span>
	        				<script type="text/javascript">
	        					function reportA() {
									alert("别闹，不能举报自己的文章哟！");
								}
	        				</script>
	        			</c:if>	
        			</c:if>
        			<c:if test="${empty userBean }">
        				<a href="${pageContext.request.contextPath}/RedirectServlet?method=LoginUI">
	        				<img src="${pageContext.request.contextPath}/image/report.png" id="report" title="举报">
	        				<span>举报</span>
        				</a>
        			</c:if>	
        		</div>
            </div>
        </div>
        <!--评论/回复区域-->
        <div class="article_a_discuss">
        <!--此评论textarea文本框部分使用的https://github.com/alexdunphy/flexText此插件-->
        	<div class="commentAll">
					<!--评论区域 begin-->
					<div class="reviewArea clearfix">
						<div class="flex-text-wrap">
							<pre class="pre">
								<span></span><br>
							</pre>
							<textarea class="content comment-input" placeholder="留下你的评论..." onkeyup="keyUP(this)"></textarea>
						</div>
						<a href="javascript:;" class="plBtn">评论</a>
					</div>
					<!--评论区域 end-->										
					<!--回复区域 begin-->
					<div class="comment-show">

						<%
							//UserBean userBean =(UserBean)request.getSession().getAttribute("userBean");
							ArticleBean aBean1=(ArticleBean)request.getAttribute("aBean");
							String aid=aBean1.getId();//文章id
							ArticleService aservice = new ArticleServiceImpl();
							List<CommentBean> comments = aservice.getCommentsFromArticle_id(aid);
							SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//定义格式
							if(!comments.isEmpty()){
								for (int i = 0; i < comments.size(); i++) {
									CommentBean comment = comments.get(i);
									request.setAttribute("comment", comment);
									UserBean commenterBean = uService.findUserInfo(comment.getAuthor_id());	
									request.setAttribute("commenterBean", commenterBean);
						%>
						<!--1-->
						<div class="comment-show-con clearfix">
							<!--这是头像div-->
							<div class="comment-show-con-img pull-left">
							<a href="${pageContext.request.contextPath}/jsp/othercenter/othercenter.jsp?id=${comment.author_id}">
								<img src="${commenterBean.head }" alt="">
							</a>
							</div>
                            <!--这是内容div-->
							<div class="comment-show-con-list pull-left clearfix">
								<div class="pl-text clearfix">
									<!--用户名-->
									<a href="${pageContext.request.contextPath}/jsp/othercenter/othercenter.jsp?id=${comment.author_id}" class="comment-size-name"
										data="${comment.id }">${commenterBean.username}: </a>
									<!--评论内容 -->
									<c:if test="${comment.status != '屏蔽' }">						
									<span class="my-pl-con">${comment.text}</span>
									</c:if>
									<c:if test="${comment.status == '屏蔽' }">
									<span class="my-pl-con">该评论涉嫌违规内容，已被屏蔽！！</span>
									</c:if>
								</div>
								<div class="date-dz">
									<span class="date-dz-left pull-left comment-time"><%=df.format(comment.getAdd_time())%></span>
									<div class="date-dz-right pull-right comment-pl-block">
										<c:if test="${not empty userBean }">
											<c:if test="${commenterBean.id!=userBean.id }">
												<a href="javascript:;" class="removeBlock">举报</a>
											</c:if>																			
											<c:if test="${commenterBean.id==userBean.id }">
												<a href="javascript:;" class="delete">删除</a>
											</c:if>
											<c:if test="${commenterBean.id!=userBean.id }">
												<a href="javascript:;" class="date-dz-pl pl-hf pull-left">回复</a>
											</c:if>
											<span class="pull-left date-dz-line">|</span>
										</c:if>	
										<!--赞-->
											<a href="javascript:;" class="date-dz-z pull-left">
											<i class="date-dz-z-click-red"></i>赞 (<i class="z-num">${comment.zan}</i>)</a>
										
									</div>
									
								</div>
                                
								<div class="hf-list-con">

						<!-- 评论回复内容区域begin -->

									<%
										List<AnswerBean> answers=aservice.getAnswersFromComment_id(comment.getId());
										for(int j=0;j<answers.size();j++){
											AnswerBean answer=answers.get(j);
											request.setAttribute("answer", answer);
											UserBean answerUBean=uService.findUserInfo(answer.getAuthor_id());
											request.setAttribute("answerUBean", answerUBean);
									%>

									<div class="all-pl-con">
										<div class="pl-text hfpl-text clearfix">
											<a href="${pageContext.request.contextPath}/jsp/othercenter/othercenter.jsp?id=${answer.author_id}" class="comment-size-name" data="${answer.id }">${ answerUBean.username} : </a> 
											<c:if test="${answer.status != '屏蔽' }">
											<span class="my-pl-con"> &nbsp;${answer.text}</span>
											</c:if>
											<c:if test="${answer.status == '屏蔽' }">
											<span class="my-pl-con"> &nbsp;该回复涉嫌违规内容，已被屏蔽！！</span>
											</c:if>
										</div>
										<div class="date-dz">
											<span class="date-dz-left pull-left comment-time"><%=df.format(answer.getAdd_time())%></span>
											<div class="date-dz-right pull-right comment-pl-block">
											<c:if test="${not empty userBean }">
												<c:if test="${answerUBean.id!=userBean.id }">
													<a href="javascript:;" class="removeBlock">举报</a>
												</c:if>
												<c:if test="${answerUBean.id==userBean.id }">
													<a href="javascript:;" class="delete">删除</a>
												</c:if>
												<c:if test="${answerUBean.id!=userBean.id }">
													<a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a> 
												</c:if>
												<span class="pull-left date-dz-line">|</span> 
											</c:if>	
												<a href="javascript:;" class="date-dz-z pull-left">
												 <i class="date-dz-z-click-red"></i>赞 (<i class="z-num">${answer.zan}</i>)
												</a>
											</div>
                                    </div>
                                    <!-- 评论回复内容区域end -->	
									</div>
									<%}%>
								</div>
							</div>
						</div>
						<%}}%>
					</div>
				</div>



			</div>
			<!--回复区域 end-->
			
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/js/jquery.flexText.js"></script>
		<!--textarea高度自适应-->
		<script type="text/javascript">
					$(function() {
						$('.content').flexText();
					});
				</script>
		<!--textarea限制字数-->
		<script type="text/javascript">
					function keyUP(t) {
						var len = $(t).val().length;
						if (len > 300) {
							$(t).val($(t).val().substring(0, 300));
						}
					}
		</script>
		<!--点击评论创建评论条-->
		<c:if test="${not empty userBean }">
		<c:if test="${userBean.id!=aBean.author_id }">
				<script type="text/javascript">
					$('.commentAll').on('click','.plBtn',function() {
										//获取输入内容
										var oHtml;
										var oSize = $(this).siblings('.flex-text-wrap').find('.comment-input').val();
										console.log(oSize);
										//动态创建评论模块										
										if (oSize.replace(/(^\s*)|(\s*$)/g, "") != '') {																						
											var url = "${pageContext.request.contextPath}/CommentServlet?method=addComment";
											var args = {																								
												"article_id" : "${aBean.id}",	//文章id
												"author_id":"${userBean.id}",    //用户id
												"text":oSize,                      //评论内容
												"receiver_id":"${aBean.author_id}",//文章作者id
												"text1":"${aBean.title}"	//文章标题
											};
											$.ajaxSettings.async = false;  
											$.get(url, args,function(data) {
												if (!data) {
													alert("评论出错，抱歉！");
												} else {

												
													var result=eval("("+data+")");
													var comment_id=result.comment_id;
													console.log(comment_id);
													var add_time=result.add_time;
													console.log(add_time);
												    oHtml ='<div  class="comment-show-con clearfix" ><div class="comment-show-con-img pull-left" ><a href="${pageContext.request.contextPath}/jsp/othercenter/othercenter.jsp?id=${userBean.id}"><img src="${userBean.head}"</a>  alt=""></div> <div class="comment-show-con-list pull-left clearfix"><div class="pl-text clearfix"><a href="${pageContext.request.contextPath}/jsp/othercenter/othercenter.jsp?id=${userBean.id}" class="comment-size-name" data="'
												     						+comment_id+
												     						'">${userBean.username} : </a><span class="my-pl-con">&nbsp;'
												     						+ oSize+ 
												     						'</span></div><div class="date-dz"><span class="date-dz-left pull-left comment-time">'
												     						+ add_time+
												     						'</span><div class="date-dz-right pull-right comment-pl-block"><a href="javascript:;" class="delete">删除</a> <span class="pull-left date-dz-line">|</span> <a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">0</i>)</a></div></div><div class="hf-list-con"></div></div></div>';			
												}
											}); 
											$.ajaxSettings.async = true;  
											
											$(this).parents('.reviewArea ').siblings('.comment-show').prepend(oHtml);
											$(this).siblings('.flex-text-wrap').find('.comment-input').prop('value', '').siblings('pre').find('span').text('');										
										}
									});
				</script>
		</c:if>
		<c:if test="${userBean.id==aBean.author_id }">
					<script type="text/javascript">
					$('.commentAll').on('click','.plBtn',function() {
								alert("不能给自己留言哟！");
							});
					</script>
		</c:if>
		</c:if>
		<c:if test="${empty userBean }">
				<script type="text/javascript">
					$('.commentAll').on('click','.plBtn',function() {
							window.location.href='${pageContext.request.contextPath}/RedirectServlet?method=LoginUI';
					});
				</script>
		</c:if>


		<!--点击回复动态创建回复块-->
		<script type="text/javascript">
		 $('.comment-show').on('click','.pl-hf',function(){
		        //获取回复人的名字
		        var fhName = $(this).parents('.date-dz-right').parents('.date-dz').siblings('.pl-text').find('.comment-size-name').html();
		        //回复@
		        var fhN = '回复@'+fhName;
		        //var oInput = $(this).parents('.date-dz-right').parents('.date-dz').siblings('.hf-con');
		        var fhHtml = '<div class="hf-con pull-left"> <textarea class="content comment-input hf-input" placeholder="" onkeyup="keyUP(this)"></textarea> <a href="javascript:;" class="hf-pl">评论</a></div>';
		        //显示回复
		        if($(this).is('.hf-con-block')){
		            $(this).parents('.date-dz-right').parents('.date-dz').append(fhHtml);
		            $(this).removeClass('hf-con-block');
		            $('.content').flexText();
		            $(this).parents('.date-dz-right').siblings('.hf-con').find('.pre').css('padding','6px 15px');
		            //console.log($(this).parents('.date-dz-right').siblings('.hf-con').find('.pre'))
		            //input框自动聚焦
		            $(this).parents('.date-dz-right').siblings('.hf-con').find('.hf-input').val('').focus().val(fhN);
		        }else {
		            $(this).addClass('hf-con-block');
		            $(this).parents('.date-dz-right').siblings('.hf-con').remove();
		        }
		    });
				</script>
		<!--评论回复块创建-->
		<c:if test="${not empty userBean }">
		<script type="text/javascript">
					$('.comment-show').on('click','.hf-pl',function() {
										var oThis = $(this);
										//获取输入内容
										var oHfVal = $(this).siblings('.flex-text-wrap').find('.hf-input').val();
										console.log("oHfVal");
										console.log(oHfVal);
										var oHfName = $(this).parents('.hf-con').parents('.date-dz').siblings('.pl-text').find('.comment-size-name').html();										
										var alltext=$(this).parents('.hf-con').parents('.date-dz').siblings('.pl-text').html();
										console.log("alltext:");
										console.log(alltext);
										var flag;
										var comment_id;
										var answer_id=$(this).parents('.hf-con').parents('.date-dz').siblings('.pl-text').find('.comment-size-name').attr("data");
										if(alltext.indexOf("@")==-1){
											flag=1;//代表comment_id和answer_id是相重叠的
											comment_id = $(this).parents('.hf-con').parents('.date-dz').siblings('.pl-text').find('.comment-size-name').attr("data");
											console.log("comment_id:");
											console.log(comment_id);	
										}else{
										flag=0;//代表comment_id和answer_id是不相重叠的
										comment_id = $(this).parents('.hf-con').parents('.date-dz').parents('.all-pl-con').parents('.hf-list-con').siblings('.pl-text').find('.comment-size-name').attr("data");
										console.log("comment_id:");
										console.log(comment_id);																		
										}
										var username="${userBean.username}"+" : ";																				
										if(oHfName==username){
											alert("想对自己说什么话，憋在心里就好了");
											oThis.parents('.hf-con').siblings('.date-dz-right').find('.pl-hf').addClass('hf-con-block')&& oThis.parents('.hf-con').remove();
													return false;
										}									
										var oAllVal = '回复@' + oHfName;
										if (oHfVal.replace(/^ +| +$/g, '') == ''
												|| oHfVal == oAllVal) {

										} else {
											$.getJSON("${pageContext.request.contextPath}/json/pl.json",function(data) {
																var oAt = '';
																var oHf = '';
																$.each(data,function(n,v) {
																					delete v.hfContent;
																					delete v.atName;
																					var arr;
																					var ohfNameArr;
																					if (oHfVal.indexOf("@") == -1) {
																						data['atName'] = '';
																						data['hfContent'] = oHfVal;
																					} else {
																						arr = oHfVal.split(':');
																						ohfNameArr = arr[0].split('@');
																						data['hfContent'] = arr[1];
																						data['atName'] = ohfNameArr[1];
																					}

																					if (data.atName == '') {
																						oAt = data.hfContent;
																					} else {
																						oAt = '回复<a href="javascript:;" class="atName">@'
																								+ data.atName
																								+ '</a> : '
																								+ data.hfContent;
																					}
																					oHf = data.hfName;
																				});

																var oHtml ;
																var url = "${pageContext.request.contextPath}/CommentServlet?method=addAnswer";
																var args = {
																	"author_id":"${userBean.id}",	//留言评论者id
																	"comment_id":comment_id,		//留言id
																	"flag":flag,					//标志
																	"last_answer_id":answer_id,		//最新评论者id
																	"article_id":"${aBean.id}",		//文章id
																	"text2":oAt,					//评论内容
																};
																console.log("1");
																console.log(oAt);
																$.ajaxSettings.async = false;  
																$.get(url, args,function(data) {
																	if (!data) {
																		alert("回复出错，抱歉！")
																	}else{
																		var result=eval("("+data+")");
																			var answer_id=result.answer_id;
																			console.log("answer_id");
																			console.log(answer_id);
																			var add_time=result.add_time;
																			console.log(add_time);
																			oHtml= '<div class="all-pl-con"><div class="pl-text hfpl-text clearfix"><a href="${pageContext.request.contextPath}/jsp/othercenter/othercenter.jsp?id=${userBean.id}" class="comment-size-name" data="'
																							+answer_id+
																							'">${userBean.username} : </a><span class="my-pl-con">'
																							+ oAt+ 
																							'</span></div><div class="date-dz"><span class="date-dz-left pull-left comment-time">'
																							+ add_time+ 
																							'</span><div class="date-dz-right pull-right comment-pl-block"><a href="javascript:;" class="delete">删除</a><span class="pull-left date-dz-line">|</span><a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">0</i>)</a></div></div></div>';
																			
																	}     
																}); 
																$.ajaxSettings.async = true;  																																																							
																		oThis.parents('.hf-con').parents('.comment-show-con-list').find('.hf-list-con').css('display','block').prepend(oHtml)
																		&& oThis.parents('.hf-con').siblings('.date-dz-right').find('.pl-hf').addClass('hf-con-block')
																		&& oThis.parents('.hf-con').remove();																	
															});
										}
									});
				</script>
				</c:if>
				<c:if test="${empty userBean }">
				<script type="text/javascript">
					$('.comment-show').on('click','.hf-pl',function() {
										window.location.href='${pageContext.request.contextPath}/RedirectServlet?method=LoginUI';
									});
				</script>
				</c:if>
		<!--举报评论块  -->
		<c:if test="${ not empty userBean }">
		<script type="text/javascript">
					 $('.commentAll').on('click','.removeBlock',function(){
						 	var alltext=$(this).parents('.date-dz-right').parents('.date-dz').siblings('.pl-text').html();
						 	var article_id="${aBean.id}";
							var comment_id = $(this).parents('.date-dz-right').parents('.date-dz').siblings('.pl-text').find('.comment-size-name').attr("data");
							if(alltext.indexOf("@")==-1){	
								<!--举报的是评论 -->
								window.location.href='${pageContext.request.contextPath}/jsp/reportcenter/report_reviews.jsp?article_id='+article_id+"&comment_id="+comment_id;
	
							}else{
								<!--举报的是回复 -->
								window.location.href='${pageContext.request.contextPath}/jsp/reportcenter/report_reviews.jsp?article_id='+article_id+"&answer_id="+comment_id;
							
							}

					}) 
				</script>
				</c:if>
		<c:if test="${empty userBean }">
				<script type="text/javascript">
					 $('.commentAll').on('click','.removeBlock',function(){
						 	var alltext=$(this)
							.parents('.date-dz-right').parents(
							'.date-dz').siblings(
							'.pl-text').html();
						 	var article_id="${aBean.id}";
							var comment_id = $(this)
							.parents('.date-dz-right').parents(
							'.date-dz').siblings(
							'.pl-text').find(
							'.comment-size-name').attr("data");
							if(alltext.indexOf("@")==-1){	
								<!--举报的是评论 -->
								window.location.href='${pageContext.request.contextPath}/RedirectServlet?method=LoginUI';
	
							}else{
								<!--举报的是回复 -->
								window.location.href='${pageContext.request.contextPath}/RedirectServlet?method=LoginUI';							
							}

					}) 
				</script>
				</c:if>
		<!--删除评论块-->
		<script type="text/javascript">
		    $('.commentAll').on('click','.delete',function(){
		    	 var oT = $(this).parents('.date-dz-right').parents('.date-dz').parents('.all-pl-con');
		    	 var flag=2;
		        var alltext=$(this).parents('.date-dz-right').parents('.date-dz').siblings('.pl-text').html();
		        var comment_id = $(this).parents('.date-dz-right').parents('.date-dz').siblings('.pl-text').find('.comment-size-name').attr("data");		        
		        if(alltext.indexOf("@")==-1){	
					<!--删除的是评论 -->
					var url = "${pageContext.request.contextPath}/CommentServlet?method=deleteComment";
					 var args={
							 	"article_id" : "${aBean.id}", //文章id
				        		"comment_id" : comment_id //留言id
				        }
						$.ajaxSettings.async = false; 
				        $.get(url, args,function(data) {
						        	var result=eval("("+data+")");
						        	if(result.bol==1){       
						        		flag=1;
						        	}else if(result.bol==2){
						        		alert("删除失败！由于收到用户举报，该评论暂时被锁定！");
						        	}      	
						}); 
				        $.ajaxSettings.async = true; 
			
				}else{
					<!--删除的是回复 -->
					var url = "${pageContext.request.contextPath}/CommentServlet?method=deleteAnswer";
					var args={
			        		"answer_id" : comment_id,//回复id
			        		"article_id" : "${aBean.id}", //文章id
			        }
					
					$.ajaxSettings.async = false; 
			        $.get(url, args,
							function(data) {
					        	var result=eval("("+data+")");
					        	if(result.bol==1){
					        		 flag=1;
					        	}else if(result.bol==2){
					        		alert("删除失败！由于收到用户举报，该回复暂时被锁定！");
					        	}
					        	
					}); 
			        $.ajaxSettings.async = true; 			
				}
		        if(flag==1){
		        	if(oT.siblings('.all-pl-con').length >= 1){
		                oT.remove();
		            }else {
		                $(this).parents('.date-dz-right').parents('.date-dz').parents('.all-pl-con').parents('.hf-list-con').css('display','none');
		                oT.remove();
		            }
		            $(this).parents('.date-dz-right').parents('.date-dz').parents('.comment-show-con-list').parents('.comment-show-con').remove();
		        }		        		        
		    });
		</script>		
				
		<!--点赞-->
		<c:if test="${not empty userBean }">
		<script type="text/javascript">
					$('.comment-show').on('click','.date-dz-z',function() {
								var zNum = $(this).find('.z-num').html();
								var status;
								if ($(this).is('.date-dz-z-click')) {
									zNum--;
									status="取消点赞";
									$(this).removeClass('date-dz-z-click red');
									$(this).find('.z-num').html(zNum);
									$(this).find('.date-dz-z-click-red').removeClass('red');
								} else {
									zNum++;
									status="点赞";
									$(this).addClass('date-dz-z-click');
									$(this).find('.z-num').html(zNum);
									$(this).find('.date-dz-z-click-red').addClass('red');
								}					
								var alltext=$(this).parents('.date-dz-right').parents('.date-dz').siblings('.pl-text').html();
								var comment_id = $(this).parents('.date-dz-right').parents('.date-dz').siblings('.pl-text').find('.comment-size-name').attr("data");
								var sender_id="${userBean.id}";
								var article_id="${aBean.id}"
								if(alltext.indexOf("@")==-1){		
									<!--点赞的是评论表 -->
									var url = "${pageContext.request.contextPath}/CommentServlet?method=addZanToComment";
									var args = {
										"comment_id":comment_id,
										"sender_id":sender_id,
										"article_id":article_id,
										"status":status,
										"zan":zNum,
									};
									$.ajaxSettings.async = false;  
									$.get(url, args); 
									$.ajaxSettings.async = true;  					
								}else{								
									var url = "${pageContext.request.contextPath}/CommentServlet?method=addZanToAnswer";
									var args = {
										"answer_id":comment_id,
										"sender_id":sender_id,
										"article_id":article_id,
										"status":status,
										"zan":zNum,
									};
									$.ajaxSettings.async = false;  
									$.get(url, args); 
									$.ajaxSettings.async = true;  
								
								}								
							});
				</script>
			</c:if>
			<c:if test="${empty userBean }">
				<script type="text/javascript">
					$('.comment-show').on('click','.date-dz-z',function() {															
							window.location.href='${pageContext.request.contextPath}/RedirectServlet?method=LoginUI';								
					});
				</script>
			</c:if>
        </div>
    </div>	
</div>
<!--内容end-->
			<%
				}else{
					//文章id不存在
					response.sendRedirect(request.getContextPath()+"/jsp/error/error.jsp");
					//request.getRequestDispatcher("/jsp/error/error.jsp").forward(request,response);
				}
			%>
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
