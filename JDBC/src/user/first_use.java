package user;


import java.sql.*;

public class first_use {
	public static void main(String[] args) throws Exception {
		Class.forName("com.mysql.jdbc.Dricer"); //1.告诉使用此驱动
		//2.进行连接
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?serverTimezone=UTC","root", "");
		//3.创建SQL语句对象
		Statement stam = con.createStatement();
		//4.执行SQL语句
		ResultSet rs = stam.executeQuery("select * form ");
		//5.进行输出
		if(rs.next()){
			System.out.println("succeed");
		}
		//6.关闭
		con.close();
		stam.close();
		rs.close();
	}
}
