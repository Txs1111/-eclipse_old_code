package dao;

import java.sql.SQLException;

public class checkuser {

	public int check(String account, String password) {
		MySQL_connect con = new MySQL_connect();
		int result = 0;// �˺Ų�����
		try {
			String sql = "select * from users_login where ID ='" + account + "'";
			con.result = con.usercommend.executeQuery(sql);
			if (con.result.next()) {
				if (con.result.getString("password").equals(password)) {
					result = 1;// ��¼�ɹ�
				} else {
					result = 2;// �������
				}

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}
}
