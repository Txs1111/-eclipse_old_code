package 第一阶段;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class 动态查询 {
	static Connection con;
	static PreparedStatement ps;
	static ResultSet res;
	public Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("数据库加载成功");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			con = DriverManager.getConnection("jdbc:mysql:"+"//localhost:3306/test?serverTimezone=UTC","root", "123456");
			System.out.println("数据库连接成功");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
	public static void main(String[] args) {
		动态查询 c = new 动态查询();
		con = c.getConnection();
	
	try {
		ps = con.prepareStatement("select * from tb_stu"+"where id =?");
		ps.setInt(1,4);
		res = ps.executeQuery();
		while(res.next()) {
			String id = res.getString(1);
			String name = res.getString("name");
			String sex = res.getString("sex");
			String birthday = res.getString("birthday");
			System.out.print("编号："+id);
			System.out.print("姓名："+name);
			System.out.print("性别："+sex);
			System.out.println("生日："+birthday);
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	finally {
		if(res != null) {
			try {
				res.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	}
}
