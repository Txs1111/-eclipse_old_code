<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="bean.get_power_menu"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="../Css/Public_style.css" />
<link rel="stylesheet" type="text/css" href="../Css/Assignment.css" />
<link rel="stylesheet" type="text/css" href="../Css/Public_Color/orange.css" />
<body>
	<div class="small-tittle middle-font font-normal-color" align="center">&nbsp;-&nbsp;该角色权限&nbsp;-&nbsp;</div>
	<form action="change_user_role_detail.jsp" method="post">
		<%
			String tips = "";
			String changerole = "";
			changerole = (String) request.getSession().getAttribute("changerole");
			String changeID=(String) request.getSession().getAttribute("changeID");
			get_power_menu getmenu = new get_power_menu((String) request.getSession().getAttribute("ID"));
			ArrayList<String> menu = getmenu.power_menu();
			ArrayList<String> rolepower = getmenu.readrole(changerole);
			String color = "";
			String check = "";
			String font_color="";
			
			String add = request.getParameter("changerole");
			if ("1".equals(add)) {
				getmenu.changeuserrole(changeID, changerole);

				tips = "修改成功";
			}
			for (int a = 1; a < menu.size() + 1; a++) {
				check = "";
				font_color="color='#dbdbdb'";
				
				if (a % 2 == 0) {
					color = "dinylight-color";
				} else {
					color = "white-color";
				}

				if (rolepower.indexOf("" + a + "") != -1) {
					check = "checked ='checked'";
					font_color="color='black'";
					
				}
		%>
		<div style="width: 100%; height: 25px; font-size: 15px; color: gray; line-height: 25px;" class="<%=color%>">
		
			<font <%=font_color %>>
				&nbsp;<%=menu.get(a - 1)%>
			</font>
		</div>
		<%
			}
		%>
		<div style="width: 100%; color: white; height: 25px; float: left; line-height: 25px;" align="center" class="light-color"><%=tips%></div>
		<div style="width: 100%; height: 65px; float: left;" align="center">

			<button name="changerole" value="1" style="color: white; background-color: #84BFD9; margin-left: 0.1%; width: 55%; height: 40px; border-radius: 5px; border: 0px solid white; margin: 0 auto;">设定角色</button>
		</div>
	</form>
</body>
</html>