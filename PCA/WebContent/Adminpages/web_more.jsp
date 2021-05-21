<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="dao.add_web_inf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../Css/Public_style.css" />
<link rel="stylesheet" type="text/css" href="../Css/Assignment.css" />
<link rel="stylesheet" type="text/css" href="../Css/Public_Color/orange.css" />
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String ID = (String) request.getSession().getAttribute("ID");
		String sub = request.getParameter("sub");
		String tips = "";
		String tips1 = "";
		add_web_inf add = new add_web_inf(ID);
		if ("1".equals(sub)) {
			if (request.getParameter("head") == null || "".equals(request.getParameter("head"))
					|| "null".equals(request.getParameter("head"))) {
				tips = "输入内容不能为空";
			} else {
				add.add_head(request.getParameter("head"));
				tips = "添加成功";
			}
		} else if ("2".equals(sub)) {
			if (request.getParameter("pet") == null || "".equals(request.getParameter("pet"))
					|| "null".equals(request.getParameter("pet"))) {
				tips1 = "输入内容不能为空";
			} else {
				add.add_pet(request.getParameter("pet"));
				tips1 = "添加成功";
			}
		}
	%>
	<jsp:include page="Admin_lead.jsp"><jsp:param value="9" name="block_id" /></jsp:include>
	<div style="width: 87.5%; margin-left: 0.1%; height: 824px; float: left;" class="dinylight-color">
		<form action="web_more.jsp" method="post">
			<div style="width: 49.9%; height: 500px; float: left;">
				<div class="small-tittle middle-font font-normal-color">&nbsp;┃&nbsp;头标语</div>
				<div class="light-color" style="width: 100%; height: 20px; font-size: 15px; line-height: 20px; font-align: center; color: red;"><%=tips%></div>
				<input style="margin-left: 1%; width: 98%; height: 35px; font-size: 20px;" type="text" name="head">
				<button name="sub" value="1" class="light-color" style="margin-left: 27.5%; margin-top: 5px; border: 0px solid white; border-radius: 5px; width: 45%; height: 35px; color: white;">添加</button>
			</div>
		</form>
		<form action="web_more.jsp" method="post">
			<div style="width: 49.9%; margin-left: 0.2%; height: 500px; float: left;">
				<div class="small-tittle middle-font font-normal-color">&nbsp;┃&nbsp;宠物标语</div>
				<div class="light-color" style="width: 100%; height: 20px; font-size: 15px; line-height: 20px; font-align: center; color: red;"><%=tips1%></div>
				<input style="margin-left: 1%; width: 98%; height: 35px; font-size: 20px;" type="text" name="pet">
				<button name="sub" value="2" class="light-color" style="margin-left: 27.5%; margin-top: 5px; border: 0px solid white; border-radius: 5px; width: 45%; height: 35px; color: white;">添加</button>

			</div>
		</form>




	</div>
</body>
</html>