<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员忘记密码</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/aforget_passwd.css" type="text/css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-rebox.css"/>
<script src="${pageContext.request.contextPath}/js/jquery-1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/owl.carousel.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/md5.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-rebox.css"/>

<!-- 提交表单检验 -->
<script src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
<script src="${pageContext.request.contextPath}/js/anewcheck.js"></script>
<script src="${pageContext.request.contextPath}/js/anewcheckform.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-rebox.js"></script>
</head>
<body>
<div id="login_right" align="center">
    	<div id="right_content">
        	<img id="right_content_img" src="${pageContext.request.contextPath}/image/footer_logo.png">
        	<h2 style="-webkit-margin-before: 10px;color: #cc6633;">后台管理中心</h2>
        	<form action="${pageContext.request.contextPath}/AdminServlet?method=changePasswd" method="post" id="changePasswd">
            <div id="right_content_f" align="center">
            	<div class="f_username">
            		<input class="f_username_input" type="text" name="phone" placeholder=" 请 输 入 手 机 号" id="phone"/>
            		<span class="errorSpan" id="span02"></span>
            	</div>
            	<div class="f_username">
	                <input class="f_username_input" type="password" placeholder=" 请 输 入 新 密 码"  name="newpasswd1" id="newpasswd1">
	                <span class="errorSpan" id="span02"></span>
            	</div>
            	<div class="f_username">
	                <input class="f_username_input" type="password" placeholder=" 请 再 次 输 入 密 码" name="newpasswd2" id="newpasswd2">
	                <span class="errorSpan" id="span02"></span>
            	</div>
            	<div class="f_username">
            	<input class="f_username_input" type="text" name="license_code" id="license_code"  placeholder=" 请 输 入 授 权 码" >
            	<span class="errorSpan" id="span02"></span>
            	</div>
                <div id="f_checknumber">
                <input id="f_cnum_input" type="text" placeholder=" 请 输 入 验 证 码" name="code">
                <a id="f_cnum_a" href="javascript:;" onclick="sendMessage()" method="post">发送验证码</a><br>
                <span class="errorSpan" id="span01"></span>
                </div>
                <input type="submit" id="forget_passwd_ok" value="确 定"  onclick="return checkAll()"/><br>
            </div>
            </form>
        </div>
    </div>
</body>
</html>