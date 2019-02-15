


function encryptionPassword(){				
	var md5KeyR= "jL2NdrALvN";
	//表单提交时对输入的密码进行加密， 避免抓包分析破解密码
    var hash1 = $('#password').val()+md5KeyR; 
	var hash2=MD5(hash1); 
    $('#password').val(hash2);
   } 