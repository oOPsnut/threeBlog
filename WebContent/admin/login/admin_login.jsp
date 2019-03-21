<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员登录</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/alogin.css" type="text/css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-rebox.css"/>
<script src="${pageContext.request.contextPath}/js/jquery-1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/md5.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/aencryptionPassword.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-rebox.js"></script>
</head>
<body>
<div id="login_right" align="center">
    	<div id="right_content">
        	<img src="${pageContext.request.contextPath}/image/footer_logo.png">
        	<h1 style="-webkit-margin-before: 10px;color: #cc6633;">后台管理中心</h1>
            <div id="right_content_f" align="center">
            	<form action="${pageContext.request.contextPath}/AdminServlet?method=AdminLogin" method="post">
            	<input class="f_input" type="text" name="phone" placeholder=" 请 输 入 手 机 号" id="phone" onkeyup="isPhoneNum()" required>
                <input class="f_input" type="password" name="password" placeholder=" 请 输 入 密 码"id="password" required><br>
                	 <span class="errorMsg" style="color: red;">${errorMsg}</span>
                <a href="${pageContext.request.contextPath}/RedirectServlet?method=AforgetPasswdUI" id="forget_passwd">忘记密码？</a><br>

                <input class="f_input" type="submit" name="submit" id="login" value="登&emsp;录" onclick="encryptionPassword()"/>
                
                <a id="register" href="${pageContext.request.contextPath}/RedirectServlet?method=AregistUI">注&emsp;册</a>
                </form>
            </div>
        </div>
    </div>
</body>
</html>