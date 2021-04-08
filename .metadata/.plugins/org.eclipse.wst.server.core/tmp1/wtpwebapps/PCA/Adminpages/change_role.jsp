<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="bean.get_power_menu"%>
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
	<div class="small-tittle middle-font font-normal-color" align="center">&nbsp;-&nbsp;修改角色&nbsp;-&nbsp;</div>
	<form action="change_role.jsp" method="post">
		<%
			String tips = "";
			String changerole = "";
			changerole = (String) request.getSession().getAttribute("changerole");
			get_power_menu getmenu = new get_power_menu((String) request.getSession().getAttribute("ID"));
			ArrayList<String> menu = getmenu.power_menu();
			ArrayList<String> rolepower = getmenu.readrole(changerole);
			String color = "";
			String check = "";
			String add = request.getParameter("changerole");
			if ("1".equals(add)) {
				String function[] = new String[menu.size()];
				for (int a = 0; a < menu.size(); a++) {
					function[a] = request.getParameter("power" + (a + 1) + "");
				}
				getmenu.changerole(changerole, function);
				tips = "修改成功";
			}
			for (int a = 1; a < menu.size() + 1; a++) {
				check = "";
				if (a % 2 == 0) {
					color = "dinylight-color";
				} else {
					color = "white-color";
				}

				if (rolepower.indexOf("" + a + "") != -1) {
					check = "checked ='checked'";
					
				}
		%>
		<div style="width: 100%; height: 25px; font-size: 15px; color: gray; line-height: 25px;" class="<%=color%>">
			<input type="checkbox" <%=check%> name="power<%=a%>" value="<%=a%>">
			&nbsp;<%=menu.get(a - 1)%>
		</div>
		<%
			}
		%>
		<div style="width: 100%; color: white; height: 25px; float: left; line-height: 25px;" align="center" class="light-color"><%=tips%></div>
		<div style="width: 100%; height: 65px; float: left;" align="center">

			<button name="changerole" value="1" style="color: white; background-color: #84BFD9; margin-left: 0.1%; width: 55%; height: 40px; border-radius: 5px; border: 0px solid white; margin: 0 auto;">修改</button>
		</div>
	</form>


</body>
</html>