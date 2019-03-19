


function encryptionPassword(){				
	var md5KeyR= "y7rl1klIeH";
	//表单提交时对输入的密码进行加密， 避免抓包分析破解密码
    var hash1 = $('#password').val()+md5KeyR; 
	var hash2=MD5(hash1); 
    $('#password').val(hash2);
   } 

//验证手机格式
function isPhoneNum() {
	var reg =/^[1][3,4,5,7,8][0-9]{9}$/;
    var phone=$('#phone').val();
    var result=reg.test(phone);
    if (!result) {
    	 $(".errorMsg").html("手机格式错误！");
	}else {
		 $(".errorMsg").html("");
	}
}