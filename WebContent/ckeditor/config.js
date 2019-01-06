/**
 * @license Copyright (c) 2003-2017, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	//界面布局
	config.toolbarGroups = [
		{ name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
		{ name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
		{ name: 'insert', groups: [ 'insert' ] },
		{ name: 'editing', groups: [ 'find', 'selection', 'spellchecker', 'editing' ] },
		{ name: 'forms', groups: [ 'forms' ] },
		'/',
		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
		{ name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi', 'paragraph' ] },
		{ name: 'links', groups: [ 'links' ] },
		'/',
		{ name: 'styles', groups: [ 'styles' ] },
		{ name: 'colors', groups: [ 'colors' ] },
		{ name: 'tools', groups: [ 'tools' ] },
		{ name: 'others', groups: [ 'others' ] },
		{ name: 'about', groups: [ 'about' ] }
	];
	//界面高度
	config.height = 900;
	//去除某些功能
	config.removeButtons = 'Save,Print,Form,Checkbox,Radio,TextField,Textarea,Select,Button,ImageButton,HiddenField,CreateDiv,Source,Iframe,Flash,About';	
	//移除可以人为调节编辑器大小
	config.removePlugins = 'elementspath,resize';
	
	// 图片上传相关
	//清楚预览图片的文字说明
	config.image_previewText=' ';
	config.removeDialogTabs = 'image:advanced;image:Link'; // 移除图片上传页面的'高级','链接'页签
	config.removeDialogTabs = 'link:advanced;link:upload;link:target';// 移除超链接页面的'高级','上传','目标'页签
	config.filebrowserBrowseUrl =  '/ThreeBlog_V1.0/ckfinder/ckfinder.html' ; 
	config.filebrowserImageBrowseUrl =  '/ThreeBlog_V1.0/ckfinder/ckfinder.html?type=Images' ;  
    config.filebrowserUploadUrl =  '/ThreeBlog_V1.0/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files' ;  
    config.filebrowserImageUploadUrl =  '/ThreeBlog_V1.0/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images' ;  // 图片上传路径
    config.filebrowserWindowWidth = '1000';  
    config.filebrowserWindowHeight = '700';  
	
	//界面语言，默认为 'en'  
	config.language = 'zh-cn';  
	
//	// 在 CKEditor 中集成 CKFinder，注意 ckfinder 的路径选择要正确。 
//	//CKFinder.SetupCKEditor(null, '/ThreeBlog_V1.0/ckfinder/');
	
	config.pasteFromWordRemoveFontStyles = false;
	config.pasteFromWordRemoveStyles = false;

	 //当从word里复制文字进来时，是否进行文字的格式化去除 plugins/pastefromword/plugin.js
    config.pasteFromWordIgnoreFontFace = true; //默认为忽略格式

    //是否使用<h1><h2>等标签修饰或者代替从word文档中粘贴过来的内容 plugins/pastefromword/plugin.js
    config.pasteFromWordKeepsStructure = false;

    //从word中粘贴内容时是否移除格式 plugins/pastefromword/plugin.js
    config.pasteFromWordRemoveStyle = false;
};
