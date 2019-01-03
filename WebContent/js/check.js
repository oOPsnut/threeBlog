
//去除空格
function trim(str) {
	var strnew = str.replace(/^\s*|\s*$/g, "");
	return strnew;
}

//发送验证码
var InterValObj;//timer变量，控制时间
var count = 120;//间隔函数，1秒执行
var curCount;//当前剩余秒数
var code="";//验证码
var codeLength=6;//验证码长度
function sendMessage(){
	curCount=count;
	var phone = $("#phone").val(); //获取phone输入框的值
	var tips = $("#span01").text(); //获取错误提示
	var result=$("#span02").text();	//获取phone检测结果
	if(result=="✔"){
			
			//设置a效果开始倒计时
			$("#f_cnum_a").css("pointer-events","none");
			$("#f_cnum_a").text(+curCount+"s后再发送");
			//启动计时器，1秒执行一次
			InterValObj = window.setInterval(SetRemainTime,1000);
			//向后台发送处理数据
			$.ajax({
				type:"POST",//用post方式传输
				dataType:"json",//数据格式:JSON
				url:"/ThreeBlog_V1.0/UserServlet?method=sendCode" ,//目标地址
				data:{"phone":phone},
				error:function(){
					alert("出错！");
				},
				success:function(data){
					if(data){
						alert("验证码发送成功！");
						//$("#span02").html("<font color='green'>成功</font>");
					}else{
						alert("验证码发送失败！");
						//$("#span02").html("<font color='red'>失败</font>");
					}
				}
			});
			
	}
	//timer处理函数
function SetRemainTime(){
	if(curCount==0){
		window.clearInterval(InterValObj);//停止计时器
		//$("#f_cnum_a").removerAttr("disabled");
		$("#f_cnum_a").removeAttr("style");//启用按钮
		$("#f_cnum_a").text("重发验证码");
		code="";//清除验证码，如果不清除，过时间后，输入收到的验证码仍然有效
	}else{
		curCount--;
		$("#f_cnum_a").text(+curCount+"s后再发送");
	}
}

$(document).ready(function(){
//	$("#f_cnum_input").blur(function(){
//		//获取输入框内容
//		var CheckCodeVal = $("#f_cnum_input").val();
//		//向后台发送处理数据
//		$.ajax({
//				url:"${pageContext.request.contextPath}/servlet/CheckCodeServlet",
//				data:{CheckCode : CheckCodeVal},
//				type:"POST",
//				dataType:"text",
//				success:function(data){
//					data = parseInt(data,10);
//					if(data == 1){
//						$("#span04").html("<font color='green'>正确</font>");
//					}else{
//						$("#span04").html("<font color='red'>错误</font>");
//					}
//				}
//		});	
//	});
});
}



//var lock=true; //定义一把锁
//确保所有都验证成功
//function checkAll(){
//	if(lock=true){
//		
//		lock=false;//上锁
//		
//		var flag=false;
//		var uflag=checkUserName();
//		var pflag=checkPhone();
//		var p1flag=checkPassword();
//		var p2flag=checkPasswd();
//		alert("手机号"+pflag+"----"+"用户名"+uflag+"----"+"密码"+p1flag+"----"+"密码2"+p2flag);
//		if(checkUserName()&&checkPhone()&&checkPassword()&&checkPasswd()){
//			flag=true;
//		}
//		return flag;
//	}else{
//		return false;
//	}
//}

//验证用户名是否可用
//function checkUserName() {
//		
//		
//		//1.获取输入框的内容
//		var username = $("#username").val();
//		
//		if(trim(username)!=""){
//			var uPattern =  /^[\u4e00-\u9fff\w]{5,10}$/;
//			var flag;
//			var ok;
//			if(uPattern.test(username)){
//			//2.发送请求
//			$.post("/ThreeBlog_V1.0/UserServlet?method=CheckUsername",{username:username},function(data,status){
//			//3.输出响应的数据到页面上
//				
//				if (data == 1) {
//					//用户名存在
//					$("#span01").html("<font color='red'>已存在</font>");
//				}else {
//					//用户名可用
//					$("#span01").html("<font color='green'>可用</font>");
//					ok=true;
//				}
//			}); 
//			alert(ok);
//			if(ok){return true;}
//			}else{
//				$("#span01").html("<font color='red'>不可用</font>");
//				alert("用户名限4到10位（中文，字母，数字，下划线，减号）,请重新输入");
//			}
//		}else{
//			$("#span01").html("<font color='red'>请输入</font>");
//		}
//		return flag;
//	}

