<%@page import="com.threeblog.domain.UserBean"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.mysql.fabric.xmlrpc.base.Data"%>
<%@page import="java.util.Date"%>
<%@page import="com.threeblog.serviceImpl.ArticleServiceImpl"%>
<%@page import="com.threeblog.service.ArticleService"%>
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
                    <a href="javascript:;"><i class="icon-font">&#xe018;</i>系统管理</a>
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
            <div class="crumb-list"><i class="icon-font">&#xe06b;</i><span>欢迎使用Three Blog后台管理中心。</span></div>
        </div>
        <div class="result-wrap">
            <div class="result-title">
                <h1>快捷操作</h1>
            </div>
            <div class="result-content">
                <div class="short-wrap">
                    <a href="${pageContext.request.contextPath}/admin/index/notice_publish.jsp"><i class="icon-font">&#xe001;</i>新增公告</a>
                    <a href="${pageContext.request.contextPath}/admin/index/notice_list.jsp"><i class="icon-font">&#xe005;</i>公告管理</a>
                    <a href="${pageContext.request.contextPath}/admin/index/admin_manage.jsp"><i class="icon-font">&#xe01e;</i>管理员管理</a>
                </div>
            </div>
        </div>
        <%
        	UserService uService = new UserServiceImpl();
        	ArticleService aService = new ArticleServiceImpl();
		    int totalUser = Integer.valueOf(uService.CountTotalUsers().toString());//总用户数
			request.setAttribute("totalUser", totalUser);
		    int totalArticle = Integer.parseInt(aService.countTotalArticles().toString());//总博文数
		    request.setAttribute("totalArticle", totalArticle);
		    int TotalClickNum = Integer.parseInt( aService.countTotalClickNum().toString());//博文总浏览量
		    request.setAttribute("TotalClickNum", TotalClickNum);
		    Calendar date = Calendar.getInstance();
		    int currentyear = date.get(Calendar.YEAR);//当前年份
		    int TotalCYArticle = Integer.parseInt(aService.countTotalArticlesByYear(currentyear).toString());//全年新增博文数
		    request.setAttribute("TotalCYArticle", TotalCYArticle);
		    int TotalCYUser = Integer.parseInt(uService.countTotalUserByYear(currentyear).toString());//全年新增用户数
		    request.setAttribute("TotalCYUser", TotalCYUser);
		    Date now = new Date();
		    SimpleDateFormat sdf = new SimpleDateFormat("yyy年MM月dd日 HH:mm:ss");
		    String time = sdf.format(now);
		    request.setAttribute("time", time);
        %>
        <div class="result-wrap">
            <div class="result-title">
                <h1>数据统计</h1>
            </div>
            <div class="result-content">
                <ul class="sys-info-list">
                    <li>
                        <label class="res-lab">博客系统</label><span class="res-info">Three Blog</span>
                    </li>
                    <li>
                        <label class="res-lab">总用户量</label><span class="res-info">${totalUser }</span>
                    </li>
                    <li>
                        <label class="res-lab">总博文数</label><span class="res-info">${totalArticle }</span>
                    </li>
                    <li>
                        <label class="res-lab">博文总浏览量</label><span class="res-info">${TotalClickNum }</span>
                    </li>
                    <li>
                        <label class="res-lab">全年新增博文数</label><span class="res-info">${TotalCYArticle }</span>
                    </li>
                    
                    <li>
                        <label class="res-lab">全年新增用户数</label><span class="res-info">${TotalCYUser}</span>
                    </li>
					<li>
                        <label class="res-lab">北京时间</label><span class="res-info">${time }</span>
                    </li>
                </ul>
            </div>
        </div>
        <div class="result-wrap">
            <div class="result-title">
                <h1>活跃用户(最近登录20位用户)</h1>
            </div>
            <div class="result-content">             
				<table class="result-tab" width="100%">
                        <tr>
                            <th class="tc" width="5%">#</th>
                            <th>用户名</th>
                            <th>性别</th>
                            <th>电话</th>
                            <th>所在地区</th>
                            <th>注册时间</th>
                            <th>最近登录时间</th>
                            <th>操作</th>
                        </tr>
                        <%
                        	List<UserBean> list = uService.findLastLoginUser();
                        	if(list.isEmpty()){
                        		
                        %>
                        <tr align="center">
                        	<td colspan="8" style="padding: 20px;"><strong>没有用户记录！</strong></td>    
                        </tr>
                        <%	
                        	}else{
                        		for(int i = 0;i<list.size();i++){
                        			int number=i+1;
        		        			request.setAttribute("number", number);    
        		        			UserBean uBean = list.get(i);
        		        			request.setAttribute("uBean", uBean); 
                        %>
                        <tr>
                            <td class="tc">${number}</td>
                            <td><a target="_blank" href="${pageContext.request.contextPath}/jsp/othercenter/othercenter.jsp?id=${uBean.id}">${uBean.username }</a></td>
                            <td>${uBean.sex }</td>
                            <td>${uBean.phone}</td>
                            <td>${uBean.province }-${uBean.city}</td>
                            <td>${uBean.register_time}</td>
                            <td>${uBean.last_login_time }</td>
                            <td>
                                <a class="link-update" href="${pageContext.request.contextPath}/jsp/othercenter/othercenter.jsp?id=${uBean.id}">查看</a>
                            </td>
                        </tr>
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