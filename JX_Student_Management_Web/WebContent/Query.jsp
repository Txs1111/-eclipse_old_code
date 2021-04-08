<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	String department = request.getParameter("department");
	out.println(department);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>翻页查询功能</title>
</head>
<body>
	<form action="Query.jsp" method="post">
		<select name="department">
			<option value="luo">海螺</option>
			<option value="ke">贝壳</option>
			<option value="pang">螃蟹</option>
		</select>

	</form>

</body>
</html>