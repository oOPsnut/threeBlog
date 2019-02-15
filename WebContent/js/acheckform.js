
$(function(){
	validateSimpleValidate();
});

//提交之前进行验证
function checkAll(obj){
	if(validateSimpleValidate().form()){
		//判断是否符合规则
		//符合则进入后台ajax处理
		var s = confirm("注册后，用户名不能修改！");
		if(s==true){	
		//表单提交时对输入的密码进行加密， 避免抓包分析破解密码
		//加密字段				
		var md5KeyR= "jL2NdrALvN";
	    var hash1 = $('#password1').val()+md5KeyR; 
		var hash2=MD5(hash1); 
	    $('#password1').val(hash2);
	    $('#password2').val(hash2);	
	    alert("注册成功，将自动返回登录页面");	
	    return true;
	    
		}else{
			return false;
		}
	}else{
		//不符合规则返回
		alert("错误，请更正！");
		return false;
	}
}

//自定义校验
//1.用户名校验
$.validator.addMethod("userName",function(value,element,params){
	var uPattern =  /^[\u4e00-\u9fff\w]{3,10}$/;
	return this.optional(element)||(uPattern.test(value));
});

//2.手机号校验
$.validator.addMethod("Phone",function(value,element,params){
	var myreg=/^[1][3,4,5,7,8][0-9]{9}$/;
	return this.optional(element)||(myreg.test(value));
});

//3.密码校验
$.validator.addMethod("Password",function(value,element,params){
	var reg=/^[a-zA-Z0-9]{6,35}$/;  
	return this.optional(element)||(reg.test(value));
});
//4.授权码校验
$.validator.addMethod("LicenseCode",function(value,element,params){
	var reg=/^[a-zA-Z0-9]{10}$/;  
	return this.optional(element)||(reg.test(value));
});


//校验
function validateSimpleValidate(){
	
	var simpleValidateResult = $("#AdminRegister").validate({
			rules:{
				phone:{
					required:true,//必填不能为空		
					Phone:true,
					remote:{
						url:"/ThreeBlog_V1.0/AdminServlet?method=CheckPhone",
						type:"post",
						dataType:"json",
						data:{
							phone:function(){
								return $("#phone").val();
							},
						dataFilter: function (data) {  //判断控制器返回的内容
					        //var notice = eval("("+ data +")");
					        if( data ){
					            return true;
					        }else{
					             return false;
					        	}
					     	}
						}
					}
				},
				username:{
					required:true,
					rangelength:[3,10],
					userName:true,
					remote:{
						url:"/ThreeBlog_V1.0/AdminServlet?method=CheckUsername",
						type:"post",
						dataType:"json",
						data:{
							username:function(){
								return $("#username").val();
							},
						dataFilter: function (data) {  //判断控制器返回的内容
					        //var notice = eval("("+ data +")");
					        if( data ){
					            return true;
					        }else{
					             return false;
					        	}
					     	}
						}
					}
				},
				password1:{
					required:true,
					rangelength:[6,35],
					Password:true
				},
				password2:{
					required:true,
					rangelength:[6,35],
					equalTo:'#password1'
				},
				license_code:{
					required:true,
					LicenseCode:true,
					minlength:10,
					maxlength:10,
					remote:{
						url:"/ThreeBlog_V1.0/AdminServlet?method=CheckLicenseCode",
						type:"post",
						dataType:"json",
						data:{
							phone:function(){
								return $("#phone").val();
							},
							license_code:function(){
								return $("#license_code").val();
							},
						dataFilter: function (data) {  //判断控制器返回的内容
					        //var notice = eval("("+ data +")");
					        if( data ){
					            return true;
					        }else{
					             return false;
					        	}
					     	}
						}
					}
				}
				},
				code:{
					required:true,
					digits:true,
					minlength:6,
					maxlength:6,
					remote:{
						url:"/ThreeBlog_V1.0/AdminServlet?method=CheckCode",
						type:"post",
						dataType:"json",
						data:{
							phone:function(){
								return $("#f_cnum_input").val();
							},
						dataFilter: function (data) {  //判断控制器返回的内容
					        //var notice = eval("("+ data +")");
					        if( data ){
					            return true;
					        }else{
					             return false;
					        	}
					     	}
						}
					}				
			},
			messages:{
				phone:{
					required:"请输入",	
					Phone:"格式错误",
					remote:"未授权"
				},
				username:{
					required:"请输入",
					rangelength:"限3-10位",
					userName:"格式错误",
					remote:"已存在"
				},
				password1:{
					required:"请输入",
					rangelength:"限6-35位",
					Password:"格式错误"
				},
				password2:{
					required:"请输入",
					rangelength:"限6-35位",
					equalTo:"不一致"
				},
				license_code:{
					required:"请输入",
					LicenseCode:"格式错误",
					minlength:"至少10位",
					maxlength:"限10位数",
					remote:"输入错误"
				},
				code:{
					required:"请输入",
					digits:"必须数字",
					minlength:"至少6位",
					maxlength:"限6位数",
					remote:"输入错误"
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




