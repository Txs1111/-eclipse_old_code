<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="dao.chat_room_send" import="bean.getpower"%>

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
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String tips = "说点啥吧~";
		String content = request.getParameter("content");
		if (content == null) {
			content = "";
		}
		String ID = (String) request.getSession().getAttribute("ID");
		if ("1".equals(request.getParameter("send"))) {
			if (content.length() > 255) {
				tips = "太长了！最多发送一百个字";
			} else if (content.length() == 0 || content == null || "".equals(content)) {
				tips = "不能发送空消息";
			} else {
				chat_room_send dao = new chat_room_send(ID);
				dao.send(content);
				if (content.length() < 20) {
					tips = "再来俩句？";
				} else if (content.length() >= 20 && content.length() < 40) {
					tips = "继续唠嗑吧~";
				} else {
					tips = "意犹未尽，多说俩句~";
				}
				content = "";
			}

		}
		getpower power = new getpower(ID);
	%>


	<div style="width: 98%; height: 600px; margin: 0 auto;">
		<iframe style="width: 100%; height: 500px; border: 1px solid gray;" src="chat_room_messages.jsp"></iframe>
		<div style="width: 100%; height: 98px;" align="center">
			<%
				if (power.checkpower("25")) {
			%>
			<form action="chat_room.jsp" method="post">
				<%
					}
				%>
				<input style="display: none;" value="<%=ID%>" name="sendID">
				<div style="width: 100%; height: 20px; font-size: 15px; text-align: center; line-height: 20px;" class="dinylight-color"><%=tips%></div>
				<textarea style="width: 100%; height: 50px; font-size: 15px;" name="content"><%=content%></textarea>
				<button class="light-color" style="width: 75%; height: 30px; line-height: 30px; margin-top: 3px; font-size: 25px; color: white; border: 0px solid white; border-radius: 3px;" value="1" name="send">发送</button>
			</form>
		</div>

	</div>








</body>
</html>