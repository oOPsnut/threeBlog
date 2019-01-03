<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="toTop" content="true">
<title>文章</title>
<link rel="stylesheet" href="css/homepage.css" type="text/css"/>
<link rel="stylesheet" href="css/personalcenter.css" type="text/css"/>
<link rel="stylesheet" href="css/calendar.css">

<link rel="stylesheet" href="css/comment.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
<link href="css/owl.carousel.css" rel="stylesheet">
<script src="js/jquery-1.min.js"></script>
<script src="js/owl.carousel.js"></script>
<!--头部show的js-->
<script>
$(function(){
    $('#owl-demo').owlCarousel({
        items: 1,
        autoPlay: true
    });
});
</script>
<!--消息栏显示-->
<script>

$(function() {
    $('li').hover(function() {
            $(this).find('ul').css({
                'display': 'block',
                'animation:': '2s'
            })
        },
        function() {
            $(this).find('ul').css({
                'display': 'none',
                'animation:': '2s'
            })
        });
});
</script>

</head>

<body>
<!--顶端栏begin-->
<div id="index_head">
  <div id="index_head_logo"> <img src="image/logo.png"> </div>
  <div id="index_head_menu">
    <ul>
      <li><a href="#" >首页</a></li>
      <li><a href="#" >博文</a></li>
      <li><a href="#" >画廊</a></li>
      <li><a href="#" >我的</a></li>
    </ul>
  </div>
  <div id="index_head_tools"> 
  <ul>
  	<li>
    	<a href="#">
        	<img  src="image/search.png" style="float:left;" />
       	</a> 
    </li>
    <li id="messagepic">
    	<a href="#">
        	<div style="float:left; position:relative;">
    			<img src="image/message.png"/>
                	<span  id="tools_messagenumber">0</span>
             </div>
         </a> 
         <ul class="index_tools_messages">
         	<li><a href="#home">评论消息</a><span   class="index_tools_messagesnumber"style="top:20px;" >0</span></li>
          	<li><a href="#home">关注消息</a><span  class="index_tools_messagesnumber" style="top:80px; ">0</span></li>
            <li><a href="#home">收藏消息</a><span  class="index_tools_messagesnumber" style="top:140px;" >0</span></li>
            <li><a href="#home">点赞消息</a><span  class="index_tools_messagesnumber" style=" top:200px;" >0</span></li>
         </ul>
    </li>
    <li>
    	<a href="#">
        	<img src="image/setting.png"/>
        </a>
        <ul class="index_tools_setting">
            
            <li><a href="#home">&ensp;个人中心&ensp;</a></li>
            <li><a href="#home">&ensp;账号设置&ensp;</a></li>
            <li><a href="#home">&ensp;举报中心&ensp;</a></li>
            <li><a href="#home">&ensp;退出账号&ensp;</a></li>
         </ul>
    </li>
     </ul>
     </div>
  <span style="color:#FFF; font-size:36px;float:left; margin-top:15px;"> |</span>
  <div id="index_head_signin">
    <ul>
      <li><a href="register.html">注册</a></li>
      <li><a href="signin.html">登录</a></li>
    </ul>
  </div>
