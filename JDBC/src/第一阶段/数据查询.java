package ��һ�׶�;

import java.sql.*;

public class ���ݲ�ѯ {
	public Connection getConnection() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("���ݿ���سɹ�");
		Connection con = DriverManager.getConnection("jdbc:mysql:" + 
		"//localhost:3306/test?serverTimezone=UTC", "root",
				"123456");
		System.out.println("���ݿ����ӳɹ�");
		return con;
	}

	public static void main(String[] args) {
		���ݲ�ѯ c = new ���ݲ�ѯ();
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
				System.out.print("��ţ�"+id);
				System.out.print("������"+name);
				System.out.print("�Ա�"+sex);
				System.out.println("���գ�" + birthday);
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
