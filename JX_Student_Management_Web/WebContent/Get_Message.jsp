
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	Connection con = null; //创建数据库对象
	ResultSet rs = null; //创建结果集
	Statement stmt = null; //用来存放对象
	String sql = null;
	try {
		Class.forName("com.mysql.jdbc.Driver"); //获取数据库驱动
	} catch (ClassNotFoundException e) {
		System.out.println("找不到驱动");
		e.printStackTrace();
	}
	try {
		con = DriverManager.getConnection(
				"jdbc:mysql:"
						+ "//106.15.193.201:3306/test_user?serverTimezone=UTC&useUnicode=true&characterEncoding=UTF-8",
				"root", "Lj145623."); //获取连接
		String ID = request.getParameter("ID");//传递参数
		String username = request.getParameter("username");
		String sex = request.getParameter("sex");
		String tel = request.getParameter("tel");
		String college = request.getParameter("college");
		String major = request.getParameter("major");
		String Class = request.getParameter("Class");
		String department = request.getParameter("department");
		String Hobby = request.getParameter("Hobby");
		String Technology = request.getParameter("Technology");
		if (username != null && sex != null && tel != null && ID != null && college != null && major != null
				&& Class != null && department != null && Hobby != null && Technology != null) { //解决第一次运行
			if (username == null || username == "") { //解决空填
				out.println("用户名不能为空！");
			} else {
				if (sex == null || sex == "") {
					out.println("性别不能为空！");
				} else {
					if (tel == null || tel == "") {
						out.println("手机号不能为空！");
					} else {
						if (ID == null || ID == "") {
							out.println("学号不能为空！");
						} else {
							if (college == null || college == "") {
								out.println("学院不能为空！");
							} else {
								if (major == null || major == "") {
									out.println("专业不能为空！");
								} else {
									if (Class == null || Class == "") {
										out.println("班级不能为空！");
									} else {
										if (department == null || department == "") {
											out.println("部门不能为空！");
										} else {
											sql = "INSERT INTO users_date(ID,username,sex,tel,college,major,class,department) VALUES ('"
													+ ID + "','" + username + "','" + sex + "','" + tel + "','"
													+ college + "','" + major + "','" + Class + "','"
													+ department + "');"; //sql语句
											System.out.println(sql); //打印SQL语句
											stmt = con.createStatement(); //创建statement（声明）对象
											stmt.executeUpdate(sql); //执行sql语句
											rs = stmt.executeQuery("select * from users_date;"); //查询sql语句
											while (rs.next()) { //打印SQL语句
												String printf_ID = rs.getString("ID");
												String printf_username = rs.getString("username");
												String printf_sex = rs.getString("sex");
												String printf_tel = rs.getString("tel");
												String printf_college = rs.getString("college");
												String printf_major = rs.getString("major");
												String printf_class = rs.getString("class");
												String printf_department = rs.getString("department");
												System.out.println(
														"姓名：" + printf_username + "	电话：" + printf_tel);
												System.out.println("性别：" + printf_sex + "	学号：" + printf_ID);
												System.out.println("学院：" + printf_college + "	专业："
														+ printf_major + "	班级：" + printf_class);
												System.out.println("部门：" + printf_department + "\n");
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}

	} catch (SQLException e) {
		e.printStackTrace();
	}
	try { //关闭数据库

		if (con != null) {
			con.close();
		}
		if (stmt != null) {
			stmt.close();
		}
		if (rs != null) {
			rs.close();
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>get_mesasage</title>
</head>
<body>
	<form action="Get_Message.jsp" method="post">
		<!-- action是传递地址 -->
		<h1>信息采集</h1>
		<input type="text" placeholder="username" name="username"><br />
		<input type="text" placeholder="sex" name="sex"><br /> <input
			type="text" placeholder="tel" name="tel"><br /> <input
			type="text" placeholder="ID" name="ID"><br /> <input
			type="text" placeholder="college" name="college"><br /> <input
			type="text" placeholder="major" name="major"><br /> <input
			type="text" placeholder="class" name="Class"><br /> <input
			type="text" placeholder="department" name="department"><br />
		<input type="text" placeholder="Hobby" name="Hobby"><br /> <input
			type="text" placeholder="Technology" name="Technology"><br />
		<input type="submit" value="Enter">
	</form>
</body>
</html>

