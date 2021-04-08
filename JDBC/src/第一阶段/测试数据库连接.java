package 第一阶段;

import java.sql.*;

public class 测试数据库连接 {
	Connection con;
	public Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("数据库加载成功");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			con = DriverManager.getConnection("jdbc:mysql://106.15.193.201:3306/AllInfo?serverTimezone=UTC", "root", "Lj145623.");
			System.out.println("数据库连接成功");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
public static void main(String[] args) {
	测试数据库连接 c = new 测试数据库连接();
	c.getConnection();
}
}

