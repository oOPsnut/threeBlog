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
                    <table id="down_illegal" border="1">
                    <tr>
                        <th width="55%">违规通知</th>
                        <th width="25%">通知时间</th>
                        <th width="30%">处理</th>
                    </tr>
                    <%
                    	UserBean userBean =(UserBean) request.getSession().getAttribute("userBean");
                    	String uid = userBean.getId();//用户id
                    	ArticleService aService=new ArticleServiceImpl();
                    	UserService uService = new UserServiceImpl();
                    	List<ReportBean> reports = uService.getMyIllegalsByUid(uid);
                    	if(reports.isEmpty()){
                    %>
                    	<tr>
                        	<td colspan="3" style="padding: 20px;"><strong>没有违规记录！</strong></td>                     
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
                    <c:if test="${rBean.status=='已处理'&&rBean.status2=='屏蔽'}">
                    	<c:if test="${rBean.type=='举报文章' }">
	                    <tr>
	                        <td>你的博文<a href="${rBean.url}" target="_blank">《${aBean.title}》</a>因涉嫌违规，已被屏蔽</td>
	                        <td>${rBean.notice_time}</td>
	                        <c:if test="${rBean.status3=='未确定'}">
		                        <td>
		                        	<input type="button" value="确定" onclick="ensure(${rBean.id})"/>
		                        	<script type="text/javascript">
		                        		function ensure(id) {
											var rid=id;
											var s = confirm("确定后不能再操作此文章!");
											if (s) {
												$.ajax({
													type:"POST",//用post方式传输
													dataType:"json",//数据格式:JSON
													url:"/ThreeBlog_V1.0/ReportServlet?method=EnsureReport" ,//目标地址
													data:{"id":rid},
													error:function(){
														alert("出错！请稍后再试...");
													},
													success:function(data){
														if (data) {
															alert("成功！");
															window.location.reload();
														} else {
															alert("确定失败，本文可能处于屏蔽或非正常状态！请稍后再试...");		
															window.location.reload();
														}
													}
												});
										}
		                        	</script>
		                            <a href="${pageContext.request.contextPath}/jsp/feedback/feedback.jsp?id=${aBean.id}">反馈</a>
		                        </td>
	                        </c:if>
	                        <c:if test="${rBean.status3=='等待审核' ||rBean.status3=='审核不通过'||rBean.status3=='已确定'}">
		                        <td>${rBean.status3}</td>
	                        </c:if>
	                        <c:if test="${rBean.status3=='审核通过' }">
		                        <td>反馈成功，此文章已恢复！</td>
	                        </c:if>
	                    </tr>
	                    </c:if>
	                    <c:if test="${rBean.type=='举报留言' ||rBean.type=='举报回复' }">
	                    <tr>
	                        <td>你在博文<a href="${rBean.url}" target="_blank">《${aBean.title}》</a>下的评论因涉嫌违规，已被屏蔽</td>
	                        <td>${rBean.notice_time}</td>
	                        <c:if test="${rBean.status3=='未确定'}">
	                        <td>
	                        	<input type="button" value="确定" onclick="ensure(${rBean.id})"/>
	                        	<script type="text/javascript">
		                        		function ensure(id) {
											var rid=id;
											var s = confirm("确定后不能再操作此评论!");
											if (s) {
												$.ajax({
													type:"POST",//用post方式传输
													dataType:"json",//数据格式:JSON
													url:"/ThreeBlog_V1.0/ReportServlet?method=EnsureReport" ,//目标地址
													data:{"id":rid},
													error:function(){
														alert("出错！请稍后再试...");
													},
													success:function(data){
														if (data) {
															alert("成功！");
															window.location.reload();
														} else {
															alert("确定失败，本文可能处于屏蔽或非正常状态！请稍后再试...");		
															window.location.reload();
														}
													}
												});
										}
		                        	</script>
	                        </td>
	                       </c:if>
	                       <c:if test="${rBean.status3=='已确定'}">
	                       	<td>${rBean.status3}</td>
	                       </c:if>
	                    </tr>
	                    </c:if>	                    
                    </c:if>
                    <%}} %>
                   
                    </table>
</body>
</html>
