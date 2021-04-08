
<%
	/*------------------------------------------------------------------------------------------------
	修改人			     
	修改时间 		
	修改内容		
	版本号			 
	-------------------------------------------------------------------------------------------------*/
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="bean.getpower
	"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="Css/Public_style.css" />
<link rel="stylesheet" type="text/css" href="Css/Page_head.css" />
<link rel="stylesheet" type="text/css"
	href="Css/Public_Color/orange.css" />
</head>
<body>
	<div class="head_whole_block">
		<%
			request.setCharacterEncoding("UTF8");
			String role = request.getParameter("role");
			String nickiname = request.getParameter("nickiname");
			String sign = request.getParameter("sign");
			String ID = request.getParameter("ID");
			String level = request.getParameter("level");
			String headphoto = request.getParameter("headphoto");
			String background = request.getParameter("background");
		%>
		<div class="background"
			style="background: url(img/theme_photo/<%=background%>.png);">
			<div
				style="cursor: pointer; width: 20px; height: 20px; margin: 10px; float: right;"
				id="e">
				<img title="返回登录界面" src="img/lead_photo/退出.png" width="100%"
					height="100%" />
			</div>
			<%getpower power=new getpower(ID);
				
				if (power.checkpower("2")) {
			%>
			<form action="Adminpages/date_details.jsp" method="post">
				<input value="<%=ID%>" style="display: none;" name="ID">
				<button
					style="cursor: pointer; width: 20px; height: 20px; margin: 10px; float: right; background: rgba(255, 255, 255, 0); border: 0px solid white;"
					id="e">
					<img title="管理员界面" src="Adminpages/img/管理员.png" width="100%"
						height="100%" />
				</button>
			</form>

			<%
				}
				
			%>
			<form action="feedback.jsp" method="post">
				<input value="<%=ID%>" style="display: none;" name="ID">
				<div
					style="cursor: pointer; width: 20px; height: 20px; margin: 10px; float: right;"
					id="feedback">
					<img title="反馈" src="Adminpages/img/反馈.png" width="100%"
						height="100%" />
				</div>
			</form>
			
			<!--1430*55-->
			<%
				if (Integer.parseInt(level) >= 7) {
					out.println("<div  class='level'style=' width:54px;height:27px;'>");
				} else {
					out.println("<div class='level'style='width:54px;height:54px;'>");
				}
			%>
			<!--等级信息-->
			<img src="img/level_photo/等级<%=level%>.png"
				style="height: 100%; width: 100%;">
			<!--<img src="img/level_photo/等级9.png" style="height: 70%; width: 130%;margin-top:10px;">-->
		</div>
		<% 
		if(power.checkpower("4")){
		%>
		<form action="goto_user_personal_homepage" method="post">
		<%
		}
		%>
			<div class="information">
				<!--头像信息-->
				<button name="toID" value="<%=ID%>"
					style="margin-left: 1%; width: 70px; height: 100%; border: 0px solid white; background-color: black; border-radius: 35px; float: left;">
					<img src="img/head_photo/<%=headphoto%>.jpg" class="head_photo" />
					<!--昵称签名信息-->
				</button>
				<br />&nbsp;
				<%=nickiname%><br />&nbsp;
				<%=sign%>
			</div>
		</form>
	</div>
	</div>
</body>
</body>
</html>
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script type="text/javascript" charset="UTF-8">
	$("#e").click(function() {
		window.location.href = "index.jsp";
	});
	$("#feedback").click(function() {
		window.location.href = "feedback.jsp";
	});
</script>
