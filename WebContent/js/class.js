// JavaScript Document
var GLOBAL_BLOG_URL_USER_APP = "http://user.bokee.com/user.php/";

var msg;
 var msg1;
 
/**
 * 分类管理
 */
function navmanage(){
	var time = new Date().getTime();
	msg = new MsgBox({
		"dataSource":GLOBAL_BLOG_URL_USER_APP+'category/navmanagebox/'+time,
		"dragElem":"drag",
		"closeElem":"navmanageno"
	});
	$("#navmanageok").live("click",function(){
		msg.closeMsgBox();
		author_category_getnames();
	})
}
/**
 * 添加分类
 */
function addnav(num){
	$.ajax({
		url :GLOBAL_BLOG_URL_USER_APP+'category/add/', 
		type:'post',
		data:'classname='+$("#categoryname").val()+'&submit=创建分类',
		dataType:'json', 
		beforeSend:function(a,b,c){	
			if(num>=20){
				alert('非常抱歉，您的分类数目已经达到上限，无法再创建分类！');
				return false;
			}
			if($.trim($("#categoryname").val())==0 ){
				alert('您没有输入分类名称！');
				return false;
			}
			var catelength = $("#categoryname").val().replace(/[ ]/g,"");
			if(catelength.length >15){
				alert('分类名称长度不能大于15个字符！');
				return false;
			}
		},
		success:function(data){
			if(data == 2){
				alert('非常抱歉，您的分类数目已经达到上限，无法再创建分类！');
			}else if(data == 3){
				alert('您好，该分类已经存在或已经被您删除！');
			}else{
				var name = $("#categoryname").val();
				var $html = $('<li class="flgl_li2" id="catalogId_'+data.catalogId+'"><span class="left">'+name+'</span><strong class="left">(0)</strong><span class="right"><a href="javascript:void(0)" onclick="deletenav(\''+data.catalogId+'\');">[删除]</a></span><span class="right"><a href="javascript:void(0)" onclick="editenav(\''+data.catalogId+'\',\''+name+'\');">[编辑]</a></span></li>');
				$(".flgl_li1").after($html);
				$html.slideDown("slow");
				$("#categoryname").val('');
				if($("#catalogId").length>0){
					var $newCatalog =  '<option value="'+data.catalogId+'">'+name+'</option>';
					$('#catalogId').prepend($newCatalog);
				}
			}
		}

	})
}
/*分类管理的删除分类*/
function deletenav(categoryid){
	 msg.closeMsgBox();
	 msg1 = new MsgBox({
			"dataSource":GLOBAL_BLOG_URL_USER+'/user.php/category/navdeletebox/categoryid/'+categoryid,
			"dragElem":"drag",
			"closeElem":"navdeleteno1,navdeleteno2"
		});
	
}
function deletenavok(categoryid){
	
	$("#categorycontent").html('正在删除...<p>请稍等..</p>');
	$("#button").remove();
	$.ajax({
		type : "get",
		url  :  GLOBAL_BLOG_URL_USER_APP+"category/delete/",
		data : "classid="+categoryid,
		dataType:'json', 
		success : function(data) {
			if(data == '1'){
				msg1.closeMsgBox();
//				$("#class_id").html('');
//				author_category_getnames();
				window.location.reload();
			}else if(data == '2'){
				alert('delete is error');
			}
		},
		error:function(data){
			alert('删除失败');
		}
    });
}
/*分类管理的编辑分类*/
function editenav(categoryid,categoryname){
	$("#catalogId_"+categoryid).html('<li class="flgl_li3"><input name="" type="text" value="'+categoryname+'" id="edit_'+categoryid+'" /><input name="" type="button" value="确定" class="small_btn" onclick="editenavok(\''+categoryid+'\',\''+categoryname+'\',\'1\')" /><input name="" type="button" value="取消" class="small_btn" onclick="editenavok(\''+categoryid+'\',\''+categoryname+'\',\'2\')"/></li>');
}

function editenavok(categoryid,categoryname,state){			//state区分是确定按钮还是取消按钮
	
	if(state == '1'){
		var editename = $('#edit_'+categoryid).val();
		$.ajax({
			type : "get",
			url  :  GLOBAL_BLOG_URL_USER_APP+"category/edit/",
			data : "classid="+categoryid+"&classname="+editename,
			dataType:'json', 
			success : function(data) {
				$("#catalogId_"+categoryid).html('<li class="flgl_li2" id="catalogId_'+categoryid+'"><span class="left">'+editename+'</span><span class="right"><a href="javascript:void(0)" onclick="deletenav(\''+categoryid+'\');">[删除]</a></span><span class="right"><a href="javascript:void(0)" onclick="editenav(\''+categoryid+'\',\''+editename+'\');">[编辑]</a></span></li>');
			},
			error:function(data){
				alert('编辑分类错误');
			}
	    })
	}else if(state == '2'){
		$("#catalogId_"+categoryid).html('<li class="flgl_li2" id="catalogId_'+categoryid+'"><span class="left">'+categoryname+'</span><span class="right"><a href="javascript:void(0)" onclick="deletenav(\''+categoryid+'\');">[删除]</a></span><span class="right"><a href="javascript:void(0)" onclick="editenav(\''+categoryid+'\',\''+categoryname+'\');">[编辑]</a></span></li>');
	}
}




