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
            <div class="crumb-list"><i class="icon-font">&#xe06b;</i><span>欢迎使用Three Blog后台管理中心。</span></div>
        </div>
        <div class="result-wrap">
            <div class="result-title">
                <h1>快捷操作</h1>
            </div>
            <div class="result-content">
                <div class="short-wrap">
					<a href="${pageContext.request.contextPath}/admin/index/index.jsp"><i class="icon-font">&#xe048;</i>数据统计</a>
                    <a href="${pageContext.request.contextPath}/admin/index/notice_publish.jsp"><i class="icon-font">&#xe001;</i>新增公告</a>
                    <a href="${pageContext.request.contextPath}/admin/index/notice_list.jsp"><i class="icon-font">&#xe005;</i>公告管理</a>
                    <a href="${pageContext.request.contextPath}/admin/index/admin_manage.jsp"><i class="icon-font">&#xe01e;</i>管理员管理</a>
                </div>
            </div>
        </div>
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
                        <label class="res-lab">总用户量</label><span class="res-info">100</span>
                    </li>
                    <li>
                        <label class="res-lab">总博文数</label><span class="res-info">2000</span>
                    </li>
                    <li>
                        <label class="res-lab">总浏览量</label><span class="res-info">245561654</span>
                    </li>
                    <li>
                        <label class="res-lab">全年新增博文数</label><span class="res-info">78914</span>
                    </li>
                    
                    <li>
                        <label class="res-lab">全年新增用户数</label><span class="res-info">2486</span>
                    </li>
					<li>
                        <label class="res-lab">北京时间</label><span class="res-info">2014年3月18日 21:08:24</span>
                    </li>
                </ul>
            </div>
        </div>
        <div class="result-wrap">
            <div class="result-title">
                <h1>活跃用户</h1>
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
							<th>禁用状态</th>
                            <th>登录次数</th>
                            <th>操作</th>
                        </tr>
                        <tr>
                            <td class="tc">1</td>
                            <td><a target="_blank" href="#" title="发哥经典">查无此人</a></td>
                            <td>男</td>
                            <td>15800000012</td>
                            <td>广东省广州市</td>
                            <td>2014-03-15 21:11:01</td>
                            <td>2014-03-15 21:11:01</td>
                            <td>否</td>
                            <td>50</td>
                            <td>
                                <a class="link-update" href="#">查看</a>
                            </td>
                        </tr>
                        
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