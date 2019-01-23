
//<!--导航栏切换-->
	//默认是所有博文
    function myChangePage(){  	
		$("#introduce_right_Frame").load("/ThreeBlog_V1.0//jsp/personalcenter/personalcenter_myHome.jsp?article_type=all");
    }
	//我的收藏
	function myCollect(){
		$("#introduce_right_Frame").load("/ThreeBlog_V1.0//jsp/personalcenter/personalcenter_myCollect.jsp");		
	}

	//我的全部博文
	function myHome(){
		$("#introduce_right_Frame").load("/ThreeBlog_V1.0//jsp/personalcenter/personalcenter_myHome.jsp?article_type=all");		
	}

	//我的关注
	function myFollowing() {
		$("#introduce_right_Frame").load("/ThreeBlog_V1.0//jsp/personalcenter/personalcenter_fans.jsp");		
	}

	//我的粉丝
	function myFollower() {
		$("#introduce_right_Frame").load("/ThreeBlog_V1.0//jsp/personalcenter/personalcenter_follow.jsp");		
	}
	
	//我的博文类别
	function myPub(obj){
		var M=$("#hid0").val();
		var G=$("#hid1").val();
		var Z=$("#hid2").val();
		var X=$("#hid3").val();
		var Y=$("#hid4").val();
		var L=$("#hid5").val();
		var S=$("#hid6").val();
		var Q=$("#hid7").val();
		var K=$("#hid8").val();
		var T=$("#hid9").val();
		if(obj==1){
			if(M>0){
				$("#introduce_right_Frame").load("/ThreeBlog_V1.0//jsp/personalcenter/personalcenter_myHome.jsp?article_type=m&flag=1");		    		
	    	}else{
	    		$("#introduce_right_Frame").load("/ThreeBlog_V1.0//jsp/personalcenter/personalcenter_myHome.jsp?article_type=m&flag=0");
	    	}			
		}else if(obj==2){
			if(G>0){
				$("#introduce_right_Frame").load("/ThreeBlog_V1.0//jsp/personalcenter/personalcenter_myHome.jsp?article_type=g&flag=1");	
			}else{
				$("#introduce_right_Frame").load("/ThreeBlog_V1.0//jsp/personalcenter/personalcenter_myHome.jsp?article_type=g&flag=0");	
	    	}
		}else if(obj==3){
			if(Z>0){
				$("#introduce_right_Frame").load("/ThreeBlog_V1.0//jsp/personalcenter/personalcenter_myHome.jsp?article_type=z&flag=1");	
			}else{
				$("#introduce_right_Frame").load("/ThreeBlog_V1.0//jsp/personalcenter/personalcenter_myHome.jsp?article_type=z&flag=0");		
	    	}
		}else if(obj==4){
			if(X>0){
				$("#introduce_right_Frame").load("/ThreeBlog_V1.0//jsp/personalcenter/personalcenter_myHome.jsp?article_type=x&flag=1");	
			}else{
				$("#introduce_right_Frame").load("/ThreeBlog_V1.0//jsp/personalcenter/personalcenter_myHome.jsp?article_type=x&flag=0");		
	    	}	
		}else if(obj==5){
			if(Y>0){
				$("#introduce_right_Frame").load("/ThreeBlog_V1.0//jsp/personalcenter/personalcenter_myHome.jsp?article_type=y&flag=1");	
			}else{
				$("#introduce_right_Frame").load("/ThreeBlog_V1.0//jsp/personalcenter/personalcenter_myHome.jsp?article_type=y&flag=0");		
	    	}
		}else if(obj==6){
			if(L>0){
				$("#introduce_right_Frame").load("/ThreeBlog_V1.0//jsp/personalcenter/personalcenter_myHome.jsp?article_type=l&flag=1");	
			}else{
				$("#introduce_right_Frame").load("/ThreeBlog_V1.0//jsp/personalcenter/personalcenter_myHome.jsp?article_type=l&flag=0");		
	    	}	
		}else if(obj==7){
			if(S>0){
				$("#introduce_right_Frame").load("/ThreeBlog_V1.0//jsp/personalcenter/personalcenter_myHome.jsp?article_type=s&flag=1");	
			}else{
				$("#introduce_right_Frame").load("/ThreeBlog_V1.0//jsp/personalcenter/personalcenter_myHome.jsp?article_type=s&flag=0");		
	    	}	
		}else if(obj==8){
			if(Q>0){
				$("#introduce_right_Frame").load("/ThreeBlog_V1.0//jsp/personalcenter/personalcenter_myHome.jsp?article_type=q&flag=1");	
			}else{
				$("#introduce_right_Frame").load("/ThreeBlog_V1.0//jsp/personalcenter/personalcenter_myHome.jsp?article_type=q&flag=0");		
	    	}
		}else if(obj==9){
			if(K>0){
				$("#introduce_right_Frame").load("/ThreeBlog_V1.0//jsp/personalcenter/personalcenter_myHome.jsp?article_type=k&flag=1");	
			}else{
				$("#introduce_right_Frame").load("/ThreeBlog_V1.0//jsp/personalcenter/personalcenter_myHome.jsp?article_type=k&flag=0");		
	    	}
		}else if(obj==0){
			if(T>0){
				$("#introduce_right_Frame").load("/ThreeBlog_V1.0//jsp/personalcenter/personalcenter_myHome.jsp?article_type=t&flag=1");	
			}else{
				$("#introduce_right_Frame").load("/ThreeBlog_V1.0//jsp/personalcenter/personalcenter_myHome.jsp?article_type=t&flag=0");		
	    	}	
		}
				
	}
	//我的博文时间排序
	function myPubT(obj){
		if(obj==2019){
			$("#introduce_right_Frame").load("/ThreeBlog_V1.0//jsp/personalcenter/personalcenter_myHome.jsp?time=2019");	
		}else if(obj==2018){
			$("#introduce_right_Frame").load("/ThreeBlog_V1.0//jsp/personalcenter/personalcenter_myHome.jsp?time=2018");	
		}else if(obj==0){
			$("#introduce_right_Frame").load("/ThreeBlog_V1.0//jsp/personalcenter/personalcenter_myHome.jsp?time=0");	
		}
				
	}
