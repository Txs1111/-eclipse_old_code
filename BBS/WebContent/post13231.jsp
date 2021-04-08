<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	int rootid = Integer.parseInt(request.getParameter("rootid"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>帖子</title>
</head>
<body>
	<form action="post2.jsp" method="post">
		<input type="hidden" name="rootid" value=<%=rootid + 1%>>
		<table border="1">
			<tr>
				<td><input type="text" size="100" name="title"></td>
			</tr>
			<tr>
				<td><textarea rows="20" cols="100" name="cont"></textarea></td>
			</tr>
			<tr>
				<td><input type="submit" value="提交"></td>
			</tr>
		</table>
	</form>
</body>
</html>