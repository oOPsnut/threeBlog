<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="result-wrap">
        	<div class="result-title">
                <h1>搜索结果</h1>
            </div>
            <div class="result-content">             
				<table class="result-tab" width="100%">
                        <tr> 
                            <th>用户名</th>
                            <th>性别</th>
                            <th>电话</th>
                            <th>所在地区</th>
                            <th>注册时间</th>
                            <th>最近登录时间</th>
                            <th>被禁用时间</th>
                            <th>操作</th>
                        </tr>
                        <c:forEach items="${SURList }" var="surBean">
                        <tr>
                            <td><a target="_blank" href="${pageContext.request.contextPath}/jsp/othercenter/othercenter.jsp?id=${surBean.id}">${surBean.username }</a></td>
                            <td>${surBean.sex }</td>
                            <td>${surBean.phone}</td>
                            <td>${surBean.province }-${surBean.city}</td>
                            <td>${surBean.register_time}</td>
                            <td>${surBean.last_login_time }</td>
                            <td>${surBean.ban_time }</td>
                            <td>
                                <a class="link-update" href="${pageContext.request.contextPath}/jsp/othercenter/othercenter.jsp?id=${surBean.id}" target="_blank">查看</a>&emsp;
                                <a class="link-update" onclick="addUsername('${surBean.username}')">限制</a>
                                <script type="text/javascript">
		                            function addUsername(username) {
										$("#lusername").val(username);
									} 
                                </script>
                            </td>
                        </tr>
                       </c:forEach>
                    </table>
            </div>
        
        </div>