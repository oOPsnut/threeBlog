<%@page import="com.threeblog.serviceImpl.AdminServiceImpl"%>
<%@page import="com.threeblog.service.AdminService"%>
<%@page import="com.threeblog.domain.AblumBean"%>
<%@page import="com.threeblog.domain.UserBean"%>
<%@page import="com.threeblog.serviceImpl.UserServiceImpl"%>
<%@page import="com.threeblog.service.UserService"%>
<%@page import="com.threeblog.domain.ArticleBean"%>
<%@page import="java.util.List"%>
<%@page import="com.threeblog.serviceImpl.ArticleServiceImpl"%>
<%@page import="com.threeblog.service.ArticleService"%>
<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page import="com.threeblog.domain.AdminBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8"/>
    <title>ThreeBlog后台管理中心</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-rebox.css"/>
	<script src="${pageContext.request.contextPath}/js/jquery-1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery-rebox.js"></script>
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
            	<span class="crumb-step">&gt;</span><span>图片管理</span>
            </div>
        </div>
        <!-- 文章封面管理 -->
        <div class="result-wrap">
            <div class="result-title">
                <h1>文章封面管理</h1>
            </div>
            <div class="result-content content-overflow">
                <div id="gallery2" class="gallery"> 	
                	<%
                		ArticleService aService = new ArticleServiceImpl();
                		List<ArticleBean> list = aService.findAllACover();//查找所有文章信息，包括封面（需要其中的封面）
                		if(list.isEmpty()){
                    %>
                     <div align="center">
                     	<p><strong>未查找到任何封面</strong></p>
                     </div>
                    <% 	
                    	}else{
                    		for(int i = 0;i<list.size();i++){
                    			ArticleBean aBean = list.get(i);
                    			request.setAttribute("aBean", aBean);
                    %>     
                    <c:if test="${aBean.status!='屏蔽' }">
                    	<div class="photoManage" align="center">  
	                     	<a href="${aBean.cover }" title="${aBean.label }"><div class="gallery_div" style="background:url(${aBean.cover }) no-repeat center;"></div></a>
	                     	<input type="button" class="changeInput" value="涉违更换" onclick="changeACover('${aBean.id}')"> 
	                     	<script type="text/javascript">
	                     		function changeACover(id) {
									var aid = id;//文章id
									var s = confirm("你确定要更换此图吗？");
									if (s) {
										$.ajax({
											type:"POST",//用post方式传输
											dataType:"json",//数据格式:JSON
											url:"/ThreeBlog_V1.0/AdminServlet?method=ChangeACover" ,//目标地址
											data:{"id":aid},
											error:function(){
												alert("出错！请稍后再试...");
											},
											success:function(data){
												if (data) {
													alert("更换成功！");
													window.location.reload();
												} else {
													alert("更换失败，本文可能处于屏蔽或非正常状态！");		
													window.location.reload();
												}
											}
										});
									}
							}
	                     	</script>
                      	</div>
                      	</c:if>
                    <%}} %>
                     
                <script type="text/javascript">
                	$('#gallery2').rebox({ selector: 'a' });
                </script>
                </div>
            </div>
        </div>      
        <!--用户头像管理-->
        <div class="result-wrap">
            <div class="result-title">
                <h1>用户头像管理</h1>
            </div>
            <div class="result-content content-overflow" >
                <div id="gallery3" class="gallery"> 	
                	<%
                		List<UserBean> uBeans = uService.fingAllUser();//查找所有用户信息，包括头像（需要其中的头像）
                		if(uBeans.isEmpty()){
                    %>
                     <div align="center">
                     	<p><strong>未查找到任何头像</strong></p>
                     </div>
                    <% 	
                    	}else{
                    		for(int i = 0;i<uBeans.size();i++){
                    			UserBean uBean = uBeans.get(i);
                    			request.setAttribute("uBean", uBean);
                    %>     
                    	<div class="photoManage" align="center">  
	                     	<a href="${uBean.head }" title="${uBean.username }"><div class="gallery_div" style="background:url(${uBean.head }) no-repeat center;"></div></a>
	                     	<input type="button" class="changeInput" value="涉违更换" onclick="changeUHead('${uBean.id}')"> 
	                     	<script type="text/javascript">
	                     		function changeUHead(id) {
									var uid = id;//用户id
									var s = confirm("你确定要更换此图吗？");
									if (s) {
										$.ajax({
											type:"POST",//用post方式传输
											dataType:"json",//数据格式:JSON
											url:"/ThreeBlog_V1.0/AdminServlet?method=ChangeUserHead" ,//目标地址
											data:{"id":uid},
											error:function(){
												alert("出错！请稍后再试...");
											},
											success:function(data){
												if (data) {
													alert("更换成功！");
													window.location.reload();
												} else {
													alert("更换失败，请稍后再试！");		
													window.location.reload();
												}
											}
										});
									}
							}
	                     	</script>
                      	</div>
                    <%}} %>
                     
                <script type="text/javascript">
                	$('#gallery3').rebox({ selector: 'a' });
                </script>
                </div>
            </div>
        </div>    
        
        <!--用户相册管理-->
        <div class="result-wrap">
            <div class="result-title">
                <h1>用户相册管理</h1>
            </div>
            <div class="result-content content-overflow" >
                <div id="gallery4" class="gallery"> 	
                	<%
                		List<AblumBean> ablumBeans = uService.findAllUserAblum();//查找所有用户信息，包括头像（需要其中的头像）
                		if(ablumBeans.isEmpty()){
                    %>
                     <div align="center">
                     	<p><strong>未查找到任何图片</strong></p>
                     </div>
                    <% 	
                    	}else{
                    		for(int i = 0;i<ablumBeans.size();i++){
                    			AblumBean ablumBean = ablumBeans.get(i);
                    			request.setAttribute("ablumBean", ablumBean);
                    %>     
                    	<div class="photoManage" align="center">  
	                     	<a href="${ablumBean.photo }"><div class="gallery_div" style="background:url(${ablumBean.photo}) no-repeat center;"></div></a>
	                     	<input type="button" class="changeInput" value="涉违更换" onclick="changePhoto('${ablumBean.id}')"> 
	                     	<script type="text/javascript">
	                     		function changePhoto(id) {
									var aid = id;//图片id
									var s = confirm("你确定要更换此图吗？");
									if (s) {
										$.ajax({
											type:"POST",//用post方式传输
											dataType:"json",//数据格式:JSON
											url:"/ThreeBlog_V1.0/AdminServlet?method=ChangePhoto" ,//目标地址
											data:{"id":aid},
											error:function(){
												alert("出错！请稍后再试...");
											},
											success:function(data){
												if (data) {
													alert("更换成功！");
													window.location.reload();
												} else {
													alert("更换失败，请稍后再试！");		
													window.location.reload();
												}
											}
										});
									}
							}
	                     	</script>
                      	</div>
                    <%}} %>
                     
                <script type="text/javascript">
                	$('#gallery4').rebox({ selector: 'a' });
                </script>
                </div>
            </div>
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