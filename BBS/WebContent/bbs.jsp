<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%!String str = "";

	private void tree(Connection con, int id, int level) {
		Statement stmt = null;
		ResultSet rs = null;
		String preStr = "";
		for (int i = 0; i < level; i++) {
			preStr += "-----";
		}
		try {
			stmt = con.createStatement();
			String sql = "select * from article where pid=" + id;
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				str += "<tr><td>" + rs.getInt("id") + "</td>"+
							"<td>" + preStr + 
							"<a href='detail.jsp?id=" + rs.getInt("id")+ "'>" + 
							rs.getString("title") + "</a> " + 
							"</td>"+
							"<td>"+"<a href='delete.jsp?id="+rs.getInt("id")+"&pid="+rs.getInt("pid")+"'>删除</a>"+
							"</td>"+
						"</tr>";
				if (rs.getInt("isleaf") != 0) {
					tree(con, rs.getInt("id"), level + 1);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}%>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbs?serverTimezone=UTC", "root",
			"");
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("select * from article where pid = 0");
	while (rs.next()) {
		str += "<tr><td>" + rs.getInt("id") + "</td>"+
					"<td>" + "<a href='detail.jsp?id=" + rs.getInt("id") + "'>" + 
					rs.getString("title") + "</a>" + 
					"</td>"+
					"<td>"+"<a href='delete.jsp?id="+rs.getInt("id")+"&pid="+rs.getInt("pid")+"'>删除</a>"+
					"</td>"+
				"</tr>";
		if (rs.getInt("isleaf") != 0) {
			tree(con, rs.getInt("id"), 1);
		}
	}
	//"<tr><td>"+"<a href='post.jsp?rootid="+rs.getInt("rootid")+"'>发表帖子</a>"+"</td></tr>"
	rs.close();
	stmt.close();
	con.close();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.baidu.com/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BBS社区</title>
</head>
<body>
	<table border="1">
		<a href = "post.jsp">发表帖子</a>
		<%=str%>
		<%str =""; %>
		</table>
</body>
</html>