
//消息导航栏切换
//默认评论页面
/*function m_reviews(){
	$("#introduce_right_Frame").load("/ThreeBlog_V1.0/jsp/personalcenter/personalcenter_myHome.jsp?article_type=all");
}*/

/*$(function(){
	//未读div显示
	$("#notreadDiv").show();
	//已读div隐藏
	$("#readDiv").hide();
});*/
//等同于上面方法
//已读、未读选择器默认是：未读
function Read(){
	//未读div显示
	$("#notreadDiv").show();
	//已读div隐藏
	$("#readDiv").hide();
}

//为选择器添加改变事件
function Readselect(){
	//获取select当前选中值
	var value = $('#selectRead option:selected') .val();
	if(value=='read'){
		//已读div显示
		$("#readDiv").show();
		//未读div隐藏
		$("#notreadDiv").hide();
	}else if(value=='notread'){
		//未读div显示
		$("#notreadDiv").show();
		//已读div隐藏
		$("#readDiv").hide();
	}
	
}