
//未登录点击关注
function clickfollow(){
	var r =confirm("你还未登录，点击确定，则为你跳转到登录页面...");
	if(r){
		window.location.href='${pageContext.request.contextPath}/RedirectServlet?method=LoginUI';
	}	
}

//js获取地址栏的id
function getQueryString(name){
    var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if(r!=null)return  unescape(r[2]); return null;
}