
<%
	/*------------------------------------------------------------------------------------------------
	修改人:王旭升		     
	修改时间 :2020-12-30 9:29	
	修改内容:添加注释		
	版本号			 
	-------------------------------------------------------------------------------------------------*/
%>
<%@page import="bean.Set_bean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>设置</title>
<link rel="stylesheet" type="text/css" href="Css/Public_style.css" />
</head>
<body bgcolor="#F4F5F7">
	<%
		String ID = null;
		request.setCharacterEncoding("UTF-8");//或者指定的编码(GBK或其他)
		if (request.getAttribute("ID") != null) {
			ID = (String) request.getAttribute("ID");
		}
		Set_bean bean = new Set_bean(ID);
		bean.head();
		String role = bean.role;
	%>
	<jsp:include page="season.jsp"></jsp:include>
	<jsp:include page="head.jsp"><jsp:param value="<%=bean.level%>" name="level" />
		<jsp:param value="<%=ID%>" name="ID" />
		<jsp:param value="<%=role%>" name="role" />
		<jsp:param value="<%=bean.nickiname%>" name="nickiname" />
		<jsp:param value="<%=bean.sign%>" name="sign" />
		<jsp:param value="<%=bean.background%>" name="background" />
		<jsp:param value="<%=bean.headphoto%>" name="headphoto" /></jsp:include>
	<jsp:include page="lead.jsp"><jsp:param value="<%=ID%>" name="ID" /></jsp:include>
	<div id="set">
		<!-- 左边菜单 -->
		<div id="Set_left">
			<jsp:include page="set_menu.jsp" flush="true" />
		</div>
		<!-- 右边内容 -->
		<div id="Set_right">
			<iframe src="Personal_set.jsp" width="100%" height="100%" scrolling="yes" frameborder="0"> </iframe>
		</div>
	</div>
</body>
</html>
<script src="js/jquery-3.4.1.js"></script>
<script>
	$(function() {
		$('#fss')
				.click(
						function() {

							$(this).removeClass("Office");
							$(this).addClass("Office_v dark-color");
							$('.Work_v').addClass('Wrok');
							$('.Work').removeClass('Wrok_v dark-color');
							$('.attention_v').addClass('attention');
							$('.attention').removeClass(
									'attention_v dark-color');

							$('#Set_right')
									.html(
											'<iframe src="Personal_set.jsp" width="100%" height="100%" scrolling="yes" frameborder="0"> </iframe>');
						});
		$('.Work')
				.click(
						function() {

							$(this).removeClass("Wrok");
							$(this).addClass("Wrok_v dark-color");
							$('.Office_v').addClass("Office");
							$('.Office').removeClass('Office_v dark-color');
							$('.attention_v').addClass('attention');
							$('.attention').removeClass(
									'attention_v dark-color');
							//$('.attention').removeClass('dark-color');

							$('#Set_right')
									.html(
											'<iframe src="Message_set.jsp" width="100%" height="100%" scrolling="no" frameborder="0"> </iframe>');
						});
		$('.attention')
				.click(
						function() {

							$(this).removeClass('attention');
							$(this).addClass('attention_v dark-color');
							$('.Work_v').addClass('Work');
							$('.Work').removeClass('Work_v dark-color');
							$('.Office_v').addClass("Office");
							$('.Office').removeClass('Office_v dark-color');

							$('#Set_right')
									.html(
											'<iframe src="Security_set.jsp" width="100%" height="100%" scrolling="no" frameborder="0"> </iframe>');
						});
	});
</script>
<script>
	$(function() {
		$('#lead_set').css('border-bottom-style', 'solid');
		var $logo = $('#sign_list li');

		$logo.mouseenter(function() {
			$(this).css('border-bottom-style', 'solid');
			$('#lead_set').css('border-bottom-style', 'none');
		});

		$logo.mouseleave(function() {
			$logo.css('border-bottom-style', 'none');
			$('#lead_set').css('border-bottom-style', 'solid');
		});
	});
</script>