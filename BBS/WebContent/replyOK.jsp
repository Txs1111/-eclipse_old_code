<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
	int id = Integer.parseInt(request.getParameter("id"));
	String rootid = request.getParameter("rootid");
	String title = request.getParameter("title");
	String cont = request.getParameter("cont");
	cont = cont.replaceAll("\n", "<br>");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbs?serverTimezone=UTC", "root",
			"");
	con.setAutoCommit(false);
	PreparedStatement ps = con.prepareStatement("insert into article value (null,?,?,?,?,now(),0)");
	Statement stmt = con.createStatement();
	ps.setInt(1, id);
	ps.setString(2, rootid);
	ps.setString(3, title);
	ps.setString(4, cont);
	ps.executeUpdate();
	stmt.executeUpdate("update article set isleaf =1 where id = " + id);

	con.commit();
	con.setAutoCommit(true);
	stmt.close();
	ps.close();
	con.close();
	response.sendRedirect("bbs.jsp");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>提交页面</title>
</head>
<body>
	<h1>提交成功</h1>
</body>
</html>