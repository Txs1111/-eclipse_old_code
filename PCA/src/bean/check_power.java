package bean;

import java.sql.SQLException;
import java.util.StringTokenizer;

import dao.MySQL_connect;

public class check_power {
	String ID = "";
	MySQL_connect con = new MySQL_connect();

	public static void main(String[] args) {
		check_power check = new check_power("000");
		System.out.println(check.access("5"));

	}

	public check_power(String ID) {
		this.ID = ID;
	}

	public boolean access(String power) {
		boolean result = false;
		String sql = "select role from users_login where ID='" + this.ID + "'";
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);
			this.con.result.next();
			sql = "select jurisdiction from user_role where ID='" + this.con.result.getString("role") + "'";
			this.con.result = this.con.usercommend.executeQuery(sql);
			this.con.result.next();
			// System.out.println();
			StringTokenizer chart = new StringTokenizer(this.con.result.getString("jurisdiction"), "-");
			int num = chart.countTokens();
			for (int a = 0; a < num; a++) {
				if (power.equals(chart.nextToken())) {
					result = true;
					break;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
}
