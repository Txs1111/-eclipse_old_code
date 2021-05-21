package dao;

import java.sql.SQLException;

public class get_version {
	public String getversion() {
		MySQL_connect con = new MySQL_connect();
		String version = null;
		try {
			con.result = con.usercommend.executeQuery("select * from develop_journal");
			while (con.result.next()) {
				version = con.result.getString("version");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return version;
	}
}
