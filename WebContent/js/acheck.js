
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
				url:"/ThreeBlog_V1.0/AdminServlet?method=sendCode" ,//目标地址
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

}



