<%@page import="com.sun.jndi.url.iiopname.iiopnameURLContextFactory"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.threeblog.domain.UserBean"%>
<%@page import="java.util.List"%>
<%@page import="com.threeblog.serviceImpl.UserServiceImpl"%>
<%@page import="com.threeblog.service.UserService"%>
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
    <script src="${pageContext.request.contextPath}/js/jquery-1.min.js"></script>
</head>
<%
	AdminBean adminBean = (AdminBean)request.getSession().getAttribute("adminBean");
	if(adminBean!=null){
		
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
						<li><a href="${pageContext.request.contextPath}/admin/index/messagecenter.jsp"><i class="icon-font">&#xe004;</i>消息管理<span id="messageNum">1</span></a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/index/reportcenter.jsp"><i class="icon-font">&#xe00a;</i>举报管理<span id="messageNum">1</span></a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/index/renew.jsp"><i class="icon-font">&#xe00e;</i>恢复管理<span id="messageNum">1</span></a></li>
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
            	<span class="crumb-step">&gt;</span><span>用户管理</span>
            </div>
        </div>
        
        <div class="result-wrap">
            <div class="result-title">
                <h1>用户搜索</h1>
            </div>
            <div class="result-content">
		                <ul class="sys-info-list">
		                   <li align="center">
		                       <label class="res-lab ">用户名:</label><span class="res-info"><input  type="text" class="wid" id="susername" required/></span>
		                       <input type="submit" value="搜索" id="searchUser" onclick="searchUser()"/>
		                       <script type="text/javascript">
		                       		function searchUser() {
										var username = $("#susername").val();//获取输入的用户名
										if (username=="") {
											$("#search-result").hide();
										} else {

										$.post("/ThreeBlog_V1.0/AdminServlet?method=SearchUser",{username:username},function(data,status){
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
        
        <div class="result-wrap">
            <div class="result-title">
                <h1>违规封印</h1>
            </div>
            <div class="result-content">
		           <form action="${pageContext.request.contextPath}/AdminServlet?method=LimitUser" method="post">
		                <ul class="sys-info-list">
		                   <li align="center">
		                       <label class="res-lab ">用户名:</label><span class="res-info"><input name="username" type="text" class="wid" id="lusername" required/></span>
		                   </li>
		                   <li align="center">
		                       <label class="res-lab ">将被限制登录直到:</label><span class="res-info"><input type="date" name="ban_time" class="wid" required/></span>
		                   </li>
		                   <li align="center">
		                       <input type="submit" value="封印" id="limitUser"/>
		                   </li>
		                 </ul>
		           </form>
            </div>
        </div>      
        <div class="result-wrap">
            <div class="result-title">
                <h1>正常用户管理</h1>
            </div>
            <div class="result-content">             
				<table class="result-tab" width="100%">
                        <tr> 
                            <th>用户名</th>
                            <th>性别</th>
                            <th>电话</th>
                            <th>所在地区</th>
                            <th>注册时间</th>
                            <th>最近登录时间</th>
                            <th>被禁用时间</th>
                            <th>操作</th>
                        </tr>
                        <%
                        	UserService uService = new UserServiceImpl();
                        	List<UserBean> list = uService.fingAllUser();//查找所有用户
                        	if(list.isEmpty()){
                        %>
                        <tr align="center">
                        	<td colspan="8" style="padding: 20px;"><strong>暂时没有用户！</strong></td>    
                        </tr>
                        <% 	
                        	}else{
                        		for(int i = 0;i<list.size();i++){  
        		        			UserBean uBean = list.get(i);
        		        			request.setAttribute("uBean", uBean); 
        		        			Date date = new Date();
        		        			request.setAttribute("currentTime", date);
                        %>
                        <c:if test="${uBean.ban_time < currentTime }">
                        <tr>
                            <td><a target="_blank" href="${pageContext.request.contextPath}/jsp/othercenter/othercenter.jsp?id=${uBean.id}">${uBean.username }</a></td>
                            <td>${uBean.sex }</td>
                            <td>${uBean.phone}</td>
                            <td>${uBean.province }-${uBean.city}</td>
                            <td>${uBean.register_time}</td>
                            <td>${uBean.last_login_time }</td>
                            <td>${uBean.ban_time }</td>
                            <td>
                                <a class="link-update" href="${pageContext.request.contextPath}/jsp/othercenter/othercenter.jsp?id=${uBean.id}" target="_blank">查看</a>&emsp;
                                <a class="link-update" onclick="addUsername('${uBean.username}')">限制</a>
                                <script type="text/javascript">
		                            function addUsername(username) {
										$("#lusername").val(username);
									} 
                                </script>
                            </td>
                        </tr>
                        </c:if>
                        <%}} %>
                    </table>
            </div>
        </div>
        <div class="result-wrap">
            <div class="result-title">
                <h1>受限制用户管理</h1>
            </div>
            <div class="result-content">             
				<table class="result-tab" width="100%">
                        <tr>
                            <th>用户名</th>
                            <th>性别</th>
                            <th>电话</th>
                            <th>所在地区</th>
                            <th>注册时间</th>
                            <th>最近登录时间</th>
                            <th>被禁用时间</th>
                            <th>操作</th>
                        </tr>
                        <%
                        	if(list.isEmpty()){
                        %>
                        <tr align="center">
                        	<td colspan="8" style="padding: 20px;"><strong>暂时没有用户！</strong></td>    
                        </tr>
                        <% 	
                        	}else{
                        		for(int i = 0;i<list.size();i++){   
        		        			UserBean uBean = list.get(i);
        		        			request.setAttribute("uBean", uBean); 
        		        			Date date = new Date();
        		        			request.setAttribute("currentTime", date);
                        %>
                        <c:if test="${uBean.ban_time >= currentTime }">
                        <tr>
                            <td><a target="_blank" href="${pageContext.request.contextPath}/jsp/othercenter/othercenter.jsp?id=${uBean.id}">${uBean.username }</a></td>
                            <td>${uBean.sex }</td>
                            <td>${uBean.phone}</td>
                            <td>${uBean.province }-${uBean.city}</td>
                            <td>${uBean.register_time}</td>
                            <td>${uBean.last_login_time }</td>
                            <td>${uBean.ban_time }</td>
                            <td>
                                <a class="link-update" href="${pageContext.request.contextPath}/jsp/othercenter/othercenter.jsp?id=${uBean.id}" target="_blank">查看</a>&emsp;
                                <a class="link-update" onclick="addUsername('${uBean.username}')">限制</a>
                                <script type="text/javascript">
		                            function addUsername(username) {
										$("#lusername").val(username);
									} 
                                </script>
                            </td>
                        </tr>
                        </c:if>
                        <%}} %>
                    </table>
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