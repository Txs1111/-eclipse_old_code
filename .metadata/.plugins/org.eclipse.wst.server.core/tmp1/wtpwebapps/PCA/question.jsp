<%/*------------------------------------------------------------------------------------------------
修改人			     
修改时间 		
修改内容		
版本号			 
-------------------------------------------------------------------------------------------------*/%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="bean.question_bean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<link rel="stylesheet" type="text/css" href="./Css/question.css" />
<link rel="stylesheet" type="text/css" href="./Css/Public_style.css" />
<link rel="stylesheet" type="text/css"
	href="./Css/Public_Color/orange.css" />
</head>
<body  bgcolor="#F4F5F7"><%
	request.setCharacterEncoding("UTF-8") ;//或者指定的编码(GBK或其他)
String ID=(String)request.getAttribute("ID"); 
question_bean bean=new question_bean(ID);
bean.head();
String role=bean.role;
%>
	<jsp:include page="season.jsp"></jsp:include>
		<jsp:include page="head.jsp"><jsp:param value="<%=bean.level %>" name="level"/>
		<jsp:param value="<%=role %>" name="role"/>
		<jsp:param value="<%=bean.nickiname %>" name="nickiname"/>
		<jsp:param value="<%=bean.sign %>" name="sign"/>
		<jsp:param value="<%=bean.background %>" name="background"/>
		<jsp:param value="<%=bean.headphoto %>" name="headphoto"/></jsp:include>
		
		<jsp:include page="lead.jsp"><jsp:param value="<%=ID %>" name="ID"/></jsp:include>
	<div class="top_background">
		<div class="ask_box_left light-color"></div>
	<div class="ask_box">
		<div class="ask_box_txtline middle-font font-normal-color">#有什么想分享给大家的吗&nbsp;?</div>
		<div class="ask_box_symline middle-font font-normal-color" id="ask_sym">提问▼</div>
		<div class="ask_box_symline middle-font font-normal-color" id="answer_sym">收起▲</div>
	</div>
	<div class="ask_background">
	
	<!-- 页面头部 -->
		<div class="chose_type">
			<button class="type_type middle-font light-color cilck_style">关于学习</button>
			<button class="type_type middle-font dinylight-color uncilck_style">关于协会</button>
			<button class="type_type middle-font dinylight-color uncilck_style">关于网站</button>
		</div>
		<textarea class="textarea middle-font"></textarea>
	</div>
	<div id="sub">
		<button type="submit" class="submit_button middle-font light-color">提交反馈</button>
	</div>
	<div class="asktype_head">
		<div class="asktype_allquestion light-color cilck_style" id="all_question">看看大家的问题</div>
		<div class="asktype_myquestion font-normal-color" id="my_question">查看我提出的问题</div>
		<!-- 搜索 -->
			<div class="asktype_search">
				<div class="search_area">
					<div class="search ">
						<div class="search-block">
							<div class="search-symble" style="margin-left: 4%;"><img src="img/lead_photo/搜索.png" style="width: 90%; height:90%;"/></div>
								<div class="search-form">
									<form>
										<input type="text" style="width: 73.5%;height: 25px;"/>
									<input type="submit" class="check_button normal-color" value="搜索" />
							       </form>
							</div>
						</div>
				</div>
				</div>	
				</div>
				
		<div class="type_choose_area">
				<div class="type_choose_line small-font underline_show" id="about_study">关于学习</div>
				<div class="type_choose_row font-normal-color">|</div>
				<div class="type_choose_line small-font underline_hide" id="about_pca">关于协会</div>
				<div class="type_choose_row font-normal-color">|</div>
				<div class="type_choose_line small-font underline_hide" id="about_website">关于网站</div>
				<div class="type_choose_row font-normal-color">|</div>
				<div class="type_choose_line small-font underline_hide" id="about_all">查看全部</div>
		</div>
			
	</div>
	</div>
	<div class="all_question">
		<jsp:include page="all_question.jsp"></jsp:include>
	</div>
