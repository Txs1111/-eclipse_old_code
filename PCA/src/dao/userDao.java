package dao;

import java.sql.ResultSet;
import java.sql.SQLException;

public class userDao {
	String ID;
	String password;
	MySQL_connect con = new MySQL_connect();


	public userDao(String ID, String password) {
		this.ID = ID;
		this.password = password;
	}

	public int checkuser() {
		int result = 0;
		String sql = "select * from users_login where ID = '" + this.ID + "'";

		try {

			this.con.result = con.usercommend.executeQuery(sql);
			if (this.con.result.next()) {
				if (this.con.result.getString("password").equals(this.password)) {
					result = 1;// ��½�ɹ�
					
					System.out.println("��½�ɹ�");
					
				} else {
					result = 2;// �������
					System.out.println("�������");
				}
			} else {
				result = 3;// �˺Ų�����
				System.out.println("�˺Ų�����");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("����ʧ��");
			e.printStackTrace();
		}
		return result;

	}
}