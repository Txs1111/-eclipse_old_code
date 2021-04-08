
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%
	//rquest.setCharacterEncoding("UTF-8");
	Connection con = null; //创建数据库对象
	ResultSet rs = null;
	PreparedStatement ps = null;
	Statement stmt = null;
	String sql = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(
				"jdbc:mysql:"
						+ "//106.15.193.201:3306/Type_Speed2?serverTimezone=UTC&userEnicode=true;characterEncoding=UTF-8",
				"root", "Lj145623.");
		String Username = request.getParameter("Username");
		String Student_Number = request.getParameter("Student_Number");
		String Typing_Speed = request.getParameter("Typing_Speed");

		System.out.println("开始更新数据。。。");
		if (Username != null && Student_Number != null && Typing_Speed != null)
			sql = "INSERT INTO Type_Speed(Username,Student_Number,Typing_Speed) VALUES ('" + Username + "','"
					+ Student_Number + "','" + Typing_Speed + "');";
		ps = con.prepareStatement(sql);

		//stmt = con.createStatement();
		//stmt.executeUpdate(sql);
		ps.setString(1, Username);
		ps.setString(2, Student_Number);
		ps.setString(3, Typing_Speed);
		System.out.println("。。。100%");
	
		int result = ps.executeUpdate();
		if (result > 0) {
			System.out.println("添加成功");
		} else {
			System.out.println("添加失败");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>打字速度记录页面</title>
</head>
<body>
	<form action="NewFile.jsp" method="post">
		<h1>成绩记录</h1>
		<input type="text" placeholder="Username" name="Username"><br />
		<input type="text" placeholder="Student_Number" name="Student_Number"><br />
		<input type="text" placeholder="Typing_Speed" name="Typing_Speed"><br />
		<input type="submit" value="Enter">
	</form>
</body>
</html>

