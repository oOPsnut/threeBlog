
//未登录点击关注
function clickfollow(){
	var r =confirm("你还未登录，点击确定，则为你跳转到登录页面...");
	if(r){
		window.location.href='${pageContext.request.contextPath}/RedirectServlet?method=LoginUI';
	}	
}

/*//js获取地址栏的id
function getQueryString(name){
    var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if(r!=null)return  unescape(r[2]); return null;
}*/
var uid=null;

$(function(){
	uid=$("#hid").val();
});
//默认所有博文
function taChangeP(){
	$("#introduce_right_Frame").load("/ThreeBlog_V1.0/jsp/othercenter/othercenter_taHome.jsp?article_type=all",{"uid":uid});
}
//ta的收藏
function taCollect(){
	$("#introduce_right_Frame").load("/ThreeBlog_V1.0/jsp/othercenter/othercenter_taCollect.jsp",{"uid":uid});		
}

//ta的博文
function taHome(){
	$("#introduce_right_Frame").load("/ThreeBlog_V1.0/jsp/othercenter/othercenter_taHome.jsp?article_type=all",{"uid":uid});		
}

//ta的关注
function taFollowing() {
	$("#introduce_right_Frame").load("/ThreeBlog_V1.0/jsp/othercenter/othercenter_follow.jsp",{"uid":uid});		
}

//ta的粉丝
function taFollower() {
	$("#introduce_right_Frame").load("/ThreeBlog_V1.0/jsp/othercenter/othercenter_fans.jsp",{"uid":uid});		
}

