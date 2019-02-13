<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table style="width: 100%;">
<c:forEach items="${list}" var="l">
<tr class="tr_change">
	<td><a href="${pageContext.request.contextPath}/jsp/article/article.jsp?id=${l.id}"><div style="width: 100%;">《${l.title}》 / 【${l.label}】</div></a></td>
</tr>
</c:forEach>
</table>
