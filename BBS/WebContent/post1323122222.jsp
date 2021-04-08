<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>

<%
	request.setCharacterEncoding("utf-8");
	int rootid = Integer.parseInt(request.getParameter("rootid"));
	String title = request.getParameter("title");
	String cont = request.getParameter("cont");
	cont = cont.replaceAll("\n", "<br>");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbs?serverTimezone=UTC", "root",
			"");
	con.setAutoCommit(false);
	PreparedStatement ps = con.prepareStatement("insert into article value (null,0,?,?,?,now(),1)");
	Statement stmt = con.createStatement();
	ps.setInt(1, rootid);
	ps.setString(2, title);
	ps.setString(3, cont);
	ps.executeUpdate();
	con.commit();
	con.setAutoCommit(true);
	ps.close();
	con.close();
	response.sendRedirect("bbs.jsp");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>帖子</title>
</head>
<body>
	<h1>添加成功</h1>
</body>
</html>