//验证手机号是否可用
//function checkPhone() {
//	
//	
//	//1.获取输入框的内容
//	var phone = $("#phone").val();
//	if(trim(phone)!=""){
//		var myreg=/^[1][3,4,5,7,8][0-9]{9}$/;
//		if(myreg.test(phone)){
//			//2.发送请求
//			
//			$.post("/ThreeBlog_V1.0/UserServlet?method=CheckPhone",{phone:phone},function(data,status){
//			//3.输出响应的数据到页面上
//				if (data == 1) {
//					//手机号存在
//					$("#span02").html("<font color='red'>已注册</font>");
//					return false;
//				}else {
//					//手机号可用
//					$("#span02").html("<font color='green'>可用</font>");
//					return true;
//				}
//			});
//		}else{
//			alert("手机号码格式错误,请重新输入");
//			window.location.reload();
//			return false;
//		}
//	}else{
//		$("#span02").html("<font color='red'>请输入</font>");
//		return false;
//	}
//}
////发送验证码
//var InterValObj;//timer变量，控制时间
//var count = 120;//间隔函数，1秒执行
//var curCount;//当前剩余秒数
//var code="";//验证码
//var codeLength=6;//验证码长度
//function sendMessage(){
//	curCount=count;
//	var phone = $("#phone").val();
//	var tips = $("#f_cnum_a").text();
//	var result=$("#span02").html();
//	if(trim(phone)!=""){
//		if(result=="<font color='green'>可用</font>"){
//			//产生验证码
//			for(var i =0;i < codeLength;i++){
//				code+=parseInt(Math.random() * 9).toString();
//			}
//			//设置a效果开始倒计时
//			$("#f_cnum_a").attr("disabled","true");
//			$("#f_cnum_a").text(+curCount+"s后再发送");
//			//启动计时器，1秒执行一次
//			InterValObj = window.setInterval(SetRemainTime,1000);
//			//向后台发送处理数据
//			$.ajax({
//				type:"POST",//用post方式传输
//				dataType:"text",//数据格式:JSON
//				url:"${pageContext.request.contextPath}/servlet/RegisterCodeServlet" ,//目标地址
//				data:"phone="+phone+"&code="+code,
//				error:function(XMLHttpRequest,textStatus,errorThrown){
//					
//				},
//				success:function(data){
//					data = parseInt(data,10);
//					if(data==1){
//						$("#span02").html("<font color='green'>成功</font>");
//					}else if(data == 0){
//						$("#span02").html("<font color='red'>失败</font>");
//					}
//				}
//			});
//			
//		}else{
//			$("#span02").html("<font color='red'>不可用</font>");
//		}
//	}
//	//timer处理函数
//function SetRemainTime(){
//	if(curCount==0){
//		window.clearInterval(InterValObj);//停止计时器
//		$("#f_cnum_a").removerAttr("disabled");//启用按钮
//		$("#f_cnum_a").text("重发验证码");
//		code="";//清除验证码，如果不清除，过时间后，输入收到的验证码仍然有效
//	}else{
//		curCount--;
//		$("#f_cnum_a").text(+curCount+"s后再发送");
//	}
//}


////验证两次密码是否一致
//function checkPassword(){
//	
//	//获取输入框的内容
//	var pwd1=$("#password1").val();
//	var pwd2=$("#password2").val();
//	//对比两次输入的密码
//	if(trim(pwd1)==trim(pwd2)){
//			$("#span03").html("<font color='green'>一致</font>");
//			return true;
//	}else{
//			$("#span03").html("<font color='red'>不一致</font>");
//			return false;
//	}
//}
//
////验证密码格式
//function checkPasswd(){
//	//获取输入框的内容
//	var pwd1=$("#password1").val();
//	if(trim(pwd1)!=""){
//		var reg=/^[a-zA-Z0-9]{6,30}$/;    
//		if(reg.test(pwd1)){
//			$("#span04").html("<font color='green'>可用</font>");
//			return true;
//		}else{
//			alert("密码格式错误！不能有空格，长度不能小于6位，大于30位。");
//			return false;
//		}
//	}else{
//		$("#span04").html("<font color='red'>请输入</font>");
//		return false;
//	}
//}