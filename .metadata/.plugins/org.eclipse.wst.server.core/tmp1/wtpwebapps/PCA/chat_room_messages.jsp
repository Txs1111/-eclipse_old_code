<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="bean.chat_room_allmessage" import="java.util.StringTokenizer"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="Css/Message.css" />
<link rel="stylesheet" type="text/css" href="Css/Public_style.css" />
<link href="Css/Homepage.css" rel="stylesheet" />
<link href="Css/Public_Color/orange.css" rel="stylesheet" />
<body onload="window.scrollTo(0,document.body.scrollHeight); ">
	<!--横向20 纵向19 -->
	<%
		request.setCharacterEncoding("UTF-8"); //或者指定的编码(GBK或其他)	
		String ID = (String) request.getSession().getAttribute("ID");
		String content = "";
		chat_room_allmessage bean = new chat_room_allmessage();
		content = bean.getdata();
		StringTokenizer chart = new StringTokenizer(content, "鰶");
		String reID = "";
		String head_photo = "";
		String name = "";
		String text = "";
		int num = chart.countTokens();
		num = num / 4;
		for (int a = 0; a < num; a++) {
			reID = chart.nextToken();
			head_photo = chart.nextToken();
			name = chart.nextToken();
			text = chart.nextToken();
			int line = 0;
			int num1 = text.getBytes("gbk").length;
			for (;;) {
				num1 = num1 - 16;
				if (num1 == -16) {
					line = 1;
					break;
				} else if (num1 > -16 && num1 < 0) {
					line = line + 1;
					break;
				} else if (num1 > 0) {
					line = line + 1;
				}
			}
			int chatbox = 22 * line;
			int height = 50;
			if (chatbox > height) {
				height = chatbox;
			}
			height = height + 10;
			if (reID.equals(ID)) {
	%>
	<div style="width:100%;height:<%=height%>px;margin-top:5px;float:right;">
		<div style="width:40px;height:<%=height%>px;float:right;">

			<img style="height: 40px; width: 40px; border-radius: 20px;" src="img/head_photo/<%=head_photo%>.jpg">

			<div style="width: 40px; height: 10px; line-higth: 10px; font-size: 10px;" align="center">
				<font style="color: #FF8448;"><%=name%></font>
			</div>
		</div>
		<div style="width: 60%; height: 15px; float: right;"></div>
		<div style="border-radius:3px;width:60%;float:right; height:<%=chatbox%>px;padding:3px;white-space:normal;word-break:break-all; over-flow:hidden;" class="light-color">
			<%=text%>
		</div>

	</div>
	<%
		} else {
	%>
	<div style="width:100%;height:<%=height%>px;margin-top:10px;float:left;">
		<div style="width:40px;height:<%=height%>px;float:left;">
			<!-- <form action="goto_user_personal_homepage"method="post"> -->

			<img style="height: 40px; width: 40px; border-radius: 20px;" src="img/head_photo/<%=head_photo%>.jpg">

			<!-- </form> -->
			<div style="width: 40px; height: 10px; line-higth: 10px; font-size: 10px;" align="center">
				<font style="color: #FF8448;"><%=name%></font>
			</div>
		</div>
		<div style="width: 60%; height: 15px; float: left;"></div>
		<div style="border-radius:3px;width:60%;float:left; height:<%=chatbox%>px;padding:3px;white-space:normal;word-break:break-all; over-flow:hidden;" class="dinylight-color">
			<%=text%>
		</div>
	</div>

	<%
		}
		}
	%>

	<meta http-equiv="refresh" content="5;url=chat_room_messages.jsp">


</body>
</html>