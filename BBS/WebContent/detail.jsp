<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>

<%
	String strId = request.getParameter("id");
	int id = Integer.parseInt(strId);

	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbs?serverTimezone=UTC", "root",
			"");
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("select * from article where id = " + id);
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BBS详情页面</title>
</head>
<body>
	<%
		if (rs.next()) {
	%>

	<table border="1">
		<tr>
			<td>ID</td>
			<td><%=rs.getInt("id")%></td>
		</tr>
		<tr>
			<td>Title</td>
			<td><%=rs.getString("title")%></td>
		</tr>
		<tr>
			<td>Content</td>
			<td><%=rs.getString("cont")%></td>
		</tr>
	</table>
	<br>
	<a
		href="reply.jsp?id=<%=rs.getInt("id")%>&rootid=<%=rs.getInt("rootid")%>">回复</a>


	<%
		}
		rs.close();
		stmt.close();
		con.close();
	%>

</body>
</html>