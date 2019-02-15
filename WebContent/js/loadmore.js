$(function(){
	
	/*初始化*/
	var counter = 0; /*计数器*/
	var pageStart = 0; /*offset*/
	var pageSize = 5; /*size*/
	
	/*首次加载*/
	//getData(pageStart, pageSize);
	
	/*监听加载更多*/
	//热门
	$("#loadmore").click(function(){
		var alt =$("#loadmore").attr("alt");
		//alert(alt);
		counter++;	
		pageStart = counter * pageSize;
		getData(pageStart, pageSize,alt);
	});	
});


function getData(offset,size,alt){
    $.post('/ThreeBlog_V1.0/HomepageServlet?method=loadmore',{"offset":offset,"size":size,"alt":alt},function(data,status){
        	
            if(data!=1){
            	$("#loadmoreDiv").append(data);  
            	$("#loadmoreButton").show();
            }else if(data==1){
            	$("#loadmoreButton").hide();
            }
        }      
    );
}


