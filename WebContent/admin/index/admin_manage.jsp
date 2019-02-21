<%@page import="java.util.List"%>
<%@page import="com.threeblog.serviceImpl.AdminServiceImpl"%>
<%@page import="com.threeblog.service.AdminService"%>
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/clipboard.min.js"></script>
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
            	<span class="crumb-step">&gt;</span><span>管理员管理</span>
            </div>
        </div>
       
        <div class="result-wrap">
            <div class="result-title">
                <h1>新增管理员</h1>
            </div>
            <div class="result-content">
            	<form action="${pageContext.request.contextPath}/AdminServlet?method=addAdmin" method="post">
                <ul class="sys-info-list">
                    <li align="left">
                        <label class="res-lab">当前管理员</label><span class="res-info">${adminBean.username }<input  type="text" value="${adminBean.id }" id="admin"  name="admin" style="visibility: hidden;"/></span>
                    </li>
                    <li align="left">
                        <label class="res-lab">当前管理员密码</label><span class="res-info"><input  type="password" class="wid" id="password" name="password" onkeyup="checkPasswd()" required/></span><span id="span02"></span>
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
                    <li align="left">
                        <label class="res-lab">新管理员手机号</label><input  type="text" class="wid" id="phone" name="phone" onkeyup="checkPhone()" required/></span><span id="span01"></span>
                        <script type="text/javascript">
                        	function checkPhone() {
								var phone=$("#phone").val();
								var myreg=/^[1][3,4,5,7,8][0-9]{9}$/;
								if(myreg.test(phone)){
									$.ajax({
										type:"POST",//用post方式传输
										dataType:"json",//数据格式:JSON
										url:"/ThreeBlog_V1.0/AdminServlet?method=checkAdminPhone" ,//目标地址
										data:{"phone":phone},
										error:function(){
											alert("出错！请稍后再试");
										},
										success:function(data){
											if(data){
												$("#span01").html("<font color='green'>可用</font>");
											}else{
												$("#span01").html("<font color='red'>已注册</font>");
											}
										}
									});
								}else{
										$("#span01").html("<font color='red'>手机号格式错误</font>");
								} 
								
							}
                        </script>
                    </li>
                    <li align="left">
                        <label class="res-lab">*</label><span class="res-info">请仔细检查，并确认手机号填写正确！</span>
                    </li>
                    <li align="left">
                        <label class="res-lab"></label><span class="res-info" style="color: green;">${errorMsg}</span><span class="res-info" style="color: green;" id="license_codeMsg">${Msg}</span>
                    </li>
                    <li>
                        <input type="submit" value="添加" class="submit-button" id="addA" onclick="encryptionPassword()"/>&emsp;&emsp;
                    	<input type="button" id="copy" value="复制授权码" class="submit-button" data-clipboard-action="copy" data-clipboard-target="#license_codeMsg" onclick="copyCode()"/>
                    </li>
                    
                </ul>
                </form>
            </div>
        </div>
        <div class="result-wrap">
            <div class="result-title">
                <h1>管理员管理</h1>
            </div>
            <%--超级管理员 --%>
            <c:if test="${adminBean.id=='72C5BA19E0C1431BA25D74E9B0D47647'}">
            <div class="result-content">             
				<table class="result-tab" width="100%">
                        <tr>
                            <th class="tc" width="5%">#</th>
                            <th>用户名</th>
                            <th>电话</th>
                            <th>注册时间</th>
                            <th>最近登录时间</th>
                            <th>状态</th>
							<th>权限</th>
                            <th>操作</th>
                        </tr>
                        <%
                        	AdminService adminService = new AdminServiceImpl();
                        	List<AdminBean> list = adminService.findAllAdmin();
                        	for(int i=0;i<list.size();i++){
                        		int number=i+1;
    		        			request.setAttribute("number", number); 
                        		AdminBean admin = list.get(i);
                        		request.setAttribute("admin", admin);
                        %>
                        <c:if test="${admin.password!=null }">
                        <tr>
                            <td class="tc">${number}</td>
                            <td>${admin.username}</td>
                            <td>${admin.phone}</td>
                            <td>${admin.register_time}</td>
                            <td>${admin.last_login_time}</td>
                            <td>已注册</td>
                            <c:if test="${admin.id=='72C5BA19E0C1431BA25D74E9B0D47647' }">
                            	<td>超级管理员</td>
                            </c:if>
                            <c:if test="${admin.id!='72C5BA19E0C1431BA25D74E9B0D47647' }">
                            	<td>管理员</td>
                            </c:if>
							<c:if test="${admin.id!='72C5BA19E0C1431BA25D74E9B0D47647' }">
                            <td>
                                <a class="link-update" onclick="deleteAdmin('${admin.id}')">删除</a>
                                <script type="text/javascript">
                                	function deleteAdmin(id) {
										var aid=id;//管理员id
										var s = confirm("你确定要删除此管理员吗？");
	        							if (s) {
	        								$.ajax({
	        									type:"POST",//用post方式传输
	        									dataType:"json",//数据格式:JSON
	        									url:"/ThreeBlog_V1.0/AdminServlet?method=DeleteAdmin" ,//目标地址
	        									data:{"id":aid},
	        									error:function(){
	        										alert("出错！请稍后再试...");
	        									},
	        									success:function(data){
	        										if (data) {
	        											alert("删除成功！");
	        											window.location.reload();
	        										} else {
	        											alert("删除失败，请稍后再试...");		
	        											window.location.reload();
	        										}
	        									}
	        								});
	        							}
									}
                                </script>
                            </td>
                            </c:if>
                            <c:if test="${admin.id=='72C5BA19E0C1431BA25D74E9B0D47647' }">
                            	<td>
                                <a class="link-update" href="${pageContext.request.contextPath}/admin/index/personalcenter.jsp">查看</a>
                            </td>
                            </c:if>
                        </tr>
                        </c:if>
                        <c:if test="${admin.password==null }">
                        <tr>
                            <td class="tc">${number}</td>
                            <td>NULL</td>
                            <td>${admin.phone}</td>
                            <td>NULL</td>
                            <td>NULL</td>
                            <td>未注册</td>
                            <td>管理员</td>
                            <td>
                                <a class="link-update" onclick="deleteAd('${admin.id}')">删除</a>
                                <script type="text/javascript">
                                	function deleteAd(id) {
										var aid=id;//管理员id
										var s = confirm("你确定要删除此管理员吗？");
	        							if (s) {
	        								$.ajax({
	        									type:"POST",//用post方式传输
	        									dataType:"json",//数据格式:JSON
	        									url:"/ThreeBlog_V1.0/AdminServlet?method=DeleteAdmin" ,//目标地址
	        									data:{"id":aid},
	        									error:function(){
	        										alert("出错！请稍后再试...");
	        									},
	        									success:function(data){
	        										if (data) {
	        											alert("删除成功！");
	        											window.location.reload();
	        										} else {
	        											alert("删除失败，请稍后再试...");		
	        											window.location.reload();
	        										}
	        									}
	        								});
	        							}
									}
                                </script>
                            </td>
                        </tr>
                        </c:if>
                        <%} %>
                    </table>
            </div>
            </c:if>
            <%--管理员 --%>
            <c:if test="${adminBean.id!='72C5BA19E0C1431BA25D74E9B0D47647'}">
            <div class="result-content">             
				<table class="result-tab" width="100%">
                        <tr>
                            <th class="tc" width="5%">#</th>
                            <th>用户名</th>
                            <th>电话</th>
                            <th>注册时间</th>
                            <th>最近登录时间</th>
							<th>状态</th>
							<th>权限</th>
                        </tr>
                        <%
                        	AdminService adminService = new AdminServiceImpl();
                        	List<AdminBean> list = adminService.findAllAdmin();
                        	for(int i=0;i<list.size();i++){
                        		int number=i+1;
    		        			request.setAttribute("number", number); 
                        		AdminBean admin = list.get(i);
                        		request.setAttribute("admin", admin);
                        %>
                        <c:if test="${admin.password!=null }">
                        <tr>
                            <td class="tc">${number}</td>
                            <td>${admin.username}</td>
                            <td>${admin.phone}</td>
                            <td>${admin.register_time}</td>
                            <td>${admin.last_login_time}</td>
                            <td>已注册</td>
                            <c:if test="${admin.id=='72C5BA19E0C1431BA25D74E9B0D47647' }">
                            	<td>超级管理员</td>
                            </c:if>
                            <c:if test="${admin.id!='72C5BA19E0C1431BA25D74E9B0D47647' }">
                            	<td>管理员</td>
                            </c:if>
                        </tr>
                        </c:if>
                        <%} %>
                    </table>
            </div>
            </c:if>
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