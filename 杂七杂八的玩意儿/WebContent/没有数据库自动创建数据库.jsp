<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = null;
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbs?serverTimezone=UTC", "root", "");
	Statement st = con.createStatement();
	ResultSet rs = null;
	try {
		st.executeUpdate("use 如果数据库中我不存在，我将会自动生成");
	} catch (SQLException e) {
		st.executeUpdate("create database 如果数据库中我不存在，我将会自动生成");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>如果数据库中我不存在时将自动生成此数据库</title>
</head>
<body>
<h1>生成数据库成功！</h1>
</body>
</html>