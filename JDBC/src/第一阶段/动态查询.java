package ��һ�׶�;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ��̬��ѯ {
	static Connection con;
	static PreparedStatement ps;
	static ResultSet res;
	public Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("���ݿ���سɹ�");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			con = DriverManager.getConnection("jdbc:mysql:"+"//localhost:3306/test?serverTimezone=UTC","root", "123456");
			System.out.println("���ݿ����ӳɹ�");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
	public static void main(String[] args) {
		��̬��ѯ c = new ��̬��ѯ();
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
			System.out.print("��ţ�"+id);
			System.out.print("������"+name);
			System.out.print("�Ա�"+sex);
			System.out.println("���գ�"+birthday);
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
