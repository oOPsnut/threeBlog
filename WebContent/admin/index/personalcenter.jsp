<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/md5.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/aencryptionPassword.js"></script>
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
            	<span class="crumb-step">&gt;</span><span>个人中心</span>
            </div>
        </div>
        
        <div class="result-wrap">
            <div class="result-title">
                <h1>个人信息</h1>
            </div>
            <div class="result-content">
                <ul class="sys-info-list">
                    <li>
                        <label class="res-lab">用户名</label><span class="res-info">${adminBean.username }</span>
                    </li>
                    <li>
                        <label class="res-lab">电话</label><span class="res-info">${adminBean.phone }</span>
                    </li>
                    <li>
                        <label class="res-lab">注册时间</label><span class="res-info">${adminBean.register_time }</span>
                    </li>
                    <li>
                        <label class="res-lab">最近登录时间</label><span class="res-info">${adminBean.last_login_time }</span>
                    </li>
                    <c:if test="${adminBean.id=='72C5BA19E0C1431BA25D74E9B0D47647' }">
                    <li>
                        <label class="res-lab">权限</label><span class="res-info">超级管理员</span>
                    </li>
                    </c:if>
                    <c:if test="${adminBean.id!='72C5BA19E0C1431BA25D74E9B0D47647' }">
                    <li>
                        <label class="res-lab">权限</label><span class="res-info">管理员</span>
                    </li>
                    </c:if>
                    <li>
                        <label class="res-lab">状态</label><span class="res-info">已注册</span>
                    </li>
                    <%
	                    Date now = new Date();
	        		    SimpleDateFormat sdf = new SimpleDateFormat("yyy年MM月dd日 HH:mm:ss");
	        		    String time = sdf.format(now);
	        		    request.setAttribute("time", time);
                    %>
					<li>
                        <label class="res-lab">北京时间</label><span class="res-info">${time }</span>
                    </li>
                </ul>
            </div>
        </div>
        <div class="result-wrap">
            <div class="result-title">
                <h1>修改密码</h1>
            </div>
            <div class="result-content">
            	<form action="${pageContext.request.contextPath}/AdminServlet?method=ChangeNPasswd" method="post">
                <ul class="sys-info-list">
                    <li align="left">
                        <label class="res-lab">当前管理员</label><span class="res-info">${adminBean.username }<input  type="text" value="${adminBean.id }" id="admin"  name="admin" style="visibility: hidden;"/><input  type="text" value="${adminBean.phone }" id="aphone"  name="aphone" style="visibility: hidden;"/></span>
                    </li>
                    <li align="left">
                        <label class="res-lab">原密码</label><span class="res-info"><input  type="password" class="wid" id="password" name="password" onkeyup="checkPasswd()" required/></span><span id="span02"></span>
                        <script type="text/javascript">
                        	function checkPasswd() {
                        		var id=$("#admin").val();
								var passwd=$("#password").val();
								var md5KeyR= "jL2NdrALvN";
								//表单提交时对输入的密码进行加密， 避免抓包分析破解密码
							    var hash1 = passwd+md5KeyR; 
								var hash2=MD5(hash1); 
								$.ajax({
									type:"POST",//用post方式传输
									dataType:"json",//数据格式:JSON
									url:"/ThreeBlog_V1.0/AdminServlet?method=checkPasswd" ,//目标地址
									data:{"id":id,"passwd":hash2},
									error:function(){
										alert("出错！请稍后再试");
									},
									success:function(data){
										if(data){
											$("#span02").html("<font color='green'>正确</font>");
										}else{
											$("#span02").html("<font color='red'>错误</font>");
										}
									}
								});
							}
                        </script>
                    </li>
                     <li>
                        <label class="res-lab">授权码</label><span class="res-info"><input type="text" class="wid"  name="license_code" id="license_code" onkeyup="checkLicenseCode()" required></span><span id="span03"></span>
                        <script type="text/javascript">
                        	function checkLicenseCode() {
                        		var phone=$("#aphone").val();
								var license_code=$("#license_code").val();
								$.ajax({
									type:"POST",//用post方式传输
									dataType:"json",//数据格式:JSON
									url:"/ThreeBlog_V1.0/AdminServlet?method=CheckLicenseCode" ,//目标地址
									data:{"phone":phone,"license_code":license_code},
									error:function(){
										alert("出错！请稍后再试");
									},
									success:function(data){
										if(data){
											$("#span03").html("<font color='green'>正确</font>");
										}else{
											$("#span03").html("<font color='red'>错误</font>");
										}
									}
								});
							}
                        </script>
                    </li>
                    <li>
                        <label class="res-lab">新密码</label><span class="res-info"><input  type="password" class="wid" id="newpassword" name="newpassword"  required/></span>
                    </li>
                    <li>
                        <label class="res-lab">重新输入密码</label><span class="res-info"><input  type="password" class="wid" id="newpassword1" name="newpassword1" onkeyup="check()" required/></span><span id="span01"></span>
                        <script type="text/javascript">
                        	function check() {
								var newpasswd=$("#newpassword").val();
								var newpasswd1=$("#newpassword1").val();
								if (newpasswd==newpasswd1) {
									$("#span01").html("<font color='green'>一致</font>");
								} else {
									$("#span01").html("<font color='red'>不一致</font>");
								}
							}
                        </script>
                    </li>
					<li align="left">
                        <label class="res-lab">*</label><span class="res-info">请养成每两周更改一次密码的好习惯！</span>
                    </li>
                    <li align="left">
                        <label class="res-lab"></label><span class="res-info" style="color: green;">${errorMsg}</span><span class="res-info" style="color: green;" id="license_codeMsg">${Msg}</span>
                    </li>
					<li>
                        <input type="submit" value="更改密码" class="submit-button" id="addA" onclick="hidePasswd()"/>
                    </li>
                </ul>
                </form>
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