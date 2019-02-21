
function hidePasswd(){				
	var md5KeyR= "jL2NdrALvN";
	//表单提交时对输入的密码进行加密， 避免抓包分析破解密码
	//原密码
    var hash1 = $('#password').val()+md5KeyR; 
	var hash2=MD5(hash1); 
    $('#password').val(hash2);
    //新密码
    var hash3 = $('#newpassword').val()+md5KeyR; 
	var hash4=MD5(hash3); 
    $('#newpassword').val(hash4);
    //确认密码
    var hash5 = $('#newpassword1').val()+md5KeyR; 
	var hash6=MD5(hash5); 
    $('#newpassword1').val(hash6);
   } 


function encryptionPassword(){				
	var md5KeyR= "jL2NdrALvN";
	//表单提交时对输入的密码进行加密， 避免抓包分析破解密码
    var hash1 = $('#password').val()+md5KeyR; 
	var hash2=MD5(hash1); 
    $('#password').val(hash2);
   } 

//如果是ie8及其以下版本
function copyCode(){		
   if(judge_ie()<=8&&judge_ie()!=null){
		 var content =  $("#license_codeMsg").text();
		 if(content!=""){			 
			 window.clipboardData.setData("Text",content);
			 alert("你已经复制授权码，赶快粘贴给对方吧！");
		 }else{
			 alert("未获得授权码！");
		 }
   }else{
          //clipboard
		  //添加一个销毁之前事件的活动
        var clipboard = new ClipboardJS('#copy');
        var content =  $("#license_codeMsg").text();
		if(content!=""){
	        clipboard.on('success', function(e) {
	        alert('你已经复制授权码，赶快粘贴给对方吧！');			 
			 e.clearSelection();
			 clipboard.destroy();
	       });
	       clipboard.on('error', function(e) {
	        alert('很遗憾，您的浏览器版本过低，复制失败，请手动复制！');
	       });
		 }else{
			 alert("未获得授权码！");
		 }
   }
   		   
}
    
//判断是否是ie，及ie的版本
function judge_ie(){
    var win = window;
    var doc = win.document;
    var input = doc.createElement ("input");
    
    var ie = (function (){
        if (win.ActiveXObject === undefined) return null;
        if (!win.XMLHttpRequest) return 6;
        if (!doc.querySelector) return 7;
        if (!doc.addEventListener) return 8;
        if (!win.atob) return 9;
        if (!input.dataset) return 10;
        return 11;
    })();
    return ie;
}