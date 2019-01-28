<%@page import="com.threeblog.domain.AnswerBean"%>
<%@page import="com.threeblog.domain.CommentBean"%>
<%@page import="com.threeblog.domain.UserBean"%>
<%@page import="com.threeblog.serviceImpl.UserServiceImpl"%>
<%@page import="com.threeblog.service.UserService"%>
<%@page import="com.threeblog.domain.ArticleBean"%>
<%@page import="com.threeblog.serviceImpl.ArticleServiceImpl"%>
<%@page import="com.threeblog.service.ArticleService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="toTop" content="true">
<title>留言回复举报</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/homepage.css" type="text/css"/>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/report.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/messagecenter.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/personalcenter.css" type="text/css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/calendar.css">
<link href="${pageContext.request.contextPath}/css/owl.carousel.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/checkReport.js"></script>
<script src="${pageContext.request.contextPath}/js/class.js"></script>
<script src="${pageContext.request.contextPath}/js/MsgBox.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/owl.carousel.js"></script>
<!-- 清空举报理由 -->
<script type="text/javascript">
function resetForm() {
	$("#answer").val("");
	$("#all_reason").val("");
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
                	<span  id="tools_messagenumber">0</span>
             </div>
         </a> 
         <ul class="index_tools_messages">
         	<li><a href="${pageContext.request.contextPath}/RedirectServlet?method=reviewsUI">评论消息</a><span   class="index_tools_messagesnumber"style="top:20px;" >0</span></li>
	        <li><a href="${pageContext.request.contextPath}/RedirectServlet?method=followUI">关注消息</a><span  class="index_tools_messagesnumber" style="top:80px; ">0</span></li>
	        <li><a href="${pageContext.request.contextPath}/RedirectServlet?method=favorUI">收藏消息</a><span  class="index_tools_messagesnumber" style="top:140px;" >0</span></li>
	        <li><a href="${pageContext.request.contextPath}/RedirectServlet?method=zanUI">点赞消息</a><span  class="index_tools_messagesnumber" style=" top:200px;" >0</span></li>
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
		<%
			//获取地址栏的文章id和留言/回复id
			String aid = request.getParameter("article_id");//文章id
			String comment_id = request.getParameter("comment_id");//留言id
			String answer_id = request.getParameter("answer_id");//回复id
			
			UserService uService =new UserServiceImpl();
			ArticleService aService =new ArticleServiceImpl();
			ArticleBean aBean = aService.findArticle(aid);//对应文章信息
			request.setAttribute("aBean", aBean);
			String author_id = aBean.getAuthor_id();//文章作者id
			UserBean uBean = uService.findUserInfo(author_id);//文章作者信息
			request.setAttribute("uBean", uBean);
			if(comment_id!=null){
				CommentBean comment = aService.getCommentFromComment_id(comment_id);
				String caId = comment.getAuthor_id();//留言者id   CommentAuthor
				UserBean caBean = uService.findUserInfo(caId);
				request.setAttribute("comment", comment);
				request.setAttribute("caBean", caBean);
			}
			if(answer_id!=null){
				AnswerBean answer = aService.getAnswertFromAnswer_id(answer_id);
				String aaId = answer.getAuthor_id();//回复者id   AnswerAuthor
				UserBean aaBean = uService.findUserInfo(aaId);
				request.setAttribute("answer", answer);
				request.setAttribute("aaBean", aaBean);
			}
		%>
        <div id="report_all">
           	<h3>█ 举报</h3>
            <form action="${pageContext.request.contextPath}/ReportServlet?method=ReviewsReport" method="post">
            <div id="report_article">
            	<!--举报博文up-->
            	<div id="report_a_up">
                	<span>您要举报的是 </span>&ensp;
        			<a href="${pageContext.request.contextPath}/jsp/othercenter/othercenter.jsp?id=${uBean.id}" target="_blank"><u> ${uBean.username } </u></a>
        			&ensp;<span>发表的</span>&ensp;
        			<a href="${pageContext.request.contextPath}/jsp/article/article.jsp?id=${aBean.id}" target="_blank"><u>《${aBean.title}》</u></a>
                    <span>中</span>&ensp;
                    <c:if test="${not empty caBean }">
                    	<input type="hidden" name="author_id" value="${caBean.id}" />
                    	<input type="hidden" name="username" value="${caBean.username}" />
                    	<a href="${pageContext.request.contextPath}/jsp/othercenter/othercenter.jsp?id=${caBean.id}" target="_blank"><u> ${caBean.username } </u></a>
                    </c:if>
                    <c:if test="${not empty aaBean }">
                    	<input type="hidden" name="author_id" value="${aaBean.id}" />
                    	<input type="hidden" name="username" value="${aaBean.username}" />
                    	<a href="${pageContext.request.contextPath}/jsp/othercenter/othercenter.jsp?id=${aaBean.id}" target="_blank"><u> ${aaBean.username } </u></a>
                    </c:if>
                    &ensp;<span>发表的评论</span>
        			&ensp;,&ensp;<span>其摘要如下</span>：&ensp;<br/><br/>
        			<c:if test="${not empty comment }">  
        				<input type="hidden" name="flag" value="comment" />    				
                    	<input type="hidden" name="content_id" value="${comment.id}" />
        				<textarea name="content" required>${comment.text}</textarea>
        			</c:if>
        			<c:if test="${not empty answer}">
        				<input type="hidden" name="flag" value="answer" />
        				<input type="hidden" name="content_id" value="${answer.id}" />
        				<textarea name="content" required>${answer.text.substring(answer.text.indexOf(":",answer.text.indexOf(":")+1)+3)}</textarea>
        			</c:if>
                </div>
                <!--举报博文middle-->
            	<div id="report_a_middle">
                	<span>选择举报类型（必选）：</span>
                    <br/><br/>
        			<input class="middle_report_class" type="radio" name="radio" onclick="check(this.value)" value="色情" checked="checked">色情&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                    <input type="radio" name="radio" onclick="check(this.value)" value="广告" class="middle_report_class">广告
                    <br/><br/>
                    <input type="radio" name="radio" onclick="check(this.value)" value="虚假信息" class="middle_report_class">虚假信息&emsp;&emsp;&emsp;&emsp;
                    <input type="radio" name="radio" onclick="check(this.value)" value="违反社会主义核心价值观" class="middle_report_class" >违反社会主义核心价值观
                    <br/><br/>
                    <input type="radio" name="radio" onclick="check(this.value)" value="其他（请在此输入）" class="middle_report_class">其他
                    <br/><br/>
                   <span> 您的选择是：</span>
                   <input type="text" id="answer" size="50" placeholder="若选择其他，可直接在此填写（必填）" name="answer" required>
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
                    <input type="hidden" name="url" value="${pageContext.request.contextPath}/jsp/article/article.jsp?id=${aBean.id}" />
        			<textarea placeholder="详细违规理由（必填）" name="all_reason" id="all_reason" required></textarea>
                </div>
                <div id="report_a_click" align="center">
                
        		<input type="reset" value="取消" id="click_reset" onclick="resetForm()"/>
                <input type="submit" value="提交" id="click_submit" onclick="return checkReviews();"/>
        		</div>
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
