
//为选择器添加改变事件
function aTypeChange(){
	//获取select当前选中值
	var value = $('#ac-select option:selected') .val();
	if(value=='All'){
		$.post("/ThreeBlog_V1.0/AdminServlet?method=FindAllArticle",{},function(data,status){
			$("#defaultDiv").hide();
			$("#srDiv").show();
			$('#srDiv').html(data);
			
	});
	}else{
		$.post("/ThreeBlog_V1.0/AdminServlet?method=FindArticleByType",{article_type:value},function(data,status){
			$("#defaultDiv").hide();
			$("#srDiv").show();
			$('#srDiv').html(data);
			
	});
	}	
}