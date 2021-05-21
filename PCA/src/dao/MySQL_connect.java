package dao;

import java.sql.*;

public class MySQL_connect {
	public Connection usermysql = null;
	public Statement usercommend = null;
	public ResultSet result = null;

	public MySQL_connect() {
		// System.out.println("<----MySQL_connect.java---->");
		// System.out.println("连接...");
		// System.out.println("<-------------------------->");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");// 打开链接
			this.usermysql = DriverManager.getConnection(
					"jdbc:mysql://106.15.193.201:3306/PCAstu?useUnicode = true&characterEncoding = UTF8&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai",
					"root", "Lj145623+");
			// 执行查询
			this.usercommend = this.usermysql.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
					ResultSet.CONCUR_UPDATABLE);

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void close() {
		try {
			this.result.close();
			this.usercommend.close();
			this.usermysql.close();
			System.out.println("<----MySQL_connect.java---->");
			System.out.println("连接已关闭");
			System.out.println("<-------------------------->");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
