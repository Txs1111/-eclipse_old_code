<%@page import="bean.*" import="dao.*"%>
<%
	/*------------------------------------------------------------------------------------------------
	修改人			     
	修改时间 	
	修改内容	
	版本号			 
	-------------------------------------------------------------------------------------------------*/
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="Css/Message.css" />
<link rel="stylesheet" type="text/css" href="Css/Public_Color/orange.css" />
<link rel="stylesheet" type="text/css" href="Css/Public_style.css" />
<link rel="stylesheet" type="text/css" href="Css/Homepage.css" />
</head>

<body bgcolor="#F4F5F7">
	<%
		String ID = request.getParameter("ID");//接收从dynamic.jsp页面form中传过来的ID
		//String ID = (String)request.getSession().getAttribute("ID");
		//System.out.println("$$$$$$$$$$$dynamic_details.jsp：" + ID);
		dynamicDao dynamic = new dynamicDao();
		Message head_message = (Message) request.getSession().getAttribute("head_message");
		Message message = head_message;
		//System.out.println("dynamic_details.jsp：" + message.content);
		String snumber = request.getParameter("detaili");
		//System.out.println(snumber);
		int number = Integer.parseInt(snumber);
		System.out.println(snumber);
		while (number-- > 1) {
			message = message.next;
		}
	%>
	<form action="Homepage.jsp" method="post" name="form_ID">
		<input type="hidden" name="ID" value="<%=ID%>">
	</form>
	<!-- form表单传值 -->
	<jsp:include page="season.jsp"></jsp:include>
	<br>
	<div class="fenge">
		<br>
	</div>
	<div class="details">
		<div class="detail_content">
			<div class="title small-font light-font">&nbsp;>&nbsp;/&nbsp;活动&nbsp;/&nbsp;如何成为一个合格...</div>
			<div class="title small-font light-font" style="float: right;">
				<a href="Homepage.jsp">返回&nbsp;&nbsp;&nbsp;&nbsp;</a>
			</div>
			<div class="separator light-font">
				<span>------------------------------------------------------------------------------------------------------------------------------------------------</span>
			</div>
			<div class="head">
				<div class="head_photo">
					<img class="small_head_photo" src="img/head_photo/<%=message.head_photo%>.jpg" style="border-radius: 25px;">
				</div>
				<div class="title middle-font"><%=message.title%></div>
				<div class="nickname small-font light-font">
					<%=message.nickiname%><span class="time"><%=message.psotdate%></span>
				</div>
			</div>
			<div class="content">
				<pre><%=message.content%></pre>
				<%
					for (int j = 0; j < dynamic.getAllphotourl(message).size(); j++) {
				%>
				<img src="<%=dynamic.getAllphotourl(message).get(j)%>">
				<%
					}
				%>
			</div>
			<div id="function">
				<div id="time" style="width: 150px; height: 60px; margin-top: 10px;">
					<font id="samll" style="font-size: 20px;"><%=message.psotdate%></font>
				</div>
				<div id="like" style="width: 150px; height: 60px;">
					<img src="img/example/点赞.png" id="good" style="width: 45px;">
					<font id="samll" style="font-size: 20px;"><%=message.like%></font>
				</div>
				<div id="like" style="width: 150px; height: 60px;">
					<img src="img/example/收藏.png" id="good" style="width: 45px;">
					<font id="samll" style="font-size: 20px;">22</font>
				</div>

			</div>
		</div>
		<div class="detail_list">
			<div class="title white-font">所有消息</div>
			<div class="list">
				<ul>
					<li class="xz">
						<a href="#"><%=head_message.title%></a>
					</li>
					<%
						while (head_message.next != null) {
							head_message = head_message.next;
					%>
					<li>
						<a href="#"><%=head_message.title%></a>
					</li>
					<%
						}
					%>
				</ul>
			</div>

		</div>

	</div>


</body>

</html>