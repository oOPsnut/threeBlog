<%@page import="com.threeblog.service.AdminService"%>
<%@page import="com.threeblog.serviceImpl.AdminServiceImpl"%>
<%@page import="com.threeblog.serviceImpl.UserServiceImpl"%>
<%@page import="com.threeblog.service.UserService"%>
<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page import="com.threeblog.domain.AdminBean"%>
<%@page import="com.threeblog.domain.ArticleTypeBean"%>
<%@page import="com.threeblog.serviceImpl.ArticleServiceImpl"%>
<%@page import="com.threeblog.service.ArticleService"%>
<%@page import="com.threeblog.domain.ArticleBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8"/>
    <title>ThreeBlog后台管理中心</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/ac-changeP.js"></script>
</head>
<%
	AdminBean adminBean = (AdminBean)request.getSession().getAttribute("adminBean");
	if(adminBean!=null){
		UserService uService= new UserServiceImpl();
    	AdminService adminService = new AdminServiceImpl();
		int countReports =  Integer.valueOf( adminService.countReports().toString());//举报数
		int countRenews =  Integer.valueOf( adminService.countRenews().toString());//反馈数
		int countMessages=countRenews+countReports;//消息总数
		request.setAttribute("countMessages", countMessages);
		request.setAttribute("countReports", countReports);
		request.setAttribute("countRenews", countRenews);
%>
<body>
<div class="topbar-wrap white">
    <div class="topbar-inner clearfix">
        <div class="topbar-logo-wrap clearfix">
            <h1 class="topbar-logo"><a href="javascript:;" class="navbar-brand"><img style="height: 45px;" src="${pageContext.request.contextPath}/image/logo.png"/></a></h1>
            <ul class="navbar-list clearfix">
                <li><a class="on" href="javascript:;">首页</a></li>
                <li><a href="${pageContext.request.contextPath}/RedirectServlet?method=homePageUI" target="_blank">Three Blog首页</a></li>
            </ul>
        </div>
        <div class="top-info-wrap">
            <ul class="top-info-list clearfix">
                <li><a href="${pageContext.request.contextPath}/admin/index/personalcenter.jsp">${adminBean.username}</a></li>
                <li><a href="${pageContext.request.contextPath}/AdminServlet?method=LoginOut">退出</a></li>
            </ul>
        </div>
    </div>
</div>
<div class="container clearfix">
    <div class="sidebar-wrap">
        <div class="sidebar-title">
            <h1>菜单</h1>
        </div>
        <div class="sidebar-content">
            <ul class="sidebar-list">
                <li>
                    <a href="javascript:;"><i class="icon-font">&#xe000;</i>常用操作</a>
                    <ul class="sub-menu">
                        <li><a href="${pageContext.request.contextPath}/admin/index/notice_publish.jsp"><i class="icon-font">&#xe002;</i>公告发布</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/index/notice_list.jsp"><i class="icon-font">&#xe005;</i>公告管理</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/index/user_manage.jsp"><i class="icon-font">&#xe003;</i>用户管理</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/index/article_classify.jsp"><i class="icon-font">&#xe006;</i>分类管理</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/index/photo_manage.jsp"><i class="icon-font">&#xe033;</i>图片管理</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/index/messagecenter.jsp"><i class="icon-font">&#xe004;</i>消息管理<span id="messageNum">${countMessages}</span></a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/index/reportcenter.jsp"><i class="icon-font">&#xe00a;</i>举报管理<span id="messageNum">${countReports}</span></a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/index/renew.jsp"><i class="icon-font">&#xe00e;</i>恢复管理<span id="messageNum">${countRenews}</span></a></li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="icon-font">&#xe018;</i>系统管理</a>
                    <ul class="sub-menu">
                        <li><a href="${pageContext.request.contextPath}/admin/index/personalcenter.jsp"><i class="icon-font">&#xe017;</i>个人中心</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/index/index.jsp"><i class="icon-font">&#xe00f;</i>数据统计</a></li>                        
                        <li><a href="${pageContext.request.contextPath}/admin/index/admin_manage.jsp"><i class="icon-font">&#xe014;</i>管理员管理</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/index/illegal_manage.jsp"><i class="icon-font">&#xe016;</i>违规词管理</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <!--/sidebar-->
    
<div class="main-wrap">

        <div class="crumb-wrap">
            <div class="crumb-list">
            	<i class="icon-font">&#xe000;</i>
            	<a href="${pageContext.request.contextPath}/admin/index/index.jsp">首页</a>
            	<span class="crumb-step">&gt;</span><span>分类管理</span>
            </div>
        </div>
        <div class="result-wrap">
            <div class="result-title">
                <h1>博文搜索</h1>
            </div>
            <div class="result-content">
		                <ul class="sys-info-list">
		                   <li align="center">
		                       <label class="res-lab ">标题/标签:</label><span class="res-info"><input  type="text" class="wid" id="sarticle" required/></span>
		                       <input type="submit" value="搜索" id="searchArticle" onclick="searchArticle()"/>
		                       <script type="text/javascript">
		                       		function searchArticle() {
										var content = $("#sarticle").val();//获取输入的用户名
										if (content=="") {
											$("#search-result").hide();
										} else {

										$.post("/ThreeBlog_V1.0/AdminServlet?method=SearchArticle",{content:content},function(data,status){
											//alert(data);
											if(data==1){
												$("#search-result").hide();
												alert("查询无结果！");
											}else{
												//alert(data);
												$("#search-result").show();
												$('#search-result').html(data);
											}
											});
										}
									}
		                       </script>
		                   </li>
		                 </ul>
            </div>  
        </div>
        <div  id="search-result">
       		
        </div>
        
        <div class="search-wrap">
            <div class="search-content">
                    <table class="search-tab">
                        <tr align="center">
                            <th width="120">选择分类:</th>
                            <td>
                                <select name="search-sort" id="ac-select" onchange="aTypeChange()">
                                    <option value="All" selected="selected">全部博文</option>
                                    <option value="默认分类">默认分类</option>
					            	<option value="个人心情">个人心情</option>
					            	<option value="杂乱无章">杂乱无章</option>
					            	<option value="休闲娱乐">休闲娱乐</option>
					            	<option value="游戏漫画">游戏漫画</option>
					            	<option value="旅游摄影">旅游摄影</option>
					            	<option value="时尚美食">时尚美食</option>
					            	<option value="校园青春">校园青春</option>
					            	<option value="媒体科技">媒体科技</option>
					            	<option value="体育健康">体育健康</option>
                                </select>
                            </td>
                        </tr>
                    </table>
            </div>
        </div>
        <div id="defaultDiv">
          <div class="result-wrap">
        	<div class="result-title">
                <h1>分类管理</h1>
            </div>
            <div class="result-content"> 
				<table class="result-tab" width="100%">
                        <tr>
                            <th>作者</th>
                            <th>标题</th>
                            <th>标签</th>
                            <th>点击数</th>
                            <th>喜欢数</th>
                            <th>收藏数</th>
                            <th>评论数</th>
                            <th>发布日期</th>
                            <th>类型</th>
                            <th>状态</th>
                            <th>操作</th>
                        </tr>
                        <%
                        	ArticleService aService = new ArticleServiceImpl();
                        	List<ArticleBean> list= aService.findAllACover();
                        	if(list.isEmpty()){
                        %>
                        <tr align="center">
                        	<td colspan="11" style="padding: 20px;"><strong>没有发布过文章！</strong></td>    
                        </tr>
                        <% 	                      
                        	}else{
                        		for(int i =0;i<list.size();i++){                     	
	                        		ArticleBean aBean= list.get(i);
	                        		request.setAttribute("aBean", aBean);
	                        		String aid = aBean.getId();
	                        		ArticleTypeBean aTypeBean = aService.findArticleType(aid);
	                        		request.setAttribute("aTBean", aTypeBean);         	
                        %>
                        <tr>
                            <td><a target="_blank" href="${pageContext.request.contextPath}/jsp/othercenter/othercenter.jsp?id=${aBean.author_id}">${aBean.author}</a>
                            <td><a target="_blank" href="${pageContext.request.contextPath}/jsp/article/article.jsp?id=${aBean.id}">${aBean.title }</a> 
                            <td><a target="_blank" href="${pageContext.request.contextPath}/jsp/homepage/search_result.jsp?content=${aBean.label}">${aBean.label}</a> 
                            <td>${aBean.click_num}</td>
                            <td>${aBean.liked_num}</td>
                            <td>${aBean.collect_num}</td>
                            <td>${aBean.comment_num}</td>
                            <td>${aBean.publish_date}</td>
                            <td>${aTBean.article_type}</td>
                            <td>${aBean.status}</td>
                            <td>
                                <a class="link-update" target="_blank" href="${pageContext.request.contextPath}/jsp/article/article.jsp?id=${aBean.id}">查看</a>
                                <a class="link-del" onclick="hideArticle('${aBean.id}')">屏蔽</a>
                                <script type="text/javascript">
                                	function hideArticle(id) {
										var aid=id;//文章id
										var s = confirm("你确定要屏蔽此文章吗？");
	        							if (s) {
	        								$.ajax({
	        									type:"POST",//用post方式传输
	        									dataType:"json",//数据格式:JSON
	        									url:"/ThreeBlog_V1.0/AdminServlet?method=HideArticle" ,//目标地址
	        									data:{"id":aid},
	        									error:function(){
	        										alert("出错！请稍后再试...");
	        									},
	        									success:function(data){
	        										if (data) {
	        											alert("屏蔽成功！");
	        											window.location.reload();
	        										} else {
	        											alert("屏蔽失败，本照片可能已处于屏蔽或非正常状态！");		
	        											window.location.reload();
	        										}
	        									}
	        								});
	        							}
									}
                                </script>
                            </td>
                        </tr>
                        <%}} %>
                    </table>
                  </div>
			</div>
        </div>
        <div id="srDiv">
		        
        </div>
    </div>
    <!--/main-->
</div>
</body>
<%	
	}else{
		response.sendRedirect(request.getContextPath()+"/admin/login/admin_login.jsp");
	}
%>
</html>