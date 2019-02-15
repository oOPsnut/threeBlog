<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.threeblog.domain.UserBean"%>
<%@page import="com.threeblog.serviceImpl.UserServiceImpl"%>
<%@page import="com.threeblog.service.UserService"%>
<%@page import="com.threeblog.domain.ArticleBean"%>
<%@page import="java.util.List"%>
<%@page import="com.threeblog.serviceImpl.ArticleServiceImpl"%>
<%@page import="com.threeblog.service.ArticleService"%>
<%
			UserService uService = new UserServiceImpl();
			UserBean userBean = (UserBean)request.getSession().getAttribute("userBean");
			if(userBean!=null){
				String uid = userBean.getId();
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
			int totalUser = Integer.valueOf(uService.CountTotalUsers().toString());//总用户数
			request.setAttribute("totalUser", totalUser);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>搜索结果</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/homepage.css" type="text/css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/blog.css" type="text/css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/calendar.css">

<link href="${pageContext.request.contextPath}/css/owl.carousel.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/owl.carousel.js"></script>
<script src="${pageContext.request.contextPath}/js/search.js"></script>
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
<!--内容栏begin-->
<div id="index_all">
    <!--右侧栏begin-->
    <div id="index_body_right">
    	<!--写作入口-->
    	<div id="index_body_enter">
        	<div id="index_body_enter_write" >
            	<c:if test="${not empty userBean }">
            	<a href="${pageContext.request.contextPath}/RedirectServlet?method=publishUI"><img src="${pageContext.request.contextPath}/image/write.png">
                </c:if> 
                <c:if test="${empty userBean }">
            	<a href="${pageContext.request.contextPath}/RedirectServlet?method=LoginUI"><img src="${pageContext.request.contextPath}/image/write.png">
                </c:if>
                <div id="enter_writer_w">
                	<span id="enter_writer_span1">写博文</span>&emsp;
                    <span id="enter_writer_span2">|&emsp;记录你生活的剪影</span>
                </div>
                </a>
            </div>
            <div id="index_body_enter_guideboard" >
            	<h3 >█ 指路牌</h3>
                <a href="${pageContext.request.contextPath}/RedirectServlet?method=blogUI"><span >博客文章欣赏</span></a><br/><br/>
                <a href="${pageContext.request.contextPath}/RedirectServlet?method=picturesUI"><span>博客图片画廊</span></a><br /><br/>
                <a href="${pageContext.request.contextPath}/RedirectServlet?method=searchUI"><span>博客标签搜索</span></a>
            </div>
        </div>
        <!--介绍-->
        <div id="index_body_total">
        	<h2>记录生活，分享快乐。</h2>
            <span class="body_total_span_e">Life is short,</span><br/>
            <span class="body_total_span_e">have some pride.</span><br/><br/>
            <span class="body_total_span_c">已经有&nbsp;${totalUser}&nbsp;位朋友</span><br/>
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
            <img src="${pageContext.request.contextPath}/image/notice.png">
            <a href="${pageContext.request.contextPath}/RedirectServlet?method=noticeBoardUI"><span id="body_notice_old">以往公告</span></a>
        </div>
        <!--日历-->
        <div id="index_body_calendar">
        	<div id="calendar" class="calendar"></div>
  			<script src="${pageContext.request.contextPath}/js/calendar.js"></script>
        </div>
        <!--热门标签标签-->
        <div id="index_body_labels">
        	<h3>█ 热门标签</h3>
        	<%
        		ArticleService aService = new ArticleServiceImpl();
        		List<Object[]> hotLabels = aService.findHotLabels();  
        		if(hotLabels.isEmpty()){
        	%>
        	<h4 style="margin-left: 30px;color: gray;">暂无</h4>
        	<%		
        		}else{
        			for(int i=0;i<hotLabels.size();i++){
        				Object[] ob = hotLabels.get(i);
        				Object hotLabel = ob[0];
        				//System.out.println(hotLabel);
        				request.setAttribute("hotLabel", hotLabel);
        	%>
            <a href="${pageContext.request.contextPath}/jsp/homepage/search_result.jsp?content=${hotLabel}"><input  type="submit" value="${hotLabel}" class="body_labels_input"></a>     
            <%} }%>      	
        </div>
    </div>
    <!--右侧栏end-->
    <!--左侧栏begin-->
    <div id="index_body_left_search">
    	<div id="search_result">
    	<img id="search_r_pic" src="${pageContext.request.contextPath}/image/search_result.png" style="float:left;">
    	 <form action="${pageContext.request.contextPath}/jsp/homepage/search_result.jsp" method="post" onsubmit="return check();">
        	<div style="height: 42px;">
	        	<input id="search_r_w" type="text" name="search_w" placeholder=" 请输入你感兴趣的事物！（标题/标签）" >       
	        	<input  id="search_r_c" type="submit" value="搜索">
        	</div>
        	<div id="search_r_h">
        		
        	</div>
        </form>
        </div>
        <%
        	String word = request.getParameter("search_w");
        	String content = request.getParameter("content");
        	if(word!=null){
        		request.setAttribute("word", word);
        		List<ArticleBean> wlist = aService.fingAllAboutWord(word);
        		if(!wlist.isEmpty()){
        			request.setAttribute("wlist", wlist);
        		}else{
        %>
        	<h4>与“${word}”有关的博文</h4>
        	<div class="result_n" align="center">
        		<h4 style="padding-top: 80px;">暂无</h4>
            </div>
        <%
        		}
        	}else if(content!=null){
        		request.setAttribute("content", content);
        		List<ArticleBean> clist=aService.fingAllAboutWord(content);
        		if(!clist.isEmpty()){
        			request.setAttribute("clist", clist);
        		}else{
        %>
        	<h4>与“${content}”有关的博文</h4>
        	<div class="result_n" align="center">
        		<h4 style="padding-top: 80px;">暂无</h4>
            </div>
        <% 
        		}
        	}
        %>
        <c:if test="${not empty word && not empty wlist}">
        	<h4>与“${word}”有关的博文</h4>
        </c:if>
        <c:if test="${not empty content&& not empty clist}">
        	<h4>与“${content}”有关的博文</h4>
        </c:if>
    	<!--具体N篇文章begin-->
    	<c:if test="${not empty wlist}">
    	<c:forEach items="${wlist}" var="w">
    	<c:if test="${w.status!='屏蔽' }">
        <div class="result_n">
               <div class="result_pic">
                        <img  src="${w.cover}">
                        <a href="${pageContext.request.contextPath}/jsp/othercenter/othercenter.jsp?id=${w.author_id}" target="_blank"><span>${w.author}</span></a><br/>
                        <span>${w.publish_date }</span>
              </div>
               <div class="result_details">
                        <div id="result_details_h1">
                        <a href="${pageContext.request.contextPath}/jsp/article/article.jsp?id=${w.id}"><h1>${w.title}</h1></a>
                        </div>
                        <div id="result_details_p">	<a>
                        <p>${w.introduction}</p>
                        </a>
                        </div><br/>
                        <span>阅读：${w.click_num }&emsp;|</span>
	                    <span>评论：${w.comment_num }&emsp;|</span>
	                    <span>喜欢：${w.liked_num }&emsp;|</span>
	                    <span>收藏：${w.collect_num}</span>
               </div>
        </div>
        </c:if>
        </c:forEach>
    	</c:if>
    	
    	<c:if test="${not empty clist}">
    	<c:forEach items="${clist}" var="c">
    	<c:if test="${c.status!='屏蔽' }">
        <div class="result_n">
               <div class="result_pic">
                        <img  src="${c.cover}">
                        <a href="${pageContext.request.contextPath}/jsp/othercenter/othercenter.jsp?id=${c.author_id}" target="_blank"><span id="Homepage_username">${c.author}</span></a><br/>
                        <span>${c.publish_date }</span>
              </div>
               <div class="result_details">
                        <div id="result_details_h1">
                        <a href="${pageContext.request.contextPath}/jsp/article/article.jsp?id=${c.id}"><h1 id="Homepage_title">${c.title}</h1></a>
                        </div>
                        <div id="result_details_p">	<a>
                        <p>${c.introduction}</p>
                        </a>
                        </div><br/>
                        <span>阅读：${c.click_num }&emsp;|</span>
	                    <span>评论：${c.comment_num }&emsp;|</span>
	                    <span>喜欢：${c.liked_num }&emsp;|</span>
	                    <span>收藏：${c.collect_num}</span>
               </div>
        </div>
        </c:if>
        </c:forEach>
    	</c:if>
        <!--文章end-->
           
    </div>
</div>
<!--内容栏end-->
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
