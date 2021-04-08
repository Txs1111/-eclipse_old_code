
<%
	/*------------------------------------------------------------------------------------------------
	修改人			     
	修改时间 		
	修改内容		
	版本号			 
	-------------------------------------------------------------------------------------------------*/
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="bean.Message_bean" import="dao.chat_room_send"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>消息通知</title>
<link rel="stylesheet" type="text/css" href="Css/Message.css" />
<link rel="stylesheet" type="text/css" href="Css/Public_style.css" />
<link rel="stylesheet" type="text/css" href="Css/Public_color/orange.css" />
</head>
<body bgcolor="#F4F5F7">
	<%
		request.setCharacterEncoding("UTF-8");//或者指定的编码(GBK或其他)
		String ID = (String) request.getAttribute("ID");
		Message_bean bean = new Message_bean(ID);
		bean.head();
		String role = bean.role;
	%>
	<jsp:include page="season.jsp"></jsp:include>
	<jsp:include page="head.jsp">
		<jsp:param value="<%=ID%>" name="ID" />
		<jsp:param value="<%=role%>" name="role" />
		<jsp:param value="<%=bean.level%>" name="level" />
		<jsp:param value="<%=bean.nickiname%>" name="nickiname" />
		<jsp:param value="<%=bean.sign%>" name="sign" />
		<jsp:param value="<%=bean.background%>" name="background" />
		<jsp:param value="<%=bean.headphoto%>" name="headphoto" />
	</jsp:include>
	<jsp:include page="lead.jsp">
		<jsp:param value="<%=ID%>" name="ID" />
	</jsp:include>
	<div class="Massage_whole_block">
		<div class="Massage_leftblock">
			<div>
				<jsp:include page="message_menu.jsp"></jsp:include>
			</div>
			<div id="Message_head" style="margin-top: 45px;" class="small-tittle middle-font font-normal-color">
				&nbsp;┃&nbsp;公共聊天室
				<%
					request.getSession().setAttribute("ID", ID);
				%>
			</div>

			<iframe style="width: 100%; height: 630px; border: 0px solid white;" src="chat_room.jsp"></iframe>
		</div>
		<div class="Massage_rightblock">
			<iframe src="official.jsp" width="100%" height="100%" scrolling="no" frameborder="0"> </iframe>
		</div>
	</div>
</body>
</html>
<script src="js/jquery-3.4.1.js"></script>
<script>
	$(function() {
		$('#ass')
				.click(
						function() {

							$(this).removeClass("message_Office");
							$(this).addClass("message_Office_v dark-color");
							$('.message_Work_v').addClass('message_Work');
							$('.message_Work').removeClass(
									'message_Wok_v dark-color');
							$('.message_tips_v').addClass("message_tips");
							$('.message_tips').removeClass(
									'message_tips_v dark-color');
							$('.Massage_rightblock')
									.html(
											'<iframe src="official.jsp" width="100%" height="100%" scrolling="no" frameborder="0"> </iframe>');
						});

		$('.message_Work')
				.click(
						function() {
							$(this).removeClass("message_Work");
							$(this).addClass("message_Work_v dark-color");
							$('.message_Office_v').addClass("message_Office");
							$('.message_Office').removeClass(
									'message_Office_v dark-color');
							$('.message_tips_v').addClass("message_tips");
							$('.message_tips').removeClass(
									'message_tips_v dark-color');
							$('.Massage_rightblock')
									.html(
											'<iframe src="Work_tips.jsp" width="100%" height="100%" scrolling="no" frameborder="0"> </iframe>');
						});

		$('.message_tips')
				.click(
						function() {
							$(this).removeClass("message_tips");
							$(this).addClass("message_tips_v dark-color");
							$('.message_Office_v').addClass("message_Office");
							$('.message_Office').removeClass(
									'message_Office_v dark-color');
							$('.message_Work_v').addClass('message_Work');
							$('.message_Work').removeClass(
									'message_Wok_v dark-color');
							$('.Massage_rightblock')
									.html(
											'<iframe src="message_tips.jsp" width="100%" height="100%" scrolling="no" frameborder="0"> </iframe>');
						});
	});
</script>

<script>
	$(function() {
		$('#message').css('border-bottom-style', 'solid');
		var $logo = $('#sign_list li');

		$logo.mouseenter(function() {
			$(this).css('border-bottom-style', 'solid');
			$('#message').css('border-bottom-style', 'none');
		});

		$logo.mouseleave(function() {
			$logo.css('border-bottom-style', 'none');
			$('#message').css('border-bottom-style', 'solid');
		});
	});
</script>
