<%@page import="com.threeblog.serviceImpl.ArticleServiceImpl"%>
<%@page import="com.threeblog.service.ArticleService"%>
<%@page import="com.threeblog.serviceImpl.UserServiceImpl"%>
<%@page import="com.threeblog.service.UserService"%>
<%@page import="com.threeblog.domain.*" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 
	//判断session中是否存在aBean、aTypeBean
	ArticleBean aBean = (ArticleBean)request.getSession().getAttribute("aBean");
	ArticleTypeBean aTypeBean = (ArticleTypeBean)request.getSession().getAttribute("aTypeBean");
	String author_id=null;
	if(aBean!=null && aTypeBean!=null){
		//从aBean中取文章id、作者id
		String id = aBean.getId();
		author_id= aBean.getAuthor_id();	
		//从aTypeBean中取文章类型
		String article_Type = aTypeBean.getArticle_type();
	}else{
		//从地址栏获取文章id
		String id =  request.getQueryString().substring(3);
		//通过文章id获取作者id
		ArticleService aService = new ArticleServiceImpl();
		ArticleBean aBean2 =  aService.findArticle(id);		
		author_id = aBean2.getAuthor_id();
		//通过文章id获取文章类型
		ArticleTypeBean aTypeBean2 = aService.findArticleType(id);
		//讲文章信息和文章类型放到session中
		request.getSession().setAttribute("aBean", aBean2);
		request.getSession().setAttribute("aTypeBean", aTypeBean2);
	}
	//通过作者id取作者的头像、名字
	UserService uService = new UserServiceImpl();
	UserBean author = uService.findUserInfo(author_id);
	//将作者的信息放到session中
	request.getSession().setAttribute("author", author);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<div id="article_all">
	<div id="article_all_content">
    	<!--文章up-->
        <div class="article_a_up">
        	<h2>${aBean.title }</h2>
            <div id="a_up_info">
            <c:if test="${userBean.id }==${aBean.author_id }">
            <a href="${pageContext.request.contextPath}/RedirectServlet?method=personalCenterUI">
              <img src="${author.head }"/>
              <span>${aBean.author}</span>
           	</a>
           	</c:if>
           	<c:if test="${userBean.id }!=${aBean.author_id }">
            <a href="${pageContext.request.contextPath}/jsp/othercenter/otherscenter.jsp?id=${author.id}">
              <img src="${author.head }"/>
              <span>${aBean.author}</span>
           	</a>
           	</c:if>
                        <span>${aBean.publish_date}</span>
                        <span>分类 : </span><span><strong>${aTypeBean.article_type }</strong></span>
                        <span>标签 : </span><a href="#" id="article_a_up_a">&lt;${aBean.label}&gt;</a>
                        <span>阅读 : </span><span>${aBean.click_num}</span>
            </div>
        </div>
        <!--文章middle-->
        <div class="article_a_middle">${aBean.text}</div>
        <!--文章down-->
        <div class="article_a_down" >
        	<div id="a_down_lead">
            	<a href="#" style="float:left;">◁上一篇  所有的你</a>
       		 	<a href="#" style="float:right">▷下一篇  没有了</a><br>
            </div>
            <div id="a_down_tools">
            	<div id="tools_like">
            		<img  id="like" src="${pageContext.request.contextPath}/image/unlike.png"  title="喜欢">
                    <span>喜欢</span>
                    <span id="slike">${aBean.liked_num }</span>
                    <!--喜欢图标更换的js-->
                    <script>
                    $('#like').click(function(){  
                              
                            if($('#like').attr('src')=='${pageContext.request.contextPath}/image/unlike.png'){  
                                $('#like').attr('src','${pageContext.request.contextPath}/image/like.png');  
                            }else{ 
                                $('#like').attr('src','${pageContext.request.contextPath}/image/unlike.png');  
                            }  
                    
                              
                    });  
                    </script>  
                </div>
                <div id="tools_favor">
        			<img  id="favor" src="${pageContext.request.contextPath}/image/unfavor.png" title="收藏"/>
                    <span>收藏</span>
                    <span>xxx</span>
                    
        			<!--收藏图标更换的js-->
                    <script>
                    $('#favor').click(function(){  
                              
                            if($('#favor').attr('src')=='image/unfavor.png'){  
                                $('#favor').attr('src','image/favor.png');  
                            }else{ 
                                $('#favor').attr('src','image/unfavor.png');  
                            }  
                    
                              
                    });  
                    </script>
        		</div>
                <div id="tools_share">	
                		<img src="${pageContext.request.contextPath}/image/share.png" id="share" onClick="copyLink();" title="分享">
        				<span>分享</span>
                        <!--分享js-->
                        <script>
                        	function copyLink(){
								 var clipBoardContent="";
								 clipBoardContent+=document.title;
								 clipBoardContent+="";
								 clipBoardContent+=this.location.href;
								 window.clipboardData.setData("Text",clipBoardContent);
								 alert("复制成功，请粘贴到你的QQ/WeChat上推荐给你的好友");
							}	
                        </script>
        		</div>
                <div id="tools_report">
        				<a href="${pageContext.request.contextPath}/RedirectServlet?method=AreportCenterUI">
        				<img src="${pageContext.request.contextPath}/image/report.png" id="report" title="举报">
        				<span>举报</span>
        			</a>
        		</div>
            </div>
        </div>
        <!--评论/回复区域-->
        <div class="article_a_discuss">
        	<div class="commentAll">
					<!--评论区域 begin-->
					<div class="reviewArea clearfix">
						<div class="flex-text-wrap">
							<pre class="pre">
								<span></span><br>
							</pre>
							<textarea class="content comment-input" placeholder="留下你的评论..."
								onkeyup="keyUP(this)"></textarea>
						</div>
						<a href="javascript:;" class="plBtn">评论</a>
					</div>
					<!--评论区域 end-->
					<!--回复区域 begin-->
					<div class="comment-show">

						<%
							ArrayList<Comment> comments = service.getCommentsFromArticle_id(article_id);
							SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//定义格式，不显示毫秒
							int i;
							if(!comments.isEmpty()){
								for (i = 0; i < comments.size(); i++) {
									Comment comment = comments.get(i);
									User comment_author = service.getUserFromId(comment.getAuthor_id());
						%>
						<!--1-->
						<div class="comment-show-con clearfix">
							<!--这是头像div-->
							<div class="comment-show-con-img pull-left">
							<a href="${pageContext.request.contextPath}/jsp/other_center/otherscenter.jsp?id=<%=comment.getAuthor_id()%>">
								<img src="<%=comment_author.getTouxiang()%>" alt="">
							</a>
							</div>
                            <!--这是内容div-->
							<div class="comment-show-con-list pull-left clearfix">
								<div class="pl-text clearfix">
									<!--用户名-->
									<a href="${pageContext.request.contextPath}/jsp/other_center/otherscenter.jsp?id=<%=comment.getAuthor_id()%>" class="comment-size-name"
										data="<%=comment.getId()%>"><%=comment_author.getUsername()%> : </a>
									<!--评论内容 -->
									<%if(!comment.getStatus().equals("屏蔽")){ %>	
									<span class="my-pl-con"><%=comment.getText()%></span>
									<%}else{ %>
									<span class="my-pl-con">该评论涉嫌违规内容，已被屏蔽！！</span>
									<%} %>
								</div>
								<div class="date-dz">
									<span class="date-dz-left pull-left comment-time"><%=df.format(comment.getAdd_time())%></span>
									<div class="date-dz-right pull-right comment-pl-block">
										
										<a href="javascript:;" class="removeBlock">举报</a>
										<%if(comment_author.getId()==user_id){ %>
										<a href="javascript:;" class="delete">删除</a>
										<%} %>
										<a href="javascript:;" class="date-dz-pl pl-hf pull-left">回复</a>
										<span class="pull-left date-dz-line">|</span>
										<!--赞-->
										<a href="javascript:;" class="date-dz-z pull-left"><i
											class="date-dz-z-click-red"></i>赞 (<i class="z-num"><%=comment.getZan() %></i>)</a>
									</div>
									
								</div>
                                
								<div class="hf-list-con">

						<!-- 评论回复内容区域begin -->

									<%
										ArrayList<Answer> answers=service.getAnswersFromArticle_idComment_id(comment.getId());
										for(int j=0;j<answers.size();j++){
											Answer answer=answers.get(j);
											User answer_author=service.getUserFromId(answer.getAuthor_id());
									%>

									<div class="all-pl-con">
										<div class="pl-text hfpl-text clearfix">
											<a href="${pageContext.request.contextPath}/jsp/other_center/otherscenter.jsp?id=<%=answer.getAuthor_id()%>" class="comment-size-name" data="<%=answer.getId()%>"><%=answer_author.getUsername() %> : </a> 
											
											<%if(!answer.getStatus().equals("屏蔽")){ %>
											<span class="my-pl-con"> &nbsp;<%=answer.getText() %></span>
											<%}else{ %>
											<span class="my-pl-con"> &nbsp;该回复涉嫌违规内容，已被屏蔽！！</span>
											<%} %>
										</div>
										<div class="date-dz">
											<span class="date-dz-left pull-left comment-time"><%=df.format(answer.getAdd_time() )%></span>
											<div class="date-dz-right pull-right comment-pl-block">
												
												<a href="javascript:;" class="removeBlock">举报</a>
												<%if(answer_author.getId()==user_id){ %>
												<a href="javascript:;" class="delete">删除</a>
												<%} %>
												<a href="javascript:;"
													class="date-dz-pl pl-hf hf-con-block pull-left">回复</a> <span
													class="pull-left date-dz-line">|</span> <a
													href="javascript:;" class="date-dz-z pull-left"> <i
													class="date-dz-z-click-red"></i>赞 (<i class="z-num"><%=answer.getZan() %></i>)
												</a>
											</div>
						
                                    </div>
                                    <!-- 评论回复内容区域end -->	
									</div>
									<%} %>


									

								</div>
							</div>
						</div>
						<%
							}
							}
						%>






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
						if (len > 139) {
							$(t).val($(t).val().substring(0, 140));
						}
					}
				</script>
		<!--点击评论创建评论条-->
		<%if(login_flag){ %>
		<script type="text/javascript">
					$('.commentAll')
							.on(
									'click',
									'.plBtn',
									function() {
										//获取输入内容
										var oHtml;
										var oSize = $(this).siblings(
												'.flex-text-wrap').find(
												'.comment-input').val();
										console.log(oSize);
										//动态创建评论模块
										
										if (oSize.replace(/(^\s*)|(\s*$)/g, "") != '') {
											
											
											var url = "${pageContext.request.contextPath}/servlet/AddComment";
											var args = {
													
											
												"article_id" : "${aBean.id}",	//文章id
												"author_id":"${userBean.id}",    //从页面获得的用户id
												"receiver_id":"${aBean.author_id}",		//从文章id获得的作者id
												"text1":"${aBean.title}",  //文章标题
												"text2":oSize,                      //评论内容
												"time" : new Date()
											};
											$.ajaxSettings.async = false;  
											$.get(url, args,
													function(data) {
													var result=eval("("+data+")");
														var comment_id=result.comment_id;
														console.log(comment_id);
														var add_time=result.add_time;
														console.log(add_time);
												     	oHtml = '<div class="comment-show-con clearfix"><div class="comment-show-con-img pull-left" ><a href="${pageContext.request.contextPath}/jsp/other_center/otherscenter.jsp?id=<%=user_id%>"><img src="<%=user.getTouxiang()%>"</a>  alt=""></div> <div class="comment-show-con-list pull-left clearfix"><div class="pl-text clearfix"> <a href="${pageContext.request.contextPath}/jsp/other_center/otherscenter.jsp?id=<%=user_id%>" class="comment-size-name" data="'
															+comment_id+
														'"><%=user.getUsername()%> : </a> <span class="my-pl-con">&nbsp;'
															+ oSize
															+ '</span> </div> <div class="date-dz"> <span class="date-dz-left pull-left comment-time">'
															+ add_time
															+ '</span> <div class="date-dz-right pull-right comment-pl-block"><a href="javascript:;" class="removeBlock">举报</a><a href="javascript:;" class="delete">删除</a> <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a> <span class="pull-left date-dz-line">|</span> <a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">0</i>)</a> </div> </div><div class="hf-list-con"></div></div> </div>';
														
												     
											}); 
											$.ajaxSettings.async = true;  
											
											$(this).parents('.reviewArea ')
											.siblings('.comment-show')
											.prepend(oHtml);
											$(this).siblings('.flex-text-wrap')
											.find('.comment-input')
											.prop('value', '')
											.siblings('pre').find(
													'span').text('');
											
											
											
											
											
										}
									});
				</script>
				<%}else{ %>
				<script type="text/javascript">
					$('.commentAll')
							.on(
									'click',
									'.plBtn',
									function() {
										window.location.href='${pageContext.request.contextPath}/jsp/login/sign_in.jsp';
									});
				</script>
				<%} %>


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
		<%if(login_flag){ %>
		<script type="text/javascript">
					$('.comment-show')
							.on(
									'click',
									'.hf-pl',
									function() {
										var oThis = $(this);
										//获取输入内容
										var oHfVal = $(this).siblings(
												'.flex-text-wrap').find(
												'.hf-input').val();
										console.log("oHfVal");
										console.log(oHfVal)
										var oHfName = $(this)
												.parents('.hf-con').parents(
														'.date-dz').siblings(
														'.pl-text').find(
														'.comment-size-name')
												.html();
										
										var alltext=$(this)
										.parents('.hf-con').parents(
										'.date-dz').siblings(
										'.pl-text').html();
										console.log("alltext:");
										console.log(alltext);
										var flag;
										var comment_id;
										var answer_id=$(this)
										.parents('.hf-con').parents(
										'.date-dz').siblings(
										'.pl-text').find(
										'.comment-size-name').attr("data");
										if(alltext.indexOf("@")==-1){
											flag=1;//代表comment_id和answer_id是相重叠的
											comment_id = $(this)
											.parents('.hf-con').parents(
													'.date-dz').siblings(
													'.pl-text').find(
													'.comment-size-name').attr("data");
											console.log("comment_id:");
											console.log(comment_id);
											
										}else{
										flag=0;//代表comment_id和answer_id是不相重叠的
										comment_id = $(this)
										.parents('.hf-con').parents(
												'.date-dz').parents('.all-pl-con').parents('.hf-list-con').
												siblings(
												'.pl-text').find(
												'.comment-size-name').attr("data");
										console.log("comment_id:");
										console.log(comment_id);
								
										
										}
										var username="<%=user.getUsername()%>"+" : ";
										
										
										if(oHfName==username){
											alert("想对自己说什么话，憋在心里就好了");
											oThis
											.parents(
													'.hf-con')
											.siblings(
													'.date-dz-right')
											.find(
													'.pl-hf')
											.addClass(
													'hf-con-block')
											&& oThis
													.parents(
															'.hf-con')
													.remove();
													return false;
										}
										
										var oAllVal = '回复@' + oHfName;
										if (oHfVal.replace(/^ +| +$/g, '') == ''
												|| oHfVal == oAllVal) {

										} else {
											$
													.getJSON(
															"${pageContext.request.contextPath}/json/pl.json",
															function(data) {
																var oAt = '';
																var oHf = '';
																$
																		.each(
																				data,
																				function(
																						n,
																						v) {
																					delete v.hfContent;
																					delete v.atName;
																					var arr;
																					var ohfNameArr;
																					if (oHfVal
																							.indexOf("@") == -1) {
																						data['atName'] = '';
																						data['hfContent'] = oHfVal;
																					} else {
																						arr = oHfVal
																								.split(':');
																						ohfNameArr = arr[0]
																								.split('@');
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
																var url = "${pageContext.request.contextPath}/servlet/AddAnswer";
																var args = {
																	"author_id":"<%=user.getId()%>",
																	"comment_id":comment_id,
																	"flag":flag,
																	"last_answer_id":answer_id,
																	"article_id":"<%=article.getId()%>",
																	"text2":oAt,
																	"time" : new Date()
																};
																console.log("1");
																console.log(oAt);
																$.ajaxSettings.async = false;  
																$.get(url, args,
																		function(data) {
																		var result=eval("("+data+")");
																			var answer_id=result.answer_id;
																			console.log("answer_id");
																			console.log(answer_id);
																			var add_time=result.add_time;
																			console.log(add_time);
																			oHtml= '<div class="all-pl-con"><div class="pl-text hfpl-text clearfix"><a href="${pageContext.request.contextPath}/jsp/other_center/otherscenter.jsp?id=<%=user_id%>" class="comment-size-name" data="'
																				+answer_id+
																				'"><%=user.getUsername()%> : </a><span class="my-pl-con">'
																				+ oAt
																				+ '</span></div><div class="date-dz"> <span class="date-dz-left pull-left comment-time">'
																				+ add_time
																				+ '</span> <div class="date-dz-right pull-right comment-pl-block"> <a href="javascript:;" class="removeBlock">举报</a><a href="javascript:;" class="delete">删除</a><a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a> <span class="pull-left date-dz-line">|</span> <a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">0</i>)</a> </div> </div></div>';
																			
																	     
																}); 
																$.ajaxSettings.async = true;  
																
																
																
																		
																		
																		
																		
																		
																		
																		oThis
																		.parents(
																				'.hf-con')
																		.parents(
																				'.comment-show-con-list')
																		.find(
																				'.hf-list-con')
																		.css(
																				'display',
																				'block')
																		.prepend(
																				oHtml)
																		&& oThis
																				.parents(
																						'.hf-con')
																				.siblings(
																						'.date-dz-right')
																				.find(
																						'.pl-hf')
																				.addClass(
																						'hf-con-block')
																		&& oThis
																				.parents(
																						'.hf-con')
																				.remove();
																
																		
															});
										}
									});
				</script>
				<%}else{ %>
				<script type="text/javascript">
					$('.comment-show')
							.on(
									'click',
									'.hf-pl',
									function() {
										window.location.href='${pageContext.request.contextPath}/jsp/login/sign_in.jsp';
									});
				</script>
				<%} %>
		<!--举报评论块  -->
		<%if(login_flag){ %>
		<script type="text/javascript">
					 $('.commentAll').on('click','.removeBlock',function(){
						 	var alltext=$(this)
							.parents('.date-dz-right').parents(
							'.date-dz').siblings(
							'.pl-text').html();
						 	var article_id="<%=article_id%>";
							var comment_id = $(this)
							.parents('.date-dz-right').parents(
							'.date-dz').siblings(
							'.pl-text').find(
							'.comment-size-name').attr("data");
							if(alltext.indexOf("@")==-1){	
								<!--举报的是评论 -->
								window.location.href='${pageContext.request.contextPath}/jsp/report_center/reportcenter_comment.jsp?article_id='+article_id+"&comment_id="+comment_id;
	
							}else{
								<!--举报的是回复 -->
								window.location.href='${pageContext.request.contextPath}/jsp/report_center/reportcenter_answer.jsp?article_id='+article_id+"&answer_id="+comment_id;
							
							}

					}) 
				</script>
				<%}else{ %>
				<script type="text/javascript">
					 $('.commentAll').on('click','.removeBlock',function(){
						 	var alltext=$(this)
							.parents('.date-dz-right').parents(
							'.date-dz').siblings(
							'.pl-text').html();
						 	var article_id="<%=article_id%>";
							var comment_id = $(this)
							.parents('.date-dz-right').parents(
							'.date-dz').siblings(
							'.pl-text').find(
							'.comment-size-name').attr("data");
							if(alltext.indexOf("@")==-1){	
								<!--举报的是评论 -->
								window.location.href='${pageContext.request.contextPath}/jsp/login/sign_in.jsp';
	
							}else{
								<!--举报的是回复 -->
								window.location.href='${pageContext.request.contextPath}/jsp/login/sign_in.jsp';
							
							}

					}) 
				</script>
				<%} %>
		<!--删除评论块-->
		<script type="text/javascript">
		    $('.commentAll').on('click','.delete',function(){
		        
		    	 var oT = $(this).parents('.date-dz-right').parents('.date-dz').parents('.all-pl-con');
		    	 var flag=2;
		        var alltext=$(this)
				.parents('.date-dz-right').parents(
				'.date-dz').siblings(
				'.pl-text').html();
		        var comment_id = $(this)
				.parents('.date-dz-right').parents(
				'.date-dz').siblings(
				'.pl-text').find(
				'.comment-size-name').attr("data");
		        
		        if(alltext.indexOf("@")==-1){	
					<!--删除的是评论 -->
					var url = "${pageContext.request.contextPath}/servlet/DeleteComment";
					 var args={
				        		"comment_id" : comment_id,
								"time" : new Date()
				        }
					 
						 $.ajaxSettings.async = false; 
				        $.get(url, args,
								function(data) {
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
					var url = "${pageContext.request.contextPath}/servlet/DeleteAnswer";
					var args={
			        		"answer_id" : comment_id,
							"time" : new Date()
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
		                $(this).parents('.date-dz-right').parents('.date-dz').parents('.all-pl-con').parents('.hf-list-con').css('display','none')
		                oT.remove();
		            }
		            $(this).parents('.date-dz-right').parents('.date-dz').parents('.comment-show-con-list').parents('.comment-show-con').remove();
		        }
		        
		        
		    })
		</script>		
				
		<!--点赞-->
		<script type="text/javascript">
					$('.comment-show').on(
							'click',
							'.date-dz-z',
							function() {
								var zNum = $(this).find('.z-num').html();
								var status;
								if ($(this).is('.date-dz-z-click')) {
									zNum--;
									status="取消点赞";
									$(this).removeClass('date-dz-z-click red');
									$(this).find('.z-num').html(zNum);
									$(this).find('.date-dz-z-click-red')
											.removeClass('red');
								} else {
									zNum++;
									status="点赞";
									$(this).addClass('date-dz-z-click');
									$(this).find('.z-num').html(zNum);
									$(this).find('.date-dz-z-click-red')
											.addClass('red');
								}
					
								var alltext=$(this)
								.parents('.date-dz-right').parents(
								'.date-dz').siblings(
								'.pl-text').html();
								var comment_id = $(this)
								.parents('.date-dz-right').parents(
								'.date-dz').siblings(
								'.pl-text').find(
								'.comment-size-name').attr("data");
								var sender_id="<%=user_id%>";
								var article_id="<%=article_id%>"
								if(alltext.indexOf("@")==-1){		
									<!--点赞的是评论表 -->
									var url = "${pageContext.request.contextPath}/servlet/AddZanToComment";
									var args = {
										"comment_id":comment_id,
										"sender_id":sender_id,
										"article_id":article_id,
										"status":status,
										"zan":zNum,
										"time" : new Date()
									};
									$.ajaxSettings.async = false;  
									$.get(url, args); 
									$.ajaxSettings.async = true;  					
								}else{
								
									var url = "${pageContext.request.contextPath}/servlet/AddZanToAnswer";
									var args = {
										"comment_id":comment_id,
										"sender_id":sender_id,
										"article_id":article_id,
										"status":status,
										"zan":zNum,
										"time" : new Date()
									};
									$.ajaxSettings.async = false;  
									$.get(url, args); 
									$.ajaxSettings.async = true;  
								
								}
					
								
								
							})
				</script>
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
