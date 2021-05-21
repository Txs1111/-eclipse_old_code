<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="bean.Score_bean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="Css/Public_Color/orange.css" />
<link rel="stylesheet" type="text/css" href="Css/score.css" />
<link rel="stylesheet" type="text/css" href="Css/Public_style.css" />
</head>
<body bgcolor="#F4F5F7">
	<%
		request.setCharacterEncoding("UTF-8");//或者指定的编码(GBK或其他)
		String ID = null;
		String resource_type = "1";
		//String resource = request.getParameter("resource");
		if (request.getAttribute("ID") != null) {
			ID = (String) request.getAttribute("ID");
		}
		if (request.getParameter("ID") != null) {
			ID = request.getParameter("ID");
		}
		if (request.getParameter("resource") != null) {
			resource_type = request.getParameter("resource");
		}
		System.out.println("---------***************************-------------------"+resource_type+"---------***************************-------------------");
		String topage = "1";//将要跳转的页面
		Score_bean bean = new Score_bean(ID);
		if (request.getAttribute("topage") != null && request.getAttribute("topage") != "") {
			topage = (String) request.getAttribute("topage");

		}
		System.out.println("=======================================================\nresource页面ID:" + ID);

		String point = bean.equally_points();
		bean.getmission(topage);
		String role = bean.role;
		bean.con.close();
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


	<div class="page_background">
		<div class="background_left">
			<div class="scorecard_background">
			    <jsp:include page="resource_menu.jsp">
				<jsp:param value="<%=ID%>" name="ID" />
				<jsp:param value="<%=resource_type%>" name="resource" />
				</jsp:include>
			</div>
		</div>
		<div class="background_right">
			<jsp:include page="resource_baidu.jsp" >
			<jsp:param value="<%=ID%>" name="ID" />
			<jsp:param value="<%=resource_type%>" name="resource" />
			</jsp:include>
		</div>
	</div>
</body>
</html>
<script src="js/jquery-3.4.1.js"></script>
<script>
	$(function() {
		$('#resuorce').css('border-bottom-style', 'solid');
		var $logo = $('#sign_list li');

		$logo.mouseenter(function() {
			$(this).css('border-bottom-style', 'solid');
			$('#resuorce').css('border-bottom-style', 'none');
		});

		$logo.mouseleave(function() {
			$logo.css('border-bottom-style', 'none');
			$('#resuorce').css('border-bottom-style', 'solid');
		});
        
	});
</script>
