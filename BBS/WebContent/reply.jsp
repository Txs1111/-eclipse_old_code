<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	int rootid = Integer.parseInt(request.getParameter("rootid"));
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>回帖页面</title>
</head>
<body>
	<form action="replyOK.jsp" method="post">
		<input type="hidden" name="id" value=<%=id %>> 
		<input type="hidden" name="rootid" value=<%=rootid %>>
		<table border ="1">
			<tr>
				<td>
					<input type="text" size="100" name="title">
				</td>
			</tr>
			<tr>
				<td>
					<textarea rows="20" cols="100" name="cont"></textarea>
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="提交">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>