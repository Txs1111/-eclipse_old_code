package 第一阶段;

import java.sql.*;

public class 数据查询 {
	public Connection getConnection() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("数据库加载成功");
		Connection con = DriverManager.getConnection("jdbc:mysql:" + 
		"//localhost:3306/test?serverTimezone=UTC", "root",
				"123456");
		System.out.println("数据库连接成功");
		return con;
	}

	public static void main(String[] args) {
		数据查询 c = new 数据查询();
		Connection con = null;
		Statement stmt = null;
		ResultSet res = null;
		try {
			con = c.getConnection();
			stmt = con.createStatement();

			res = stmt.executeQuery("select * from tb_stu");
			while (res.next()) {
				String id = res.getString(1);
				String name = res.getString("name");
				String sex = res.getString("sex");
				String birthday = res.getString("birthday");
				System.out.print("编号："+id);
				System.out.print("姓名："+name);
				System.out.print("性别："+sex);
				System.out.println("生日：" + birthday);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (res != null) {
				try {
					res.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				if (con != null) {
					try {
						con.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}
	}
}
