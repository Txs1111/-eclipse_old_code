package dao;

import java.sql.*;

public class check_same {
	ResultSet result = null;
	Statement usercommend = null;

	public check_same() {
		MySQL_connect con = new MySQL_connect();
		this.usercommend = con.usercommend;
	}

	public int searchID(String sql) {
		int back = 0;
		try {
			this.result = this.usercommend.executeQuery(sql);
			if (result.next()) {
				back = 1;
			} else
				back = 0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return back;
	}
}
