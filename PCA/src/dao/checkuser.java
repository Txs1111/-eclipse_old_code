package dao;

import java.sql.SQLException;

public class checkuser {

	public int check(String account, String password) {
		MySQL_connect con = new MySQL_connect();
		int result = 0;// ÕËºÅ²»´æÔÚ
		try {
			String sql = "select * from users_login where ID ='" + account + "'";
			con.result = con.usercommend.executeQuery(sql);
			if (con.result.next()) {
				if (con.result.getString("password").equals(password)) {
					result = 1;// µÇÂ¼³É¹¦
				} else {
					result = 2;// ÃÜÂë´íÎó
				}

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}
}
