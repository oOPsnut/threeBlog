
//去除空格方法
function trim(str) {
	var strnew = str.replace(/\s+/g, "");
	return strnew;
}

//保存到localstorages中
function save(){
	//先判断能否保存
	if(! window.localStorage){
	    alert("您的浏览器不支持localstorage保存草稿，对不起！o_o !!! ");
	    return false;
	}else{
		//获取当前时间
		var curTime=new Date().getTime();
		//获取表单数据
		var fm=$("#img").attr('src');
		var bt=$("#bt").val();
		var dy=$("#pub_daoyu").val();
		var label=$("#labels").val();
		var pub_type=$("#pub_type").val();
		var content=CKEDITOR.instances.editor.getData();
	    //存储表单数据
		localStorage.setItem("fm",fm);//封面
		localStorage.setItem("bt",bt);//标题
		localStorage.setItem("dy",dy);//导语
		localStorage.setItem("labels", label);//标签
		localStorage.setItem("pub_type",pub_type);//分类
		localStorage.setItem("content",content);//文章内容
		localStorage.setItem("curTime",curTime);//当前存储时间
		alert("保存成功(10分钟)");
		return true;
	}
}
$( function mystorage(){
	//刷新后重新获取输入输入框中填入的值
	var fm=localStorage.getItem("fm");
	var bt=localStorage.getItem("bt");
	var dy=localStorage.getItem("dy");
	var label=localStorage.getItem("labels");
	var pub_type=localStorage.getItem("pub_type");
	var content=localStorage.getItem("content");
	//获取当初保存时间
	var saveTime=localStorage.getItem("curTime");
	//获取当前读档时间
	var readTime=new Date().getTime();
	//十分钟内有效
	if(readTime-saveTime<1000*60*10){
	//获取并赋予对应值
	$("#img").attr('src',fm);
	$("#bt").val(bt);
	$("#pub_daoyu").val(dy);
	$("#labels").val(label);
	$("#pub_type").val(pub_type);
	CKEDITOR.instances.editor.setData(content);
	}else{
		window.localStorage.clear();
	}
} );


//由于标题和导语已经加了required的属性。
//检查封面、标签、博文是否为空(安全起见，加上标题、导语检查)
function checkAll(){

	//获取内容
	var isrc=$("#img").attr('src');
	var labels = $("#labels").val();
	var bt=$("#bt").val();
	var dy=$("#pub_daoyu").val();
	//去空格
	var tlabels = trim(labels);
	var tbt = trim(bt);
	var tdy = trim(dy);
	//判断博文为空
	if(CKEDITOR.instances.editor.getData()==""||!isrc||tlabels==""||tbt==""||tdy==""){
		alert("（封面、标签、文章、标题、导语）内容均不能为空！");
		return false;
	}else {
		 window.localStorage.clear();
		return true;
	}
	
};



//测试支持localstorage（已测试，支持）
//if(window.localStorage){
//alert("浏览支持localStorage")
//}else{
//alert("浏览暂不支持localStorage") 
//} 