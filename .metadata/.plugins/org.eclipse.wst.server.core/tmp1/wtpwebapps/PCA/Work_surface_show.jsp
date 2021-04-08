<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link href="Css/Public_Color/orange.css" rel="stylesheet" />
<link href="Css/Public_style.css" rel="stylesheet" />
<body style="overflow: hidden;"> 
<%
String file_name = "once";
String file_url =  "/once/homepage.html";
String ID = null;
String type = "1_2";
if (request.getAttribute("file_name") != null || request.getAttribute("file_name") != "") {
	file_name = request.getParameter("file_name");
}
if (request.getAttribute("file_url") != null || request.getAttribute("file_url") != "") {
	file_url = request.getParameter("file_url");
}
if (request.getAttribute("ID") != null || request.getAttribute("ID") != "") {
	ID = request.getParameter("ID");
}
if (request.getAttribute("type") != null || request.getAttribute("type") != "") {
	type = request.getParameter("type");
}

//-----------
%>
<div class="big-tittle middle-font font-normal-color">
				&nbsp;┃&nbsp;<%=file_name%>
				<img src="img/lead_photo/返回.png"style="width:30px;height:25px;float:right;margin-top: 8px;">
			<div style="float:right;">	
				<form action="Work.jsp" method="post" name="" id="form_s">
					<input type="text" name="type" value="<%=type %>" style="display:none"/>
					<input type="text" name="ID" value="<%=ID%>" style="display:none"/>
					<a class="middle-font font-light-color" style="float:right;"onclick="document:form_s.submit();" >返回上一级</a>	
				</form>
			</div>
</div>
<iframe src="user_work_surface/<%=file_url%>" width="100%"  height="884px"  frameborder="0"></iframe>
</body>
</html>