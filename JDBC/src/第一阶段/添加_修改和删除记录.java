package ��һ�׶�;

import java.sql.*;

public class ���_�޸ĺ�ɾ����¼ {
	static Connection con;
	static PreparedStatement ps;
	static ResultSet res;

	public Connection getConnection() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("���ݿ���سɹ�");
		con = DriverManager.getConnection("jdbc:mysql:" + "//localhost:3306/test?serverTimezone=UTC", "root",
				"123456");
		System.out.println("���ݿ����ӳɹ�");
		return con;
	}

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		���_�޸ĺ�ɾ����¼ c = new ���_�޸ĺ�ɾ����¼();
		con = c.getConnection();

		try {
			ps = con.prepareStatement("select * from tb_stu");
			res = ps.executeQuery();
			System.out.println("ִ����ӡ��޸ġ�ɾ��ǰ����");
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
			ps = con.prepareStatement("insert into tb_stu(name,sex,birthday) values(?,?,?)");
			ps.setString(1, "��һ");
			ps.setString(2, "Ů");
			ps.setString(3, "2012-12-1");
			ps.executeUpdate();
			Statement stmt = con.createStatement();
			stmt.executeUpdate("delete from tb_stu where id=1");
			ps = con.prepareStatement("select * from tb_stu");
			res = ps.executeQuery();
			System.out.println("ִ�����ӡ��޸ġ�ɾ��֮�������");
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
		} finally {
			if (res != null) {
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
