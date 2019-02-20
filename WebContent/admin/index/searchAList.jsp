<%@page import="com.threeblog.domain.ArticleTypeBean"%>
<%@page import="com.threeblog.serviceImpl.ArticleServiceImpl"%>
<%@page import="com.threeblog.service.ArticleService"%>
<%@page import="com.threeblog.domain.ArticleBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="result-wrap">
        	<div class="result-title">
                <h1>搜索结果</h1>
            </div>
            <div class="result-content"> 
				<table class="result-tab" width="100%">
                        <tr>
                            <th>作者</th>
                            <th>标题</th>
                            <th>标签</th>
                            <th>点击数</th>
                            <th>喜欢数</th>
                            <th>收藏数</th>
                            <th>评论数</th>
                            <th>发布日期</th>
                            <th>类型</th>
                            <th>状态</th>
                            <th>操作</th>
                        </tr>
                        <%
                        	ArticleService aService = new ArticleServiceImpl();
                        	List<ArticleBean> list= (List)request.getAttribute("list");
                        	for(int i =0;i<list.size();i++){
                        		ArticleBean aBean= list.get(i);
                        		request.setAttribute("aBean", aBean);
                        		String aid = aBean.getId();
                        		ArticleTypeBean aTypeBean = aService.findArticleType(aid);
                        		request.setAttribute("aTBean", aTypeBean);         	
                        %>
                        <tr>
                            <td><a target="_blank" href="${pageContext.request.contextPath}/jsp/othercenter/othercenter.jsp?id=${aBean.author_id}">${aBean.author}</a>
                            <td><a target="_blank" href="${pageContext.request.contextPath}/jsp/article/article.jsp?id=${aBean.id}">${aBean.title }</a> 
                            <td><a target="_blank" href="${pageContext.request.contextPath}/jsp/homepage/search_result.jsp?content=${aBean.label}">${aBean.label}</a> 
                            <td>${aBean.click_num}</td>
                            <td>${aBean.liked_num}</td>
                            <td>${aBean.collect_num}</td>
                            <td>${aBean.comment_num}</td>
                            <td>${aBean.publish_date}</td>
                            <td>${aTBean.article_type}</td>
                            <td>${aBean.status}</td>
                            <td>
                                <a class="link-update" target="_blank" href="${pageContext.request.contextPath}/jsp/article/article.jsp?id=${aBean.id}">查看</a>
                                <a class="link-del" onclick="hideArticle('${aBean.id}')">屏蔽</a>
                                <script type="text/javascript">
                                	function hideArticle(id) {
										var aid=id;//文章id
										var s = confirm("你确定要屏蔽此文章吗？");
	        							if (s) {
	        								$.ajax({
	        									type:"POST",//用post方式传输
	        									dataType:"json",//数据格式:JSON
	        									url:"/ThreeBlog_V1.0/AdminServlet?method=HideArticle" ,//目标地址
	        									data:{"id":aid},
	        									error:function(){
	        										alert("出错！请稍后再试...");
	        									},
	        									success:function(data){
	        										if (data) {
	        											alert("屏蔽成功！");
	        											window.location.reload();
	        										} else {
	        											alert("屏蔽失败，本照片可能已处于屏蔽或非正常状态！");		
	        											window.location.reload();
	        										}
	        									}
	        								});
	        							}
									}
                                </script>
                            </td>
                        </tr>
                        <%} %>
                    </table>
                  </div>
</div>