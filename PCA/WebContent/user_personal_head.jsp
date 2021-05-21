
<%
	/*------------------------------------------------------------------------------------------------
	修改人			     
	修改时间 		
	修改内容		
	版本号			 
	-------------------------------------------------------------------------------------------------*/
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="bean.Homepage_bean" import="bean.user_personal_homepage_bean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="Css/Public_style.css" />
<link rel="stylesheet" type="text/css" href="Css/Page_head.css" />
<link rel="stylesheet" type="text/css" href="Css/Public_Color/orange.css" />
</head>
<body>
	<%
		request.setCharacterEncoding("UTF8");
		String ID = request.getParameter("ID");
		Homepage_bean bean = new Homepage_bean(ID);
		bean.head();
		user_personal_homepage_bean beans = new user_personal_homepage_bean(ID);
		int alllike = beans.getalllike();
		String nickiname = bean.nickiname;
		String sign = bean.sign;

		String level = bean.level + "";
		String headphoto = bean.headphoto;
		String background = bean.background;
	%>
	<div class="background" style="width:100%;height:210px;margin-bottom:0px; background: url(img/theme_photo/<%=background%>.png);">
		<!--1430*55-->
		<%
			if (Integer.parseInt(level) >= 7) {
				out.println("<div  class='level'style=' width:54px;height:27px;'>");
			} else {
				out.println("<div class='level'style='width:54px;height:54px;'>");
			}
		%>
		<!--等级信息-->
		<img src="img/level_photo/等级<%=level%>.png" style="height: 100%; width: 100%; margin-left: 25px; margin-top: 30px;">
		<!--<img src="img/level_photo/等级9.png" style="height: 70%; width: 130%;margin-top:10px;">-->
	</div>
	<div class="information" style="margin_bottom: 0px; margin-top: 30px; color: #FFA980;">
		<!--头像信息-->
		<button name="toID" value="<%=ID%>" style="margin-left: 1%; width: 70px; height: 100%; border: 0px solid white; background-color: black; border-radius: 35px; float: left;">
			<img src="img/head_photo/<%=headphoto%>.jpg" class="head_photo" />
			<!--昵称签名信息-->
		</button>
		<br />
		&nbsp;
		<%=nickiname%><br />
		&nbsp;
		<%=sign%>
	</div>
	<font class="middle-font font-normal-color" style="line-height: 30px; float: right; margin-right: 2%;"><%=alllike %></font>
	<img src="img/user_personal_homepage/icons/已点赞.png" style="margin-top: 3px; width: 30px; height: 25px; float: right;">




</body>
</body>
</html>

