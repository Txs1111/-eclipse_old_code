<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>日历详情</title>
<%@ page import="bean.*" import="java.util.Random"%>
<%
	String ID = (String) request.getSession().getAttribute("ID");
	if (request.getAttribute("ID") != null) {//toHomepage.java页面传来的request
		ID = (String) request.getAttribute("ID");
	} //获取登录用户的ID
	if (request.getParameter("ID") != null) {//通过form表单传递数据过来
		ID = (String) request.getParameter("ID");
	} //获取登录用户的ID
	if (ID == null || "".equals(ID) || "null".equals(ID)) {
		request.setAttribute("alter", "1");
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
	request.getSession().setAttribute("ID", ID);//设置页面session对象中的ID
	request.setCharacterEncoding("UTF-8"); //或者指定的编码(GBK或其他)	 
	Homepage_bean bean = new Homepage_bean(ID); //加载Homepage页面各模块的数据
	bean.head(); //运行方法 加载头模块数据	
	String role = bean.role;
%>
<link href="Css/Public_Color/orange.css" rel="stylesheet" />
<link href="Css/Public_style.css" rel="stylesheet" />
<link href="Css/Homepage.css" rel="stylesheet" />
</head>
<body bgcolor="#F4F5F7">
	<!-- 季节模块 -->
	<jsp:include page="season.jsp"></jsp:include>
	<!-- 头模块 -->
	<jsp:include page="head.jsp">
		<jsp:param value="<%=ID%>" name="ID" />
		<jsp:param value="<%=role%>" name="role" />
		<jsp:param value="<%=bean.level%>" name="level" />
		<jsp:param value="<%=bean.nickiname%>" name="nickiname" />
		<jsp:param value="<%=bean.sign%>" name="sign" />
		<jsp:param value="<%=bean.background%>" name="background" />
		<jsp:param value="<%=bean.headphoto%>" name="headphoto" />
	</jsp:include>
	<!-- 导航栏模块 -->
	<!-- 把用户ID传递给导航栏，导航栏再传给各个大页面 -->
	<!-- 把用户ID传递给导航栏，导航栏再传给各个大页面 -->
	<jsp:include page="lead.jsp">
		<jsp:param value="<%=ID%>" name="ID" />
	</jsp:include>
	<div class="scorecard_synthesize_tittle light-color">
		<font class="middle-font">已签到次数</font>
	</div>
	<div class="scorecard_synthesize dinylight-color">
		<font class="big-font">8</font>
	</div>
</body>
</html>