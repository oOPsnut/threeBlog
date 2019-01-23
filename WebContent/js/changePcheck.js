
$(function(){
	validateSimpleValidate();
});

//重置页面
function resetForm(){
	//清空三个空格信息
	$("#oldPasswd").val("");
	$("#newPasswd1").val("");
	$("#newPasswd2").val("");
}

//提交之前进行验证
function checkAll(obj){
	if(validateSimpleValidate().form()){
		//判断是否符合规则
		//符合则进入后台ajax处理
		//表单提交时对输入的密码进行加密， 避免抓包分析破解密码
		//加密字段				
		var md5KeyR= "y7rl1klIeH";
	    var hash1 = $('#newPasswd1').val()+md5KeyR; 
		var hash2=MD5(hash1); 
	    $('#newPasswd1').val(hash2);
	    $('#newPasswd2').val(hash2);    
	    alert("修改密码成功，将自动返回登录页面");
	    return true;
	}else{
		//不符合规则返回
		alert("错误，请更正！");
		return false;
	}
}

//自定义校验
//1.密码校验
$.validator.addMethod("Password",function(value,element,params){
	var reg=/^[a-zA-Z0-9]{6,35}$/;  
	return this.optional(element)||(reg.test(value));
});

//校验
function validateSimpleValidate(){
	var simpleValidateResult = $("#changePassword").validate({
			
			rules:{
				oldPasswd:{
					required:true,//必填不能为空		
					Password:true,//自定义检测
					rangelength:[6,35],
					remote:{
						url:"/ThreeBlog_V1.0/UserServlet?method=checkOldPasswd",
						type:"post",
						dataType:"json",
						data:{
							oldpasswd:function(){
								var md5KeyR= "y7rl1klIeH";
							    var hash1 = $('#oldPasswd').val()+md5KeyR; 
								var hash2=MD5(hash1);
								return hash2;
							},
							phone:function(){
								return $("#hid").val();
							},
						dataFilter: function (data) {  //判断控制器返回的内容
					        //var notice = eval("("+ data +")");
					        if(data){
					            return true;
					        }else{
					             return false;
					        	}
					     	}
						}
					}
				},
				newPasswd1:{
					required:true,
					rangelength:[6,35],
					Password:true
				},
				newPasswd2:{
					required:true,
					rangelength:[6,35],
					equalTo:'#newPasswd1'
				}			
			},
			messages:{
				oldPasswd:{
					required:"请输入",	
					Password:"格式错误",
					rangelength:"限6-35位",
					remote:"原密码不正确"
				},
				newPasswd1:{
					required:"请输入",
					rangelength:"限6-35位",
					Password:"格式错误"
				},
				newPasswd2:{
					required:"请输入",
					rangelength:"限6-35位",
					equalTo:"不一致"
				}				
			},
			errorPlacement:function(error,element){
				//自定义错误信息显示位置
				error.appendTo(element.parent().find("span[class='errorSpan']"));
			},
			success:function(label){
				
				label.html("<font color='green'>✔</font>");
			}
			
	});
		return simpleValidateResult;
}