</div>
</div>
<!--顶端栏end-->
<!--内容begin-->
<div id="article_all">
	<div id="article_all_content">
    	<!--文章up-->
        <div class="article_a_up">
        	<h2>闹心的孩子千篇一律，智慧的父母万里挑一</h2>
            <div id="a_up_info">
            <a href="#">
              <img src="image/head1.png"/>
              <span>oopx</span>
           	</a>
                        <span>2018-10-02 18:41</span>
                        <span>分类 : </span><span><strong>默认分类</strong></span>
                        <span>标签 : </span><a href="#" id="article_a_up_a">&lt;父母&gt;</a><a href="#" id="article_a_up_a">&lt;孩子&gt;</a>
                        <span>阅读 : </span><span>12</span>
            </div>
        </div>
        <!--文章middle-->
        <div class="article_a_middle">
        	<p>文/苏菲马文
            <br>
            我小时候在农村长大，村里的娱乐活动不多，大人们盘腿坐在炕上打麻将，我就坐小板凳上写作业，成绩基本稳定在全校前十。全村都夸我爹妈运气好，白捡了个好孩子。后来我家有了二胎，妹妹学习不太好，大家担心她考本科都悬，我妈仍然一意孤行地执行“放养”策略。结果我妹一路逆袭，现在模拟考试的名次已经在考入985/211水平。
            <br>
            每次我妈向别人夸耀，说自己特别会带孩子，我内心就吐槽，你会啥啊，就会打麻将吧。后来慢慢读了一些养育孩子的书，发现我妈“农村妇女”身份的背后，其实是一个教育孩子的高手。
            <br>
            有时候，村里的人会说，我们家的孩子打啊、骂啊都没有用，他就是学不好。
            <br>
            我妈说，好孩子不是打骂出来的。让孩子做什么事，要给孩子讲原因，还要和孩子商量着办。
            <br>
            别人问，为什么你带的孩子不挑食，不用人喂饭？
            <br>
            我妈答，吃饭是她自己的事。告诉孩子，想吃什么就和我说，我做给她吃。不好好吃饭？过了饭点也没有零食吃，知道饿了，下一顿就好好吃饭了。
            <br>
            别人问，为什么你的孩子学习不用你管？
            <br>
            我妈答，学习也是她自己的事。告诉孩子，每天先把作业写了，再看电视，看完睡觉。不按时写作业，磨蹭到半夜？到点了关灯睡觉，第二天交不上作业，她就知道以后得自觉抓紧时间写了。
            <br>
            虽然我妈的育儿经看起来简单粗暴，但是她能做到耐心地和小孩子解释每一件要做的事，让孩子懂的道理，主动去做，做错能改，这并不容易做到。
            <br>
            很多家长，特别羡慕别人家孩子，想让孩子学习好、懂事。孩子表现的不好，家长马上就生起气来。孩子怎么写作业这么磨蹭？他怎么一直打游戏？他怎么跟算盘珠子似的，拨一下才动一下？这么想着，不好听地话就直接说出来了，“你能不能快点？”“我说的话你就是记不住是吗！”家长越是这样，孩子对家长的反应越是冷淡、迟钝。
            <br>
            如何改变现状？
            <br>
            《忍住！别插手！让孩子独立的自我管理课：合理安排时间》这本书正是专门为家长们亲身打造的，跟着这本书学习，家长将改变自己教养孩子的心态，改变与孩子的相处模式，帮助孩子成为独立地、更够自主管理时间的人。</p>
        </div>
        <!--文章down-->
        <div class="article_a_down" >
        	<div id="a_down_lead">
            	<a href="#" style="float:left;">◁上一篇  所有的你</a>
       		 	<a href="#" style="float:right">▷下一篇  没有了</a><br>
            </div>
            <div id="a_down_tools">
            	<div id="tools_like">
            		<img  id="like" src="image/unlike.png"  title="喜欢">
                    <span>喜欢</span>
                    <span>xxx</span>
                    <!--喜欢图标更换的js-->
                    <script>
                    $('#like').click(function(){  
                              
                            if($('#like').attr('src')=='image/unlike.png'){  
                                $('#like').attr('src','image/like.png');  
                            }else{ 
                                $('#like').attr('src','image/unlike.png');  
                            }  
                    
                              
                    });  
                    </script>  
                </div>
                <div id="tools_favor">
        			<img  id="favor" src="image/unfavor.png" title="收藏"/>
                    <span>收藏</span>
                    <span>xxx</span>
                    
        			<!--收藏图标更换的js-->
                    <script>
                    $('#favor').click(function(){  
                              
                            if($('#favor').attr('src')=='image/unfavor.png'){  
                                $('#favor').attr('src','image/favor.png');  
                            }else{ 
                                $('#favor').attr('src','image/unfavor.png');  
                            }  
                    
                              
                    });  
                    </script>
        		</div>
                <div id="tools_share">	
                		<img src="image/share.png" id="share" onClick="copyLink();" title="分享">
        				<span>分享</span>
                        <!--分享js-->
                        <script>
                        function copyLink(){
							 var clipBoardContent="";
							 clipBoardContent+=document.title;
							 clipBoardContent+="";
							 clipBoardContent+=this.location.href;
							 window.clipboardData.setData("Text",clipBoardContent);
							 alert("复制成功，请粘贴到你的QQ/MSN上推荐给你的好友");
}
							
                        </script>
        		</div>
                <div id="tools_report">
        				<a href="reportcenter_article.html">	                    	<img src="image/report.png" id="report" title="举报">
        				<span>举报</span>
        			</a>
        		</div>
            </div>
        </div>
        <!--评论/回复区域-->
        <div class="article_a_discuss">
        	<div class="commentAll">
					<!--评论区域 begin-->
					<div class="reviewArea clearfix">
						<div class="flex-text-wrap">
							<pre class="pre">
								<span></span><br>
							</pre>
							<textarea class="content comment-input" placeholder="留下你的评论..."
								onkeyup="keyUP(this)"></textarea>
						</div>
						<a href="javascript:;" class="plBtn">评论</a>
					</div>
					<!--评论区域 end-->
					<!--回复区域 begin-->
					<div class="comment-show">

						<%
							ArrayList<Comment> comments = service.getCommentsFromArticle_id(article_id);
							SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//定义格式，不显示毫秒
							int i;
							if(!comments.isEmpty()){
								for (i = 0; i < comments.size(); i++) {
									Comment comment = comments.get(i);
									User comment_author = service.getUserFromId(comment.getAuthor_id());
						%>
						<!--1-->
						<div class="comment-show-con clearfix">
							<!--这是头像div-->
							<div class="comment-show-con-img pull-left">
							<a href="${pageContext.request.contextPath}/jsp/other_center/otherscenter.jsp?id=<%=comment.getAuthor_id()%>">
								<img src="<%=comment_author.getTouxiang()%>" alt="">
							</a>
							</div>
                            <!--这是内容div-->
							<div class="comment-show-con-list pull-left clearfix">
								<div class="pl-text clearfix">
									<!--用户名-->
									<a href="${pageContext.request.contextPath}/jsp/other_center/otherscenter.jsp?id=<%=comment.getAuthor_id()%>" class="comment-size-name"
										data="<%=comment.getId()%>"><%=comment_author.getUsername()%> : </a>
									<!--评论内容 -->
									<%if(!comment.getStatus().equals("屏蔽")){ %>	
									<span class="my-pl-con"><%=comment.getText()%></span>
									<%}else{ %>
									<span class="my-pl-con">该评论涉嫌违规内容，已被屏蔽！！</span>
									<%} %>
								</div>
								<div class="date-dz">
									<span class="date-dz-left pull-left comment-time"><%=df.format(comment.getAdd_time())%></span>
									<div class="date-dz-right pull-right comment-pl-block">
										
										<a href="javascript:;" class="removeBlock">举报</a>
										<%if(comment_author.getId()==user_id){ %>
										<a href="javascript:;" class="delete">删除</a>
										<%} %>
										<a href="javascript:;" class="date-dz-pl pl-hf pull-left">回复</a>
										<span class="pull-left date-dz-line">|</span>
										<!--赞-->
										<a href="javascript:;" class="date-dz-z pull-left"><i
											class="date-dz-z-click-red"></i>赞 (<i class="z-num"><%=comment.getZan() %></i>)</a>
									</div>
									
								</div>
                                
								<div class="hf-list-con">

						<!-- 评论回复内容区域begin -->

									<%
										ArrayList<Answer> answers=service.getAnswersFromArticle_idComment_id(comment.getId());
										for(int j=0;j<answers.size();j++){
											Answer answer=answers.get(j);
											User answer_author=service.getUserFromId(answer.getAuthor_id());
									%>

									<div class="all-pl-con">
										<div class="pl-text hfpl-text clearfix">
											<a href="${pageContext.request.contextPath}/jsp/other_center/otherscenter.jsp?id=<%=answer.getAuthor_id()%>" class="comment-size-name" data="<%=answer.getId()%>"><%=answer_author.getUsername() %> : </a> 
											
											<%if(!answer.getStatus().equals("屏蔽")){ %>
											<span class="my-pl-con"> &nbsp;<%=answer.getText() %></span>
											<%}else{ %>
											<span class="my-pl-con"> &nbsp;该回复涉嫌违规内容，已被屏蔽！！</span>
											<%} %>
										</div>
										<div class="date-dz">
											<span class="date-dz-left pull-left comment-time"><%=df.format(answer.getAdd_time() )%></span>
											<div class="date-dz-right pull-right comment-pl-block">
												
												<a href="javascript:;" class="removeBlock">举报</a>
												<%if(answer_author.getId()==user_id){ %>
												<a href="javascript:;" class="delete">删除</a>
												<%} %>
												<a href="javascript:;"
													class="date-dz-pl pl-hf hf-con-block pull-left">回复</a> <span
													class="pull-left date-dz-line">|</span> <a
													href="javascript:;" class="date-dz-z pull-left"> <i
													class="date-dz-z-click-red"></i>赞 (<i class="z-num"><%=answer.getZan() %></i>)
												</a>
											</div>
						
                                    </div>
                                    <!-- 评论回复内容区域end -->	
									</div>
									<%} %>


									

								</div>
							</div>
						</div>
						<%
							}
							}
						%>






					</div>
				</div>



			</div>
			<!--回复区域 end-->
			
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/js/jquery.flexText.js"></script>
		<!--textarea高度自适应-->
		<script type="text/javascript">
					$(function() {
						$('.content').flexText();
					});
				</script>
		<!--textarea限制字数-->
		<script type="text/javascript">
					function keyUP(t) {
						var len = $(t).val().length;
						if (len > 139) {
							$(t).val($(t).val().substring(0, 140));
						}
					}
				</script>
		<!--点击评论创建评论条-->
		<%if(login_flag){ %>
		<script type="text/javascript">
					$('.commentAll')
							.on(
									'click',
									'.plBtn',
									function() {
										//获取输入内容
										var oHtml;
										var oSize = $(this).siblings(
												'.flex-text-wrap').find(
												'.comment-input').val();
										console.log(oSize);
										//动态创建评论模块
										
										if (oSize.replace(/(^\s*)|(\s*$)/g, "") != '') {
											
											
											var url = "${pageContext.request.contextPath}/servlet/AddComment";
											var args = {
													
											
												"article_id" : "<%=article_id%>",	//文章id
												"author_id":"<%=user.getId()%>",    //从页面获得的用户id
												"receiver_id":"<%=author_id%>",		//从文章id获得的作者id
												"text1":"<%=article.getTitle()%>",  //文章标题
												"text2":oSize,                      //评论内容
												"time" : new Date()
											};
											$.ajaxSettings.async = false;  
											$.get(url, args,
													function(data) {
													var result=eval("("+data+")");
														var comment_id=result.comment_id;
														console.log(comment_id);
														var add_time=result.add_time;
														console.log(add_time);
												     	oHtml = '<div class="comment-show-con clearfix"><div class="comment-show-con-img pull-left" ><a href="${pageContext.request.contextPath}/jsp/other_center/otherscenter.jsp?id=<%=user_id%>"><img src="<%=user.getTouxiang()%>"</a>  alt=""></div> <div class="comment-show-con-list pull-left clearfix"><div class="pl-text clearfix"> <a href="${pageContext.request.contextPath}/jsp/other_center/otherscenter.jsp?id=<%=user_id%>" class="comment-size-name" data="'
															+comment_id+
														'"><%=user.getUsername()%> : </a> <span class="my-pl-con">&nbsp;'
															+ oSize
															+ '</span> </div> <div class="date-dz"> <span class="date-dz-left pull-left comment-time">'
															+ add_time
															+ '</span> <div class="date-dz-right pull-right comment-pl-block"><a href="javascript:;" class="removeBlock">举报</a><a href="javascript:;" class="delete">删除</a> <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a> <span class="pull-left date-dz-line">|</span> <a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">0</i>)</a> </div> </div><div class="hf-list-con"></div></div> </div>';
														
												     
											}); 
											$.ajaxSettings.async = true;  
											
											$(this).parents('.reviewArea ')
											.siblings('.comment-show')
											.prepend(oHtml);
											$(this).siblings('.flex-text-wrap')
											.find('.comment-input')
											.prop('value', '')
											.siblings('pre').find(
													'span').text('');
											
											
											
											
											
										}
									});
				</script>
				<%}else{ %>
				<script type="text/javascript">
					$('.commentAll')
							.on(
									'click',
									'.plBtn',
									function() {
										window.location.href='${pageContext.request.contextPath}/jsp/login/sign_in.jsp';
									});
				</script>
				<%} %>


		<!--点击回复动态创建回复块-->
		<script type="text/javascript">
		 $('.comment-show').on('click','.pl-hf',function(){
		        //获取回复人的名字
		        var fhName = $(this).parents('.date-dz-right').parents('.date-dz').siblings('.pl-text').find('.comment-size-name').html();
		        //回复@
		        var fhN = '回复@'+fhName;
		        //var oInput = $(this).parents('.date-dz-right').parents('.date-dz').siblings('.hf-con');
		        var fhHtml = '<div class="hf-con pull-left"> <textarea class="content comment-input hf-input" placeholder="" onkeyup="keyUP(this)"></textarea> <a href="javascript:;" class="hf-pl">评论</a></div>';
		        //显示回复
		        if($(this).is('.hf-con-block')){
		            $(this).parents('.date-dz-right').parents('.date-dz').append(fhHtml);
		            $(this).removeClass('hf-con-block');
		            $('.content').flexText();
		            $(this).parents('.date-dz-right').siblings('.hf-con').find('.pre').css('padding','6px 15px');
		            //console.log($(this).parents('.date-dz-right').siblings('.hf-con').find('.pre'))
		            //input框自动聚焦
		            $(this).parents('.date-dz-right').siblings('.hf-con').find('.hf-input').val('').focus().val(fhN);
		        }else {
		            $(this).addClass('hf-con-block');
		            $(this).parents('.date-dz-right').siblings('.hf-con').remove();
		        }
		    });
				</script>
		<!--评论回复块创建-->
		<%if(login_flag){ %>
		<script type="text/javascript">
					$('.comment-show')
							.on(
									'click',
									'.hf-pl',
									function() {
										var oThis = $(this);
										//获取输入内容
										var oHfVal = $(this).siblings(
												'.flex-text-wrap').find(
												'.hf-input').val();
										console.log("oHfVal");
										console.log(oHfVal)
										var oHfName = $(this)
												.parents('.hf-con').parents(
														'.date-dz').siblings(
														'.pl-text').find(
														'.comment-size-name')
												.html();
										
										var alltext=$(this)
										.parents('.hf-con').parents(
										'.date-dz').siblings(
										'.pl-text').html();
										console.log("alltext:");
										console.log(alltext);
										var flag;
										var comment_id;
										var answer_id=$(this)
										.parents('.hf-con').parents(
										'.date-dz').siblings(
										'.pl-text').find(
										'.comment-size-name').attr("data");
										if(alltext.indexOf("@")==-1){
											flag=1;//代表comment_id和answer_id是相重叠的
											comment_id = $(this)
											.parents('.hf-con').parents(
													'.date-dz').siblings(
													'.pl-text').find(
													'.comment-size-name').attr("data");
											console.log("comment_id:");
											console.log(comment_id);
											
										}else{
										flag=0;//代表comment_id和answer_id是不相重叠的
										comment_id = $(this)
										.parents('.hf-con').parents(
												'.date-dz').parents('.all-pl-con').parents('.hf-list-con').
												siblings(
												'.pl-text').find(
												'.comment-size-name').attr("data");
										console.log("comment_id:");
										console.log(comment_id);
								
										
										}
										var username="<%=user.getUsername()%>"+" : ";
										
										
										if(oHfName==username){
											alert("想对自己说什么话，憋在心里就好了");
											oThis
											.parents(
													'.hf-con')
											.siblings(
													'.date-dz-right')
											.find(
													'.pl-hf')
											.addClass(
													'hf-con-block')
											&& oThis
													.parents(
															'.hf-con')
													.remove();
													return false;
										}
										
										var oAllVal = '回复@' + oHfName;
										if (oHfVal.replace(/^ +| +$/g, '') == ''
												|| oHfVal == oAllVal) {

										} else {
											$
													.getJSON(
															"${pageContext.request.contextPath}/json/pl.json",
															function(data) {
																var oAt = '';
																var oHf = '';
																$
																		.each(
																				data,
																				function(
																						n,
																						v) {
																					delete v.hfContent;
																					delete v.atName;
																					var arr;
																					var ohfNameArr;
																					if (oHfVal
																							.indexOf("@") == -1) {
																						data['atName'] = '';
																						data['hfContent'] = oHfVal;
																					} else {
																						arr = oHfVal
																								.split(':');
																						ohfNameArr = arr[0]
																								.split('@');
																						data['hfContent'] = arr[1];
																						data['atName'] = ohfNameArr[1];
																					}

																					if (data.atName == '') {
																						oAt = data.hfContent;
																					} else {
																						oAt = '回复<a href="javascript:;" class="atName">@'
																								+ data.atName
																								+ '</a> : '
																								+ data.hfContent;
																					}
																					oHf = data.hfName;
																				});

																var oHtml ;
																var url = "${pageContext.request.contextPath}/servlet/AddAnswer";
																var args = {
																	"author_id":"<%=user.getId()%>",
																	"comment_id":comment_id,
																	"flag":flag,
																	"last_answer_id":answer_id,
																	"article_id":"<%=article.getId()%>",
																	"text2":oAt,
																	"time" : new Date()
																};
																console.log("1");
																console.log(oAt);
																$.ajaxSettings.async = false;  
																$.get(url, args,
																		function(data) {
																		var result=eval("("+data+")");
																			var answer_id=result.answer_id;
																			console.log("answer_id");
																			console.log(answer_id);
																			var add_time=result.add_time;
																			console.log(add_time);
																			oHtml= '<div class="all-pl-con"><div class="pl-text hfpl-text clearfix"><a href="${pageContext.request.contextPath}/jsp/other_center/otherscenter.jsp?id=<%=user_id%>" class="comment-size-name" data="'
																				+answer_id+
																				'"><%=user.getUsername()%> : </a><span class="my-pl-con">'
																				+ oAt
																				+ '</span></div><div class="date-dz"> <span class="date-dz-left pull-left comment-time">'
																				+ add_time
																				+ '</span> <div class="date-dz-right pull-right comment-pl-block"> <a href="javascript:;" class="removeBlock">举报</a><a href="javascript:;" class="delete">删除</a><a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a> <span class="pull-left date-dz-line">|</span> <a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">0</i>)</a> </div> </div></div>';
																			
																	     
																}); 
																$.ajaxSettings.async = true;  
																
																
																
																		
																		
																		
																		
																		
																		
																		oThis
																		.parents(
																				'.hf-con')
																		.parents(
																				'.comment-show-con-list')
																		.find(
																				'.hf-list-con')
																		.css(
																				'display',
																				'block')
																		.prepend(
																				oHtml)
																		&& oThis
																				.parents(
																						'.hf-con')
																				.siblings(
																						'.date-dz-right')
																				.find(
																						'.pl-hf')
																				.addClass(
																						'hf-con-block')
																		&& oThis
																				.parents(
																						'.hf-con')
																				.remove();
																
																		
															});
										}
									});
				</script>
				<%}else{ %>
				<script type="text/javascript">
					$('.comment-show')
							.on(
									'click',
									'.hf-pl',
									function() {
										window.location.href='${pageContext.request.contextPath}/jsp/login/sign_in.jsp';
									});
				</script>
				<%} %>
		<!--举报评论块  -->
		<%if(login_flag){ %>
		<script type="text/javascript">
					 $('.commentAll').on('click','.removeBlock',function(){
						 	var alltext=$(this)
							.parents('.date-dz-right').parents(
							'.date-dz').siblings(
							'.pl-text').html();
						 	var article_id="<%=article_id%>";
							var comment_id = $(this)
							.parents('.date-dz-right').parents(
							'.date-dz').siblings(
							'.pl-text').find(
							'.comment-size-name').attr("data");
							if(alltext.indexOf("@")==-1){	
								<!--举报的是评论 -->
								window.location.href='${pageContext.request.contextPath}/jsp/report_center/reportcenter_comment.jsp?article_id='+article_id+"&comment_id="+comment_id;
	
							}else{
								<!--举报的是回复 -->
								window.location.href='${pageContext.request.contextPath}/jsp/report_center/reportcenter_answer.jsp?article_id='+article_id+"&answer_id="+comment_id;
							
							}

					}) 
				</script>
				<%}else{ %>
				<script type="text/javascript">
					 $('.commentAll').on('click','.removeBlock',function(){
						 	var alltext=$(this)
							.parents('.date-dz-right').parents(
							'.date-dz').siblings(
							'.pl-text').html();
						 	var article_id="<%=article_id%>";
							var comment_id = $(this)
							.parents('.date-dz-right').parents(
							'.date-dz').siblings(
							'.pl-text').find(
							'.comment-size-name').attr("data");
							if(alltext.indexOf("@")==-1){	
								<!--举报的是评论 -->
								window.location.href='${pageContext.request.contextPath}/jsp/login/sign_in.jsp';
	
							}else{
								<!--举报的是回复 -->
								window.location.href='${pageContext.request.contextPath}/jsp/login/sign_in.jsp';
							
							}

					}) 
				</script>
				<%} %>
		<!--删除评论块-->
		<script type="text/javascript">
		    $('.commentAll').on('click','.delete',function(){
		        
		    	 var oT = $(this).parents('.date-dz-right').parents('.date-dz').parents('.all-pl-con');
		    	 var flag=2;
		        var alltext=$(this)
				.parents('.date-dz-right').parents(
				'.date-dz').siblings(
				'.pl-text').html();
		        var comment_id = $(this)
				.parents('.date-dz-right').parents(
				'.date-dz').siblings(
				'.pl-text').find(
				'.comment-size-name').attr("data");
		        
		        if(alltext.indexOf("@")==-1){	
					<!--删除的是评论 -->
					var url = "${pageContext.request.contextPath}/servlet/DeleteComment";
					 var args={
				        		"comment_id" : comment_id,
								"time" : new Date()
				        }
					 
						 $.ajaxSettings.async = false; 
				        $.get(url, args,
								function(data) {
						        	var result=eval("("+data+")");
						        	if(result.bol==1){       
						        		flag=1;
						        	}else if(result.bol==2){
						        		alert("删除失败！由于收到用户举报，该评论暂时被锁定！");
						        	}
						        	
						}); 
				        $.ajaxSettings.async = true; 
			
				}else{
					<!--删除的是回复 -->
					var url = "${pageContext.request.contextPath}/servlet/DeleteAnswer";
					var args={
			        		"answer_id" : comment_id,
							"time" : new Date()
			        }
					
					$.ajaxSettings.async = false; 
			        $.get(url, args,
							function(data) {
					        	var result=eval("("+data+")");
					        	if(result.bol==1){
					        		 flag=1;
					        	}else if(result.bol==2){
					        		alert("删除失败！由于收到用户举报，该回复暂时被锁定！");
					        	}
					        	
					}); 
			        $.ajaxSettings.async = true; 
			
				}
		        if(flag==1){
		        	if(oT.siblings('.all-pl-con').length >= 1){
		                oT.remove();
		            }else {
		                $(this).parents('.date-dz-right').parents('.date-dz').parents('.all-pl-con').parents('.hf-list-con').css('display','none')
		                oT.remove();
		            }
		            $(this).parents('.date-dz-right').parents('.date-dz').parents('.comment-show-con-list').parents('.comment-show-con').remove();
		        }
		        
		        
		    })
		</script>		
				
		<!--点赞-->
		<script type="text/javascript">
					$('.comment-show').on(
							'click',
							'.date-dz-z',
							function() {
								var zNum = $(this).find('.z-num').html();
								var status;
								if ($(this).is('.date-dz-z-click')) {
									zNum--;
									status="取消点赞";
									$(this).removeClass('date-dz-z-click red');
									$(this).find('.z-num').html(zNum);
									$(this).find('.date-dz-z-click-red')
											.removeClass('red');
								} else {
									zNum++;
									status="点赞";
									$(this).addClass('date-dz-z-click');
									$(this).find('.z-num').html(zNum);
									$(this).find('.date-dz-z-click-red')
											.addClass('red');
								}
					
								var alltext=$(this)
								.parents('.date-dz-right').parents(
								'.date-dz').siblings(
								'.pl-text').html();
								var comment_id = $(this)
								.parents('.date-dz-right').parents(
								'.date-dz').siblings(
								'.pl-text').find(
								'.comment-size-name').attr("data");
								var sender_id="<%=user_id%>";
								var article_id="<%=article_id%>"
								if(alltext.indexOf("@")==-1){		
									<!--点赞的是评论表 -->
									var url = "${pageContext.request.contextPath}/servlet/AddZanToComment";
									var args = {
										"comment_id":comment_id,
										"sender_id":sender_id,
										"article_id":article_id,
										"status":status,
										"zan":zNum,
										"time" : new Date()
									};
									$.ajaxSettings.async = false;  
									$.get(url, args); 
									$.ajaxSettings.async = true;  					
								}else{
								
									var url = "${pageContext.request.contextPath}/servlet/AddZanToAnswer";
									var args = {
										"comment_id":comment_id,
										"sender_id":sender_id,
										"article_id":article_id,
										"status":status,
										"zan":zNum,
										"time" : new Date()
									};
									$.ajaxSettings.async = false;  
									$.get(url, args); 
									$.ajaxSettings.async = true;  
								
								}
					
								
								
							})
				</script>
        </div>
    </div>	
</div>
<!--内容end-->
<!--置顶框begin-->
	<script type="text/javascript" src="js/toTop.js"></script>
<!--置顶框end-->
<!--底部begin-->
<footer>
	<img src="image/footer_logo.png">
    <div id="footer_about">
    <p>&emsp;关于我们 | 意见反馈 | 服务条例 | 隐私政策</p>
    <p>Copyright © 2018 | Three Blog | All Right Reserved</p>
    </div>
</footer>
<!--底部end-->
</body>
</html>
