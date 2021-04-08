<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>

<!--  DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
</head>
<body>
	<%
		Connection con = null;					//创建数据库对象
		ResultSet res = null;
		Statement stmt = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			//System.out.println("数据库加载成功");
			con = DriverManager.getConnection("jdbc:mysql:" + "//localhost:3306/login?serverTimezone=UTC", "root", "");
			//System.out.println("数据库连接成功");
		}catch(Exception e){
			e.printStackTrace();
		}
		stmt = con.createStatement();	//
		String user = request.getParameter("username");
		String psw = request.getParameter("password");
		if (psw == null && user ==null) {
			String sql = "select * from admin where user='"+user+"' and password='"+psw+"'";
			res = stmt.executeQuery(sql);
			if(res.next()) {
				
			}else{
				System.out.println("用户名或者密码错误");
			}
		}else if(psw == null){
			System.out.println("请输入密码");
		}else{
			System.out.println("请输入账号");
		}
		
	%>
	<h1>Login</h1>
	<form action="test.jsp" method="post">	
		<div>
			<font style="">用户名：</font> 
			<input type=text placeholder="Username" name="username" style="">
			<!-- <@% String user = %> -->
		</div>
		<div>
			<font style="">密&nbsp;码：</font>
			<input type="password" placeholder="PassWord" name="password" style="">
		</div>

		<div>
			<input type="submit" value="登录">
		</div>
	</form>

</body>
</html>
