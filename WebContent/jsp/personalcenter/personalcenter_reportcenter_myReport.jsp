<%@page import="com.threeblog.domain.ArticleBean"%>
<%@page import="com.threeblog.serviceImpl.ArticleServiceImpl"%>
<%@page import="com.threeblog.service.ArticleService"%>
<%@page import="com.threeblog.domain.ReportBean"%>
<%@page import="java.util.List"%>
<%@page import="com.threeblog.serviceImpl.UserServiceImpl"%>
<%@page import="com.threeblog.service.UserService"%>
<%@page import="com.threeblog.domain.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	UserBean userBean =(UserBean) request.getSession().getAttribute("userBean");
	if(userBean!=null){
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/personalcenter.css" type="text/css"/>
<script src="${pageContext.request.contextPath}/js/changePage.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-1.min.js"></script>
</head>

<body>
                	<table border="1" id="down_report" style="width: 100%">
                        <tr>
                        <th width="15%">被举报人</th>
                        <th width="45%">被举报内容与说明</th>
                        <th width="20%">举报类型</th>
                        <th width="20%">处理状态</th>
                        </tr>
                        <%
	                    	String uid = userBean.getId();//用户id
	                    	ArticleService aService=new ArticleServiceImpl();
	                    	UserService uService = new UserServiceImpl();
	                    	List<ReportBean> reports = uService.getMyReportsByUid(uid);
	                    	if(reports.isEmpty()){
                   		%>
                   		<tr>
                        	<td colspan="4" style="padding: 20px;"><strong>没有举报记录！</strong></td>                     
                    	</tr>
	                    <%		
	                    }else{
	                    	for(int i=0;i<reports.size();i++){      
	                    		ReportBean rBean =reports.get(i);
	                    		request.setAttribute("rBean", rBean);
	                    		String aid = rBean.getContent_id();//文章id
	                    		ArticleBean aBean = aService.findArticle(aid);
	                    		request.setAttribute("aBean", aBean);
	                    		//System.out.println(rBean);
	                    %>
	                    <c:if test="${rBean.type=='举报文章' }">	  	                                   
                        <tr>
                            <td>${rBean.username }</td>
                            <td>被举报博文：<a href="${rBean.url}" target="_blank"><strong>《${aBean.title}》</strong></a>；█ 详细理由：${rBean.all_reason}</td>
                            <td>${rBean.simple_reason}</td>
                            <c:if test="${rBean.status1=='未处理' }">
                            	<td>等待处理</td>
                            </c:if>
                            <c:if test="${rBean.status1=='已处理'&&rBean.status2=='屏蔽' }">
                            	<td>该博文已被屏蔽</td>
                            </c:if>
                            <c:if test="${rBean.status1=='已处理'&&rBean.status2=='正常'}">
                            	<td>该博文未检测到违规</td>
                            </c:if>
                        </tr>
                        </c:if>
                        <c:if test="${rBean.type=='举报留言'}">
                        <tr>
                            <td>${rBean.username }</td>
                            <td>被举报评论：“<a href="${rBean.url}" target="_blank"><strong>${rBean.content }</strong></a>”；█ 详细理由：${rBean.all_reason }</td>
                            <td>${rBean.simple_reason}</td>
                            <c:if test="${rBean.status1=='未处理' }">
                            	<td>等待处理</td>
                            </c:if>
                            <c:if test="${rBean.status1=='已处理'&&rBean.status2=='屏蔽' }">
                            	<td>该留言已被屏蔽</td>
                            </c:if>
                            <c:if test="${rBean.status1=='已处理'&&rBean.status2=='正常'}">
                            	<td>该留言未检测到违规</td>
                            </c:if>
                        </tr>
                        </c:if>
                        <c:if test="${rBean.type=='举报回复' }">
                        <tr>
                            <td>${rBean.username }</td>
                            <td>被举报评论：“<a href="${rBean.url}" target="_blank"><strong>${rBean.content.substring(rBean.content.indexOf(":",rBean.content.indexOf(":")+1)+3) }</strong></a>”；█ 详细理由：${rBean.all_reason }</td>
                            <td>${rBean.simple_reason}</td>
                            <c:if test="${rBean.status1=='未处理' }">
                            	<td>等待处理</td>
                            </c:if>
                            <c:if test="${rBean.status1=='已处理'&&rBean.status2=='屏蔽' }">
                            	<td>该回复已被屏蔽</td>
                            </c:if>
                            <c:if test="${rBean.status1=='已处理'&&rBean.status2=='正常'}">
                            	<td>该回复未检测到违规</td>
                            </c:if>
                        </tr>
                        </c:if>
                        <%}} %>
                    </table>
                    
                    
           
</body>
</html>
<%}else{
	response.sendRedirect(request.getContextPath()+"/jsp/login/login.jsp");
}%>