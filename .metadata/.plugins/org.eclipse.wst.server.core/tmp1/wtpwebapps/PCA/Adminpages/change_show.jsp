<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="bean.member_menage"%>
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
	<div class="small-tittle middle-font font-normal-color" align="center">&nbsp;-&nbsp;角色管理&nbsp;-&nbsp;</div>
	<%
		String ID = request.getParameter("ID");
		member_menage bean = new member_menage(ID);
		String role[] = bean.getroles();
		String showpage = "";
		String showpower = request.getParameter("showpower");

		if (showpower == null || "0".equals(showpower)) {
			showpage = "creat_role.jsp";
		} else {

			request.getSession().setAttribute("changerole", showpower);
			showpage = "change_role.jsp";
		}
	%>
	<div style="float: left; width: 40%; height: 590px; overflow-y: auto;">
		<div class="small-tittle middle-font font-normal-color" align="center">&nbsp;-&nbsp;角色列表&nbsp;-&nbsp;</div>
		<form action="change_show.jsp" method="post">
			<div style="float: left; margin-top: 2px; width: 100%; height: 25px;">
				<button name="addnewrole" value="0" style="width: 100%; height: 100%; border: 0px solid white; background-color: #84BFD9;">添加角色</button>
			</div>
			<%
				String color = "";
				for (int a = 0; a < role.length; a++) {

					if (a % 2 == 0) {
						color = "dinylight-color";
					} else {
						color = "white-color";
					}
					if (showpower != null) {
						if ((a + 1) == Integer.parseInt(showpower)) {
							color = "light-color";
						}
					}
			%>
			<div style="float: left; margin-top: 2px; width: 100%; height: 25px;">
				<button name="showpower" value="<%=a + 1%>" style="width: 100%; height: 100%; border: 0px solid white;" class="<%=color%>"><%=role[a]%></button>
			</div>
			<%
				}
			%>
		</form>
	</div>
	<div style="float: left; width: 0.1%; height: 590px; background-color: black;"></div>
	<div style="float: left; width: 59.9%; height: 590px;">
		<iframe src="<%=showpage%>" style="height: 100%; width: 100%; border: 0px solid white;"> </iframe>
	</div>

</body>
</html>