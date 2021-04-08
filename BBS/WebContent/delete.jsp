<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%!private void del(Connection con, int id) {
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = con.createStatement();
			String sql = "select * from article where pid=" + id;
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				del(con, rs.getInt("id"));
			}
			stmt.executeUpdate("delete from article where id =" + id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}%>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	int pid = Integer.parseInt(request.getParameter("pid"));
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbs?serverTimezone=UTC", "root",
			"");
	con.setAutoCommit(false);
	del(con, id);
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("select count(*) from article where pid =" + pid);
	rs.next();
	int count = rs.getInt(1);
	rs.close();
	stmt.close();
	if (count <= 0) {
		Statement stmtUpdates = con.createStatement();
		stmtUpdates.executeUpdate("update article set isleaf = 0 where id= " + pid);
		stmtUpdates.close();
	}
	con.commit();
	con.setAutoCommit(true);
	con.close();
	response.sendRedirect("bbs.jsp");
%>
