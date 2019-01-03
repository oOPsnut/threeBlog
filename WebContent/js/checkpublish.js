
//去除空格方法
function trim(str) {
	var strnew = str.replace(/\s+/g, "");
	return strnew;
}

//为标签添加格式
function formatLabels(){
	var labels = $("#labels").val();
	var newlabels = trim(labels);
	if(newlabels!=""){
		var newlabels1 ="<"+newlabels+">";
		$("#labels").val(newlabels1)
	} 
};
