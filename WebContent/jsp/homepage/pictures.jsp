<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.threeblog.serviceImpl.UserServiceImpl"%>
<%@page import="com.threeblog.service.UserService"%>
<%@page import="com.threeblog.domain.UserBean"%>
<%@page import="com.threeblog.domain.ArticleBean"%>
<%@page import="java.util.List"%>
<%@page import="com.threeblog.serviceImpl.ArticleServiceImpl"%>
<%@page import="com.threeblog.service.ArticleService"%>
<%@page import="com.threeblog.domain.NoticeBean"%>
<%@page import="com.threeblog.serviceImpl.AdminServiceImpl"%>
<%@page import="com.threeblog.service.AdminService"%>
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
<meta name="toTop" content="true">
<title>画廊</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/homepage.css" type="text/css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/stylesheets/chromagallery.min.css">
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
        <%
    		AdminService adminService = new AdminServiceImpl();
    		NoticeBean noticeBean = adminService.findLatelyNotice();//找到最近一篇公告
    		request.setAttribute("noticeBean", noticeBean);
    	%>
        <!--公告-->
        <div id="index_body_notice">
        	<h3 >█ 公告</h3>
            <div id="body_notice_w">
            <span>【${noticeBean.publish_date} 公告】</span><br/><br/>
            <span>${noticeBean.content}</span><br/><br/>
            </div>
            <a href="${pageContext.request.contextPath}/jsp/homepage/notice_board.jsp?id=${noticeBean.id}"><span id="body_notice_detail">本告详情</span></a>
            <img src="${pageContext.request.contextPath}/image/notice.png">
            <a href="${pageContext.request.contextPath}/RedirectServlet?method=noticeBoardUI"><span id="body_notice_old">以往公告</span></a>
        </div>
        <!--日历-->
        <div id="index_body_calendar">
        	<div id="calendar" class="calendar"></div>
  			<script src="js/calendar.js"></script>
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
    <!--画廊begin-->
   	<div id="index_pictures_left">
    	
		<div class="content">
			<div class="chroma-gallery mygallery">
				<%
                	List<ArticleBean> list = aService.findArticleCover();
                	if(!list.isEmpty()){
                		request.setAttribute("list", list);
                	}
                %>
                <c:forEach items="${list }" var="l">
                	<img src="${l.cover }" alt="${l.label }" data-largesrc="${l.cover }">
                </c:forEach>
				<img src="${pageContext.request.contextPath}/images/thumbs/1.jpg" alt="New York" data-largesrc="${pageContext.request.contextPath}/images/1.jpg">
				<img src="${pageContext.request.contextPath}/images/thumbs/2.jpg" alt="湖畔" data-largesrc="${pageContext.request.contextPath}/images/2.jpg">
				<img src="${pageContext.request.contextPath}/images/thumbs/3.jpg" alt="潮" data-largesrc="${pageContext.request.contextPath}/images/3.jpg">
				<img src="${pageContext.request.contextPath}/images/thumbs/4.jpg" alt="猫头鹰" data-largesrc="${pageContext.request.contextPath}/images/4.jpg">
				<img src="${pageContext.request.contextPath}/images/thumbs/5.jpg" alt="灯塔" data-largesrc="${pageContext.request.contextPath}/images/5.jpg">
				<img src="${pageContext.request.contextPath}/images/thumbs/6.jpg" alt="城墙" data-largesrc="${pageContext.request.contextPath}/images/6.jpg">
				<img src="${pageContext.request.contextPath}/images/thumbs/7.jpg" alt="二哈" data-largesrc="${pageContext.request.contextPath}/images/7.jpg">
				<img src="${pageContext.request.contextPath}/images/thumbs/8.jpg" alt="城市" data-largesrc="${pageContext.request.contextPath}/images/8.jpg">
				<img src="${pageContext.request.contextPath}/images/thumbs/9.jpg" alt="猎豹" data-largesrc="${pageContext.request.contextPath}/images/9.jpg">
				<img src="${pageContext.request.contextPath}/images/thumbs/10.jpg" alt="落日" data-largesrc="${pageContext.request.contextPath}/images/10.jpg">
                <img src="${pageContext.request.contextPath}/images/thumbs/pic1.jpg" alt="小吃" data-largesrc="${pageContext.request.contextPath}/images/pic1.jpg">
                <img src="${pageContext.request.contextPath}/images/thumbs/pic2.jpg" alt="日本街景" data-largesrc="${pageContext.request.contextPath}/images/pic2.jpg">
                <img src="${pageContext.request.contextPath}/images/thumbs/pic3.jpg" alt="街景" data-largesrc="${pageContext.request.contextPath}/images/pic3.jpg">
                <img src="${pageContext.request.contextPath}/images/thumbs/pic4.jpg" alt="余晖" data-largesrc="${pageContext.request.contextPath}/images/pic4.jpg">
                <img src="${pageContext.request.contextPath}/images/thumbs/mao.jpg" alt="猫" data-largesrc="${pageContext.request.contextPath}/images/mao.jpg">
                <img src="${pageContext.request.contextPath}/images/thumbs/mao3.jpg" alt="爱宠" data-largesrc="${pageContext.request.contextPath}/images/mao3.jpg">
                <img src="${pageContext.request.contextPath}/images/thumbs/mao2.jpg" alt="cute" data-largesrc="${pageContext.request.contextPath}/images/mao2.jpg">
                
			</div>
		</div>
	

	
	
	<script src="${pageContext.request.contextPath}/dist/scripts/chromagallery.pkgd.min.js"></script>
	<script type="text/javascript">

		$(document).ready(function(){
			$(".mygallery").chromaGallery
		    ({
		        color:'#000',
		        gridMargin:15,
		        maxColumns:5,
		        dof:true,
		        screenOpacity:0.8
		    });
		});
		
	</script>
    </div>
    <!--左侧栏end-->
</div>
<!--内容栏end-->
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
