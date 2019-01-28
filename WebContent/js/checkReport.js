
//去除空格
function trim(str) {
	var strnew = str.replace(/^\s*|\s*$/g, "");
	return strnew;
}

//检查举报表单是否为空
function checkArticle(){
	//获取值
	var daoyu=$("#daoyu").val();
	var answer=$("#answer").val();
	var all_reason=$("#all_reason").val();
	//去空格
	var Nanswer=trim(answer);
	var Nall_reason=trim(all_reason);
	
	$("#answer").val(Nanswer);
	$("#all_reason").val(Nall_reason);
	
	if(daoyu!=""&&Nanswer!=""&&Nall_reason!=""){
		alert("举报成功！确定返回个人中心...");
		return true;
	}else{
		alert("举报信息未完成...");
		return false;
	}
}

//检查举报表单是否为空
function checkReviews(){
	//获取值
	var content=$("#content").val();
	var answer=$("#answer").val();
	var all_reason=$("#all_reason").val();
	//去空格
	var Nanswer=trim(answer);
	var Nall_reason=trim(all_reason);
	
	$("#answer").val(Nanswer);
	$("#all_reason").val(Nall_reason);
	
	if(content!=""&&Nanswer!=""&&Nall_reason!=""){
		alert("举报成功！确定返回个人中心...");
		return true;
	}else{
		alert("举报信息未完成...");
		return false;
	}
}