//ta的博文类别
function taPub(obj){
	var M=$("#hid0").val();
	var G=$("#hid1").val();
	var Z=$("#hid2").val();
	var X=$("#hid3").val();
	var Y=$("#hid4").val();
	var L=$("#hid5").val();
	var S=$("#hid6").val();
	var Q=$("#hid7").val();
	var K=$("#hid8").val();
	var T=$("#hid9").val();
	if(obj==1){
		if(M>0){
			$("#introduce_right_Frame").load("/ThreeBlog_V1.0/jsp/othercenter/othercenter_taHome.jsp?article_type=m&flag=1",{"uid":uid});		    		
    	}else{
    		$("#introduce_right_Frame").load("/ThreeBlog_V1.0/jsp/othercenter/othercenter_taHome.jsp?article_type=m&flag=0",{"uid":uid});
    	}			
	}else if(obj==2){
		if(G>0){
			$("#introduce_right_Frame").load("/ThreeBlog_V1.0/jsp/othercenter/othercenter_taHome.jsp?article_type=g&flag=1",{"uid":uid});	
		}else{
			$("#introduce_right_Frame").load("/ThreeBlog_V1.0/jsp/othercenter/othercenter_taHome.jsp?article_type=g&flag=0",{"uid":uid});	
    	}
	}else if(obj==3){
		if(Z>0){
			$("#introduce_right_Frame").load("/ThreeBlog_V1.0/jsp/othercenter/othercenter_taHome.jsp?article_type=z&flag=1",{"uid":uid});	
		}else{
			$("#introduce_right_Frame").load("/ThreeBlog_V1.0/jsp/othercenter/othercenter_taHome.jsp?article_type=z&flag=0",{"uid":uid});		
    	}
	}else if(obj==4){
		if(X>0){
			$("#introduce_right_Frame").load("/ThreeBlog_V1.0/jsp/othercenter/othercenter_taHome.jsp?article_type=x&flag=1",{"uid":uid});	
		}else{
			$("#introduce_right_Frame").load("/ThreeBlog_V1.0/jsp/othercenter/othercenter_taHome.jsp?article_type=x&flag=0",{"uid":uid});		
    	}	
	}else if(obj==5){
		if(Y>0){
			$("#introduce_right_Frame").load("/ThreeBlog_V1.0/jsp/othercenter/othercenter_taHome.jsp?article_type=y&flag=1",{"uid":uid});	
		}else{
			$("#introduce_right_Frame").load("/ThreeBlog_V1.0/jsp/othercenter/othercenter_taHome.jsp?article_type=y&flag=0",{"uid":uid});		
    	}
	}else if(obj==6){
		if(L>0){
			$("#introduce_right_Frame").load("/ThreeBlog_V1.0/jsp/othercenter/othercenter_taHome.jsp?article_type=l&flag=1",{"uid":uid});	
		}else{
			$("#introduce_right_Frame").load("/ThreeBlog_V1.0/jsp/othercenter/othercenter_taHome.jsp?article_type=l&flag=0",{"uid":uid});		
    	}	
	}else if(obj==7){
		if(S>0){
			$("#introduce_right_Frame").load("/ThreeBlog_V1.0/jsp/othercenter/othercenter_taHome.jsp?article_type=s&flag=1",{"uid":uid});	
		}else{
			$("#introduce_right_Frame").load("/ThreeBlog_V1.0/jsp/othercenter/othercenter_taHome.jsp?article_type=s&flag=0",{"uid":uid});		
    	}	
	}else if(obj==8){
		if(Q>0){
			$("#introduce_right_Frame").load("/ThreeBlog_V1.0/jsp/othercenter/othercenter_taHome.jsp?article_type=q&flag=1",{"uid":uid});	
		}else{
			$("#introduce_right_Frame").load("/ThreeBlog_V1.0/jsp/othercenter/othercenter_taHome.jsp?article_type=q&flag=0",{"uid":uid});		
    	}
	}else if(obj==9){
		if(K>0){
			$("#introduce_right_Frame").load("/ThreeBlog_V1.0/jsp/othercenter/othercenter_taHome.jsp?article_type=k&flag=1",{"uid":uid});	
		}else{
			$("#introduce_right_Frame").load("/ThreeBlog_V1.0/jsp/othercenter/othercenter_taHome.jsp?article_type=k&flag=0",{"uid":uid});		
    	}
	}else if(obj==0){
		if(T>0){
			$("#introduce_right_Frame").load("/ThreeBlog_V1.0/jsp/othercenter/othercenter_taHome.jsp?article_type=t&flag=1",{"uid":uid});	
		}else{
			$("#introduce_right_Frame").load("/ThreeBlog_V1.0/jsp/othercenter/othercenter_taHome.jsp?article_type=t&flag=0",{"uid":uid});		
    	}	
	}
			
}
//ta的博文时间排序
function taPubT(obj){
	var y2018=$("#y2018").val();
	var y2019=$("#y2019").val();
	var y2020=$("#y2020").val();
	if(obj==2019){
		if(y2019>0){
			$("#introduce_right_Frame").load("/ThreeBlog_V1.0/jsp/othercenter/othercenter_taHome.jsp?time=2019&flag=1",{"uid":uid});				
		}else{
			$("#introduce_right_Frame").load("/ThreeBlog_V1.0/jsp/othercenter/othercenter_taHome.jsp?time=2019&flag=0",{"uid":uid});		
		}
	}else if(obj==2018){
		if(y2018>0){
			$("#introduce_right_Frame").load("/ThreeBlog_V1.0/jsp/othercenter/othercenter_taHome.jsp?time=2018&flag=1",{"uid":uid});				
		}else{
			$("#introduce_right_Frame").load("/ThreeBlog_V1.0/jsp/othercenter/othercenter_taHome.jsp?time=2018&flag=0",{"uid":uid});		
		}
	}else if(obj==2020){
		if(y2020>0){
			$("#introduce_right_Frame").load("/ThreeBlog_V1.0/jsp/othercenter/othercenter_taHome.jsp?time=2020&flag=1",{"uid":uid});				
		}else{
			$("#introduce_right_Frame").load("/ThreeBlog_V1.0/jsp/othercenter/othercenter_taHome.jsp?time=2020&flag=0",{"uid":uid});		
		}
	}else if(obj==0){
		$("#introduce_right_Frame").load("/ThreeBlog_V1.0/jsp/othercenter/othercenter_taHome.jsp?time=0",{"uid":uid});	
	}
			
}
