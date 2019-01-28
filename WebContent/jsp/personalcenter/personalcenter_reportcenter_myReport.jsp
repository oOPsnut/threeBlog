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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/personalcenter.css" type="text/css"/>
<script src="${pageContext.request.contextPath}/js/changePage.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-1.min.js"></script>
</head>

<body>
                	<table border="1" id="down_report">
                        <tr>
                        <th width="15%">被举报人</th>
                        <th width="45%">被举报内容与说明</th>
                        <th width="20%">举报类型</th>
                        <th width="20%">处理状态</th>
                        </tr>
                        <%
	                    	UserBean userBean =(UserBean) request.getSession().getAttribute("userBean");
	                    	String uid = userBean.getId();//用户id
	                    	ArticleService aService=new ArticleServiceImpl();
	                    	UserService uService = new UserServiceImpl();
	                    	List<ReportBean> reports = uService.getMyReportsByUid(uid);
	                    	if(reports.isEmpty()){
                   		%>
                   		<tr>
                        	<td colspan="4" style="padding: 20px;"><strong>没有违规记录！</strong></td>                     
                    	</tr>
	                    <%		
	                    }else{
	                    	for(int i=0;i<reports.size();i++){      
	                    		ReportBean rBean =reports.get(i);
	                    		request.setAttribute("rBean", rBean);
	                    		String aid = rBean.getContent_id();//文章id
	                    		ArticleBean aBean = aService.findArticle(aid);
	                    		request.setAttribute("aBean", aBean);
	                    %>
                        <tr>
                            <td>${rBean.username }</td>
                            <td>被举报博文:<a href="${rBean.url}" target="_blank">《${aBean.title}》</a>;█ 详细理由:${rBean.all_reason}</td>
                            <td>${rBean.simple_reason}</td>
                            <c:if test="">
                            	<td>博文已删除</td>
                            </c:if>
                        </tr>
                        <tr>
                            <td>用户007</td>
                            <td>被举报评论:“丢”；详细理由：</td>
                            <td>违反社会主义核心价值观</td>
                            <td>等待处理</td>
                        </tr>
                        <tr>
                            <td>shui</td>
                            <td>被举报评论:“丢”；详细理由：</td>
                            <td>违反社会主义核心价值观</td>
                            <td>等待处理</td>
                        </tr>
                        <tr>
                            <td>456</td>
                            <td>被举报评论:“haha”；详细理由：</td>
                            <td>违反社会主义核心价值观</td>
                            <td>等待处理</td>
                        </tr>
                        <%}} %>
                    </table>
                    
                    
           
</body>
</html>