</body>
</html>
<script>
$(function(){
	$('#question').css('border-bottom-style','solid');
	var $logo = $('#sign_list li');
	 
	 
	 $logo.mouseenter(function(){
    	 $(this).css('border-bottom-style','solid');
    	 $('#question').css('border-bottom-style','none');
 		});
	 
	 $logo.mouseleave(function(){ 
		  $logo.css('border-bottom-style','none');
		  $('#question').css('border-bottom-style','solid');
		 });
	});
$(function() {
	
	//提问区域隐藏
	$('.ask_background').hide();
	$('#sub').hide();
	$('#answer_sym').hide();

	$("#ask_sym").click(function() {
		$('.ask_background').show();
		$('#sub').show();
		$('#ask_sym').hide();
		$('#answer_sym').show();
	});

	$("#answer_sym").click(function() {
		$('.ask_background').hide();
		$('#sub').hide();
		$('#answer_sym').hide();
		$('#ask_sym').show();
	});
	
	
	//选择特效与跳转
	$('#my_question')
	.click(
			function() {
				$(this).removeClass("font-normal-color");
				$(this).addClass("light-color cilck_style");
				$('#all_question').removeClass("light-color cilck_style");
				$('#all_question').addClass("font-normal-color");
			});
	$('#all_question')
	.click(
			function() {
				$(this).removeClass("font-normal-color");
				$(this).addClass("light-color cilck_style");
				$('#my_question').removeClass("light-color cilck_style");
				$('#my_question').addClass("font-normal-color");
			});
	
	
	//分支特效

	$('#about_study').click(
		function() {
			$(this).removeClass("underline_hide");
			$(this).addClass("underline_show");	
			if ($('#about_pca').hasClass('underline_show')) {
				$('#about_pca').removeClass('underline_show');
				$('#about_pca').addClass('underline_hide');
			}
			if ($('#about_all').hasClass('underline_show')) {
				$('#about_all').removeClass('underline_show');
				$('#about_all').addClass('underline_hide');
			}
			if ($('#about_website').hasClass('underline_show')) {
				$('#about_website').removeClass('underline_show');
				$('#about_website').addClass('underline_hide');
			}
		
		});
			
	$('#about_pca').click(
		function() {
			$(this).removeClass("underline_hide");
			$(this).addClass("underline_show");	
			if ($('#about_study').hasClass('underline_show')) {
				$('#about_study').removeClass('underline_show');
				$('#about_study').addClass('underline_hide');
			}
			if ($('#about_all').hasClass('underline_show')) {
				$('#about_all').removeClass('underline_show');
				$('#about_all').addClass('underline_hide');
			}
			if ($('#about_website').hasClass('underline_show')) {
				$('#about_website').removeClass('underline_show');
				$('#about_website').addClass('underline_hide');
			}
		});	
	
	$('#about_website').click(
		function() {
			$(this).removeClass("underline_hide");
			$(this).addClass("underline_show");	
			if ($('#about_study').hasClass('underline_show')) {
				$('#about_study').removeClass('underline_show');
				$('#about_study').addClass('underline_hide');
			}
			if ($('#about_all').hasClass('underline_show')) {
				$('#about_all').removeClass('underline_show');
				$('#about_all').addClass('underline_hide');
			}
			if ($('#about_pca').hasClass('underline_show')) {
				$('#about_pca').removeClass('underline_show');
				$('#about_pca').addClass('underline_hide');
			}
		
	});
	
	$('#about_all').click(
			function() {
				$(this).removeClass("underline_hide");
				$(this).addClass("underline_show");	
				if ($('#about_study').hasClass('underline_show')) {
					$('#about_study').removeClass('underline_show');
					$('#about_study').addClass('underline_hide');
				}
				if ($('#about_website').hasClass('underline_show')) {
					$('#about_website').removeClass('underline_show');
					$('#about_website').addClass('underline_hide');
				}
				if ($('#about_pca').hasClass('underline_show')) {
					$('#about_pca').removeClass('underline_show');
					$('#about_pca').addClass('underline_hide');
				}
			
	});
});
</script>