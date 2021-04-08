<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<%
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	int type = -1;
	int path = -1;
	if (request.getParameter("type") != null)
		type = Integer.parseInt(request.getParameter("type"));
	if (request.getParameter("path") != null)
		path = Integer.parseInt(request.getParameter("path"));
	System.out.println("type:" + type);
	System.out.println("path:" + path);
	System.out.println("title:" + title);
	System.out.println("content:" + content);
	if (title != null && !title.equals(null) && title != "" && content != null && !content.equals(null)
			&& content != "") {
		out.print("alert('成功');");
		//request.getRequestDispatcher("source_team.jsp").forward(request, response);
	} else {
		out.print("alert('失败');");
	}
%>
<body>
	<form action="source_team.jsp" method="get">
		<input name="title" type="text" class="form-control" id="inputEmail3" />
		<textarea name="content" required rows="15"></textarea>
		<select class="form-control" name="type"
			style="display: flex; justify-content: center;">
			<option value="1">type</option>
			<option value="2">type2</option>
			<option value="3">type3</option>
		</select> <select class="form-control" name="path"
			style="display: flex; justify-content: center;">
			<option value="21">path</option>
			<option value="22">path2</option>
			<option value="23">path3</option>
		</select> <input type="submit" class="btn btn-default btn-block active "
			value="提交" />
	</form>
</body>
</html>