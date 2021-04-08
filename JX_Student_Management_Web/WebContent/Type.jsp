
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%
	Connection con = null; //创建数据库对象
	ResultSet rs = null;
	PreparedStatement ps = null;
	Statement stmt =null;
	String sql = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
	} catch (ClassNotFoundException e) {
		System.out.println("########notfound异常##########");
		e.printStackTrace();
	}
	System.out.println("数据库加载成功");
	try {
		con = DriverManager.getConnection(
				"jdbc:mysql:"
						+ "//localhost:3306/Type_Speed?serverTimezone=Asia/Shanghai&userEnicode=true;characterEncoding=UTF-8; ",
				"root", "");
	} catch (SQLException e) {
		System.out.println("##########SQL异常##########");
		e.printStackTrace();
	}
	System.out.println("数据库连接成功");
	String Username = request.getParameter("Username");
	String Student_Number = request.getParameter("Student_Number");
	String Typing_Speed = request.getParameter("Typing_Speed");
	System.out.println("用户信息读取完毕");
	
	if (Username == null || Student_Number == null || Typing_Speed == null) {	//有空字段
		System.out.println("信息不完整，请重新输入");
	} else if (Username != null && Student_Number != null && Typing_Speed != null) {	//每个空都填了
		System.out.println("开始更新数据。。。");
		try {
			sql = "INSERT INTO Typing_Speed(Username,Student_Number,Typing_Speed) VALUES (?,?,?);";
			ps.setString(1, Username);
			ps.setString(2, Student_Number);
			ps.setString(3, Typing_Speed);
			System.out.println("。。。100%");
			ps = con.prepareStatement(sql);
		} catch (Exception e) {
			System.out.println("##########SQL异常2##########");
			e.printStackTrace();
		}
		int result = 0;
		stmt = con.createStatement();
		rs = stmt.executeQuery("select * from Type_Speed");
		
		while (rs.next()) {
			System.out.println("Username:" + Username);
			System.out.println("Student_Number:" + Student_Number);
			System.out.println("Typing_Speed:" + Typing_Speed);
			if (Student_Number == rs.getString("Student_Number")) { //用户已注册
				System.out.println("该用户已存在");
				result = 1;		//用户已存在
			}
		}
		if (result == 0) { //用户不存在
			try {
				result = ps.executeUpdate(sql);
				if (result > 0) {
					System.out.println("添加成功");
				} else {
					System.out.println("添加失败");
				}
			} catch (SQLException e) {
				System.out.println("##########SQL更新失败!!##########");
				e.printStackTrace();
			}
		}

	}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>打字速度记录页面</title>
</head>
<body>
	<form action="Type.jsp" method="post">
		<h1>成绩记录</h1>
		<input type="text" placeholder="Username" name="Username"><br />
		<input type="text" placeholder="Student_Number" name="Student_Number"><br />
		<input type="text" placeholder="Typing_Speed" name="Typing_Speed"><br />
		<input type="submit" value="Enter">
	</form>
</body>
</html>

