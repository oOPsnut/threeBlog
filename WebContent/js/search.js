//检查输入是否为空
function check(){  	
		if($('#search_w').val()==""){
			alert("搜索内容不能为空！请输入搜索内容！");
			return false;
		}	
		if($('#search_r_w').val()==""){
			alert("搜索内容不能为空！请输入搜索内容！");
			return false;
		}
}  

$(function(){
	//捕捉键盘弹起事件
	$("#search_w").keyup(function(){
		//获取输入框的值
		var word = $('#search_w').val();
		//判断是否为空
		if(word==""){
			$('#search_h').hide();
		}else{
			//请求数据
			$.post("/ThreeBlog_V1.0/HomepageServlet?method=search",{word:word},function(data,status){
					//alert(data);
					if(data==1){
						$('#search_h').hide();
					}else{
						//alert(data);
						$('#search_h').show();
						$('#search_h').html(data);
					}				
			});
		}
	})
	
	//捕捉键盘弹起事件
	$("#search_r_w").keyup(function(){
		//获取输入框的值
		var words = $('#search_r_w').val();
		//判断是否为空
		if(words==""){
			$('#search_r_h').hide();
		}else{
			//请求数据
			$.post("/ThreeBlog_V1.0/HomepageServlet?method=search",{word:words},function(data,status){
					//alert(data);
					if(data==1){
						$('#search_r_h').hide();
					}else{
						//alert(data);
						$('#search_r_h').show();
						$('#search_r_h').html(data);
					}				
			});
		}
	})
});