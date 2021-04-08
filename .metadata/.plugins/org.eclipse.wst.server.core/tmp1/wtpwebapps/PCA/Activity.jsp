<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="bean.activity_bean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="#F4F5F7">
	<%
		request.setCharacterEncoding("UTF-8");
		String ID = (String) request.getSession().getAttribute("ID");
		if (request.getAttribute("ID") != null) {//toHomepage.java页面传来的request
			ID = (String) request.getAttribute("ID");
		} //获取登录用户的ID
		if (request.getParameter("ID") != null) {//通过form表单传递数据过来
			ID = (String) request.getParameter("ID");
		} //获取登录用户的ID
		request.getSession().setAttribute("ID", ID);//设置页面session对象中的ID
		if (ID == null || "".equals(ID) || "null".equals(ID)) {
			request.setAttribute("alter", "1");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		activity_bean bean = new activity_bean(ID);
		bean.head();
	%>
	<!-- 季节模块 -->
	<jsp:include page="season.jsp"></jsp:include>

	<!-- 头模块 -->
	<jsp:include page="head.jsp">
		<jsp:param value="<%=ID%>" name="ID" />
		<jsp:param value="<%=bean.role%>" name="role" />
		<jsp:param value="<%=bean.level%>" name="level" />
		<jsp:param value="<%=bean.nickiname%>" name="nickiname" />
		<jsp:param value="<%=bean.sign%>" name="sign" />
		<jsp:param value="<%=bean.background%>" name="background" />
		<jsp:param value="<%=bean.headphoto%>" name="headphoto" />
	</jsp:include>
	<!-- 导航栏模块 -->
	<!-- 把用户ID传递给导航栏，导航栏再传给各个大页面 -->
	<jsp:include page="lead.jsp">
		<jsp:param value="<%=ID%>" name="ID" />
	</jsp:include>
</body>
</html>
<script src="js/jquery-3.4.1.js"></script>
<script src="js/loading.js"></script>
<script type="text/javascript" charset="UTF-8">
	$(function() {/* 导航栏的动态效果 */
		$('#activity').css('border-bottom-style', 'solid');
		var $logo = $('#sign_list li');

		$logo.mouseenter(function() {
			$(this).css('border-bottom-style', 'solid');
			$('#activity').css('border-bottom-style', 'none');
		});

		$logo.mouseleave(function() {
			$logo.css('border-bottom-style', 'none');
			$('#activity').css('border-bottom-style', 'solid');
		});
	});
</script>
