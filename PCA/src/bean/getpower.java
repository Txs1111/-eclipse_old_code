package bean;

import java.sql.SQLException;
import java.util.StringTokenizer;

import dao.MySQL_connect;

public class getpower {
	public String ID = "";
	public MySQL_connect con = new MySQL_connect();
	public String power = "";

	public static void main(String[] args) {
		getpower get = new getpower("2019000101906");
		System.out.println(get.checkpower("5"));

	}

	public getpower(String ID) {
		this.ID = ID;
		String sql = "select role from users_login where ID='" + this.ID + "'";

		try {
			String role = "";
			this.con.result = this.con.usercommend.executeQuery(sql);
			this.con.result.next();
			role = this.con.result.getString("role");
			sql = "select jurisdiction from user_role where ID='" + role + "'";
			this.con.result = this.con.usercommend.executeQuery(sql);
			this.con.result.next();
			this.power = this.con.result.getString("jurisdiction");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public boolean checkpower(String function) {
		boolean result = false;
		StringTokenizer chart = new StringTokenizer(this.power, "-");
		int num = chart.countTokens();
		for (int a = 0; a < num; a++) {
			if (function.equals(chart.nextToken())) {
				result = true;
			}
		}

		return result;
	}
}
