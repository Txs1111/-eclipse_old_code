package user;


import java.sql.*;

public class first_use {
	public static void main(String[] args) throws Exception {
		Class.forName("com.mysql.jdbc.Dricer"); //1.����ʹ�ô�����
		//2.��������
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?serverTimezone=UTC","root", "");
		//3.����SQL������
		Statement stam = con.createStatement();
		//4.ִ��SQL���
		ResultSet rs = stam.executeQuery("select * form ");
		//5.�������
		if(rs.next()){
			System.out.println("succeed");
		}
		//6.�ر�
		con.close();
		stam.close();
		rs.close();
	}
}
