<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>

<%
	request.setCharacterEncoding("utf-8");
	String action =request.getParameter("action");
	if(action != null && action.equals("post")){
		String title = request.getParameter("title");
		String cont = request.getParameter("cont");
		cont = cont.replaceAll("\n", "<br>");
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbs?serverTimezone=UTC", "root",
		"");
		con.setAutoCommit(false);
		PreparedStatement ps = con.prepareStatement("insert into article value (null,0,?,?,?,now(),1)",Statement.RETURN_GENERATED_KEYS);
		Statement stmt = con.createStatement();
		ps.setInt(1, -1);
		ps.setString(2, title);
		ps.setString(3, cont);
		ps.executeUpdate();
		
		ResultSet rsKey = ps.getGeneratedKeys();
		rsKey.next();
		int key =rsKey.getInt(1);
		rsKey.close();
		stmt.executeUpdate("update article set rootid = " + key + " where id =" + key);

		con.commit();
		con.setAutoCommit(true);
		stmt.close();
		ps.close();
		con.close();
		response.sendRedirect("bbs.jsp");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>帖子</title>
</head>
<body>
	<form action="post.jsp" method="post">
	<input type="hidden" name="action" value="post">
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