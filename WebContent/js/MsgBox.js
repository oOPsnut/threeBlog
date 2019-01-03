// JavaScript Document
/**
* @version 1.1
* @author rsk
* @example
*
* var msgbox = new MsgBox({
*			"dataSource":"http://localhost:8080/test-artTemplate/alertTip1.action",
*			"closeElem":"close,no",
*			"dragElem":"drag",
*           "afterLoad":fn,
*			"callbacks":[{"id":"yes","callback":fn}]
*		});
*		
* 关闭方法：msgbox.closeMsgBox();
*
*/

	function $id(selector){
		if(typeof selector === "string"){
				if(selector.indexOf("#")!=-1){
					selector = selector.substring(1);
				}
				return document.getElementById(selector);	
		}else{
				return selector;
		}
	}
	function getScroll(){
		var t, l, w, h;
		if(document.documentElement && document.documentElement.scrollTop){
				t = document.documentElement.scrollTop;
				l = document.documentElement.scrollLeft;
				w = document.documentElement.scrollWidth;
				h = document.documentElement.scrollHeight;
		}else if(document.body){
				t = document.body.scrollTop;
				l = document.body.scrollLeft;
				w = document.body.scrollWidth;
				h = document.body.scrollHeight;
		}
		return { t: t, l: l, w: w, h: h };
	}
	
	function MsgBox(paramsObject){
	  var defaults = {
			"dataSource":undefined,
			"closeElem":undefined,
			"dragElem":undefined,
			"afterLoad":undefined,
			"callbacks":undefined
		}
		this.dataSource = paramsObject.dataSource;
		this.closeElem = paramsObject.closeElem;
		this.dragElem = paramsObject.dragElem;
		this.afterLoad = paramsObject.afterLoad;
		this.callbacks = paramsObject.callbacks;
		this.boxbg = document.createElement("div");
		this.boxbody = document.createElement("div");
		this.initialize();
	}
	MsgBox.prototype.initialize = function(){ 
			var that = this;
			if(this.dataSource){
				var ajax = window.XMLHttpRequest ?
				    new XMLHttpRequest() :
				    new ActiveXObject('Microsoft.XMLHTTP'),
				  url = this.dataSource;
				ajax.onreadystatechange = function(){
					if(ajax.readyState === 4 && ajax.status === 200){
						that.createBox(ajax.responseText);
						if(that.afterLoad && typeof that.afterLoad === "function"){
							that.afterLoad.call(that);
						}
						if(that.callbacks && typeof that.callbacks === "object" && that.callbacks instanceof Array){
							for(var i=0; i<that.callbacks.length; i++){
								var id = that.callbacks[i].id;
								var fn = that.callbacks[i].callback;
								if(id){
									var h = $id(id);
									if(h!=null && document.addEventListener ){
										h.addEventListener( "click", fn, false );
									}else if(h!=null && document.attachEvent ){
										h.attachEvent( "onclick", fn );
									}
								}
							}
						}
						var closeElem = that.closeElem;
						if(closeElem!="undefinded" && typeof closeElem == "string"){
							var elems = closeElem.split(",");
							for(var i=0;i<elems.length;i++){
								var c = $id(elems[i]);
								if(c!=null && document.addEventListener ){
									c.addEventListener( "click", function(){
										var box_body = that.boxbody;
										var box_bg = that.boxbg;
										if(box_body!=null && box_body.nodeType){
											if ( box_body.parentNode ) {
												box_body.parentNode.removeChild( box_body );
											}
										}
										if(box_bg!=null && box_bg.nodeType){
											if ( box_bg.parentNode ) {
												 box_bg.parentNode.removeChild( box_bg );
											}
									        document.body.style.overflow = "auto";
										}
									}, false );
								}else if(c!=null && document.attachEvent ){
									c.attachEvent( "onclick", function(){
										var box_body = that.boxbody;
										var box_bg = that.boxbg;
										if(box_body!=null && box_body.nodeType){
											if ( box_body.parentNode ) {
												box_body.parentNode.removeChild( box_body );
											}
										}
										if(box_bg!=null && box_bg.nodeType){
											if ( box_bg.parentNode ) {
												 box_bg.parentNode.removeChild( box_bg );
											}
									        document.body.style.overflow = "auto";
										}
									} );
								}
							}
						}
						var dragElem = that.dragElem;
						if(dragElem && typeof dragElem === "string"){
							var dragElems = dragElem.split(",");
							for(var i=0; i<dragElems.length; i++){
								var d = $id(dragElems[i]);
								that.drag(d);
							}
						}
						ajax.onreadystatechange = function(){};
					};
				};
				
				ajax.open('GET', url, 1);
				ajax.send(null);
			}
		};
	MsgBox.prototype.createBox = function(cnt){
			var o = getScroll();
			var left = o.l;
			var top = o.t;
			this.boxbg.style.width = "100%";
			this.boxbg.style.height = "100%";
			this.boxbg.style.position = "absolute";
			this.boxbg.style.top = top + "px";
			this.boxbg.style.left = left + "px";
			this.boxbg.style.opacity = "0.5";
			this.boxbg.style.filter = "Alpha(opacity=50)";
			this.boxbg.style.backgroundColor = "#000";
			this.boxbg.style.zIndex = "1000";
			document.body.appendChild(this.boxbg);
			document.body.style.overflow = "hidden";
			
			var b_left = o.l + this.boxbg.offsetWidth/3;
			var b_top = o.t + this.boxbg.offsetHeight/3;
			
			this.boxbody.style.position = "absolute";
			this.boxbody.style.zIndex = "1200";
			this.boxbody.innerHTML = cnt;
			this.boxbody.style.top = b_top + "px";
			this.boxbody.style.left = b_left + "px";
			document.body.appendChild(this.boxbody);
			
		}
	MsgBox.prototype.drag = function(obj){
		var that = this;
		var box = that.boxbody;
		obj.onmousedown=function (a){
			this.style.cursor="move";
			var d=document;
			if(!a) a=window.event;
			var x=a.clientX+document.body.scrollLeft-box.offsetLeft;
			var y=a.clientY+document.body.scrollTop-box.offsetTop;
			d.onmousemove=function(a){
				if(!a) a=window.event;
				box.style.left=a.clientX+document.body.scrollLeft-x + "px";
				box.style.top=a.clientY+document.body.scrollTop-y + "px";
			}
			d.onmouseup=function (){
				document.onmousemove=null;
				document.onmouseup = null;
				obj.style.cursor="normal";
			}
		}  
	}
	MsgBox.prototype.closeMsgBox = function(a){
		if(a){
			var that = a;
		}else{
			var that = this;
		}
		var box_body = that.boxbody;
		var box_bg = that.boxbg;
		if(box_body!=null && box_body.nodeType){
			if ( box_body.parentNode ) {
				box_body.parentNode.removeChild( box_body );
			}
		}
		if(box_bg!=null && box_bg.nodeType){
			if ( box_bg.parentNode ) {
				 box_bg.parentNode.removeChild( box_bg );
			}
	        document.body.style.overflow = "auto";
		}
	}