
//去除空格方法
function trim(str) {
	var strnew = str.replace(/\s+/g, "");
	return strnew;
}

//添加封面预览
function change() {
	var pic = document.getElementById("img"), file = document
			.getElementById("publish_fm");

	var ext = file.value.substring(file.value.lastIndexOf(".") + 1)
			.toLowerCase();

	// gif在IE浏览器暂时无法显示
	if (ext != 'png' && ext != 'jpg' && ext != 'jpeg') {
		alert("图片的格式必须为png或者jpg或者jpeg格式！");
		return;
	}
	var isIE = navigator.userAgent.match(/MSIE/) != null, isIE6 = navigator.userAgent
			.match(/MSIE 6.0/) != null;

	if (isIE) {
		file.select();
		var reallocalpath = document.selection.createRange().text;

		// IE6浏览器设置img的src为本地路径可以直接显示图片
		if (isIE6) {
			pic.src = reallocalpath;
		} else {
			// 非IE6版本的IE由于安全问题直接设置img的src无法显示本地图片，但是可以通过滤镜来实现
			pic.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='image',src=\""
					+ reallocalpath + "\")";
			// 设置img的src为base64编码的透明图片 取消显示浏览器默认图片
			pic.src = 'data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==';
		}
	} else {
		html5Reader(file);
	}
}

function html5Reader(file) {
	var file = file.files[0];
	var reader = new FileReader();
	reader.readAsDataURL(file);
	reader.onload = function(e) {
		var pic = document.getElementById("img");
		pic.src = this.result;
	}
}
//保存到localstorages中
function save(){
	//先判断能否保存
	if(! window.localStorage){
	    alert("您的浏览器不支持localstorage保存草稿，请使用IE8以上版本浏览器尝试，对不起！o_o !!! ");
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
		alert("保存成功");
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
//检查内容是否出现违规词语
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
		//清空localstorage的保存内容
		 window.localStorage.clear();
		 //获取文章内容
		 var articleTxt=CKEDITOR.instances.editor.document.getBody().getText(); //取得纯文本  
		 //检查是否出现违规词语,用ajax方法到后台检查
		 $.ajax({
			 type:"POST",//用post方式传输
				dataType:"json",//数据格式:JSON
				url:"/ThreeBlog_V1.0/ArticleServlet?method=CheckSensitiveWd" ,//目标地址
				data:{"bt":tbt,"labels":tlabels,"dy":tdy,"aTxt":articleTxt},
				error:function(){
					alert("出错！请稍后再试...");
				},
				success:function(data){
					if(data==0){
						var msg=confirm("发表后不能再修改哟！");
						if(msg){
							alert("发布成功，点击确定为您跳转...");
							return true;
						}else{
							return false;
						}
					}else if(data==1){
						alert("标题存在违规词！请检查并改正！");
						return false;
					}else if(data==2){
						alert("标签存在违规词！请检查并改正！");
						return false;
					}else if(data==3){
						alert("导语存在违规词！请检查并改正！");
						return false;
					}else if(data==4){
						alert("文章存在违规词！请检查并改正！");
						return false;
					}
				}
		 });		 	 
	}
	
};

