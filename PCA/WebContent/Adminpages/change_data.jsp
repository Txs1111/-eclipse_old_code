<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="bean.change_user_data_bean"%>
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
	<div class="small-tittle middle-font font-normal-color" align="center">&nbsp;-&nbsp;编辑用户信息&nbsp;-&nbsp;</div>

	<%
		//result.add(this.con.result.getString("name"));
		//	result.add(this.con.result.getString("college"));
		//	result.add(this.con.result.getString("major"));
		//	result.add(this.con.result.getString("clas"));
		//	result.add(this.con.result.getString("tel"));
		//	result.add(this.con.result.getString("mail"));
		request.setCharacterEncoding("UTF-8");
		String changeID = (String) request.getSession().getAttribute("changeID");
		change_user_data_bean bean = new change_user_data_bean(changeID);
		ArrayList<String> data = new ArrayList<>();
		data = bean.getdata();
		String tips = "";
		if ("1".equals(request.getParameter("changedata"))) {
			bean.change(request.getParameter("name"), request.getParameter("college"),
					request.getParameter("major"), request.getParameter("clas"), request.getParameter("tel"),
					request.getParameter("mail"));
			tips = "修改成功";
		}
		int num = 0;
	%><form action="change_data.jsp" method="post">
		<div style="width: 100%;" align="center">
			<div style="margin-top: 5px; line-height: 20px; width: 100%; height: 20px; font-size: 15px;" class="dinylight-color">姓名</div>
			<input style="margin-top: 5px; color: gray; width: 90%; text-align: center; height: 20px;" name="name" value="<%=data.get(num)%>">
			<%
				num++;
			%>
			<div style="margin-top: 5px; line-height: 20px; width: 100%; height: 20px; font-size: 15px;" class="dinylight-color">学院</div>
			<input style="margin-top: 5px; color: gray; width: 90%; text-align: center; height: 20px;" name="college" value="<%=data.get(num)%>">
			<%
				num++;
			%>
			<div style="margin-top: 5px; line-height: 20px; width: 100%; height: 20px; font-size: 15px;" class="dinylight-color">专业</div>
			<input style="margin-top: 5px; color: gray; width: 90%; text-align: center; height: 20px;" name="major" value="<%=data.get(num)%>">
			<%
				num++;
			%>
			<div style="margin-top: 5px; line-height: 20px; width: 100%; height: 20px; font-size: 15px;" class="dinylight-color">班级</div>
			<input style="margin-top: 5px; color: gray; width: 90%; text-align: center; height: 20px;" name="clas" value="<%=data.get(num)%>">
			<%
				num++;
			%>
			<div style="margin-top: 5px; line-height: 20px; width: 100%; height: 20px; font-size: 15px;" class="dinylight-color">电话</div>
			<input style="margin-top: 5px; color: gray; width: 90%; text-align: center; height: 20px;" name="tel" value="<%=data.get(num)%>">
			<%
				num++;
			%>
			<div style="margin-top: 5px; line-height: 20px; width: 100%; height: 20px; font-size: 15px;" class="dinylight-color">邮箱</div>
			<input style="margin-top: 5px; color: gray; width: 90%; text-align: center; height: 20px;" name="mail" value="<%=data.get(num)%>">
			<%
				num++;
			%>
			<div style="margin-top: 5px; height: 20px; font-size: 15px; line-height: 20px;color:white;" class="light-color"><%=tips%></div>
			<button name="changedata" value="1" style="margin-top: 5px; border: 0px solid white; color: white; background-color: #84BFD9; width: 55%; height: 35px; border-radius: 5px;">修改</button>
		</div>
	</form>
</body>
</html>