<%@page import="com.threeblog.domain.UserBean"%>
<%@page import="com.threeblog.serviceImpl.UserServiceImpl"%>
<%@page import="java.util.List"%>
<%@page import="com.threeblog.domain.ReportBean"%>
<%@page import="com.threeblog.serviceImpl.AdminServiceImpl"%>
<%@page import="com.threeblog.service.AdminService"%>
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
            	<span class="crumb-step">&gt;</span><span>消息管理</span>
            </div>
        </div>
        
        <div class="result-wrap" >
            <div class="result-title">
                <h1>举报消息</h1>
            </div>
            <div class="result-content">             
				<table class="result-tab" width="100%">
                        <tr>
                            <th>被举报人</th>
                            <th>类型</th>
                            <th>摘要</th>
                            <th>举报原因</th>
                            <th>详细理由</th>
							<th>举报人</th>
                            <th>举报时间</th>
                            <th>操作</th>
                        </tr>
                        <%                        	
                        	List<ReportBean> reportList = adminService.findAllReportMessage();
                        	if(reportList.isEmpty()){
                        %>
                        <tr align="center">
                        	<td colspan="8" style="padding: 20px;"><strong>没有消息记录！</strong></td>    
                        </tr>
                        <%
                        	}else{
                        		for(int i =0;i<reportList.size();i++){
                        			ReportBean rBean=reportList.get(i);
                        			request.setAttribute("rBean", rBean);	
                        			String id =  rBean.getUser_id();//举报人id
                        			UserBean uBean= uService.findUserInfo(id);
                        			request.setAttribute("uBean", uBean);
                        %>
                        <tr>
                            <td><a target="_blank" href="${pageContext.request.contextPath}/jsp/othercenter/othercenter.jsp?id=${rBean.author_id}">${rBean.username }</a></td>
                            <td>${rBean.type}</td>
                            <td>${rBean.content}</td>
                            <td>${rBean.simple_reason}</td>
                            <td>${rBean.all_reason}</td>
                            <td><a target="_blank" href="${pageContext.request.contextPath}/jsp/othercenter/othercenter.jsp?id=${uBean.id}">${uBean.username }</a></td>
                            <td>${rBean.add_time}</td>
                            <td>
                                <a class="link-update" href="${rBean.url}" target="_blank">查看</a>
                            </td>
                        </tr>
                        <% }}%>
                    </table>
            </div>
        </div>
        <div class="result-wrap" >
            <div class="result-title">
                <h1>反馈消息</h1>
            </div>
            <div class="result-content">             
				<table class="result-tab" width="100%">
                        <tr>
                            <th>反馈人</th>
                            <th>被举报类型</th>
                            <th>摘要</th>
                            <th>被举报原因</th>
                            <th>被举报详细理由</th>
							<th>反馈原因</th>
                            <th>被举报时间</th>
                            <th>操作</th>
                        </tr>
                        <%
                        	List<ReportBean> renewList = adminService.findAllRenewMessage();
                        	if(renewList.isEmpty()){
                        %>
                        <tr align="center">
                        	<td colspan="8" style="padding: 20px;"><strong>没有消息记录！</strong></td>    
                        </tr>
                        <%
                        	}else{
                        		for(int i =0;i<renewList.size();i++){
                        			ReportBean rBean=renewList.get(i);
                        			request.setAttribute("rBean", rBean);	
                        	
                        %> 
                        <tr>
                            <td><a target="_blank" href="${pageContext.request.contextPath}/jsp/othercenter/othercenter.jsp?id=${rBean.author_id}">${rBean.username }</a></td>
                            <td>${rBean.type}</td>
                            <td>${rBean.content}</td>
                            <td>${rBean.simple_reason}</td>
                            <td>${rBean.all_reason}</td>
                            <td>${rBean.feedback_reason}</td>
                            <td>${rBean.add_time}</td>
                            <td>
                                <a class="link-update" href="${rBean.url}" target="_blank">查看</a>
                            </td>
                        </tr>  
                        <% }}%>
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