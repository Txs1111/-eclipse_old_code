package ��һ�׶�;

import java.sql.*;

public class �������ݿ����� {
	Connection con;
	public Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("���ݿ���سɹ�");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			con = DriverManager.getConnection("jdbc:mysql://106.15.193.201:3306/AllInfo?serverTimezone=UTC", "root", "Lj145623.");
			System.out.println("���ݿ����ӳɹ�");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
public static void main(String[] args) {
	�������ݿ����� c = new �������ݿ�����();
	c.getConnection();
}
}

