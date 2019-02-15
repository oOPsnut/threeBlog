<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员注册</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/aregister.css" type="text/css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-rebox.css"/>
<script src="${pageContext.request.contextPath}/js/jquery-1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/md5.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-rebox.css"/>
<script src="${pageContext.request.contextPath}/js/jquery-rebox.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
<!-- 提交表单校验  -->
<script src="${pageContext.request.contextPath}/js/acheckform.js"></script>
<script src="${pageContext.request.contextPath}/js/acheck.js"></script>
</head>
<body>
<div id="login_right" align="center">
    	<div id="right_content">
        	<img id="right_content_img" src="${pageContext.request.contextPath}/image/footer_logo.png">
        	<h2 style="-webkit-margin-before:0px;-webkit-margin-after:0px;color: #cc6633;">后台管理中心</h2>
        	<form action="${pageContext.request.contextPath}/AdminServlet?method=AdminRegister" method="post" id="AdminRegister">
            <div id="right_content_f" align="center">
            	<div class="f_username">
            	<input class="f_username_input" type="text" name="phone" id="phone"  placeholder=" 请 输 入 手 机 号" >
            	<span class="errorSpan" id="span02"></span>
            	</div>
                <div class="f_username">
                <input class="f_username_input" type="text" name="username" id="username"  placeholder=" 请 输 入 用 户 名（ 唯 一 ）" >
                <span class="errorSpan"></span>
                </div>
                <div class="f_username">
                <input class="f_username_input" type="password" name="password1" id="password1" placeholder=" 请 输 入 密 码"  >
                <span class="errorSpan"></span>
                </div>
                <div class="f_username">
                <input class="f_username_input" type="password" name="password2" id="password2" placeholder=" 请 再 次 输 入 密 码" >
                <span class="errorSpan"></span>
                </div>
                <div class="f_username">
            	<input class="f_username_input" type="text" name="license_code" id="license_code"  placeholder=" 请 输 入 授 权 码" >
            	<span class="errorSpan" id="span02"></span>
            	</div>
                <div id="f_checknumber">
                <input id="f_cnum_input" type="text" name="code" placeholder=" 请 输 入 验 证 码" >
                <a id="f_cnum_a" href="javascript:;" onclick="sendMessage()" method="post">发送验证码</a><br>
                <span class="errorSpan" id="span01"></span>
                </div>
                <input type="submit" name="submit" id="register" value="立 即 注 册" onclick="return checkAll();"/><br>
                
                <a id="login_now" href="${pageContext.request.contextPath}/RedirectServlet?method=AloginUI">已有账号？立即登陆</a>
            </div>
            </form>
        </div>
    </div>
</body>
</html>