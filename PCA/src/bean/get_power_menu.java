package bean;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.StringTokenizer;

import dao.MySQL_connect;

public class get_power_menu {
	public String ID = "";
	public MySQL_connect con = new MySQL_connect();

	public get_power_menu(String ID) {
		this.ID = ID;
	}

	public ArrayList<String> power_menu() {
		String sql = "select function from function_power";
		ArrayList<String> menu = new ArrayList<>();
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);
			while (this.con.result.next()) {
				menu.add(this.con.result.getString("function"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// System.out.println(menu);
		return menu;
	}

	public void changeuserrole(String ID, String role) {

		String sql = "update users_login set role='" + role + "' where ID='" +ID + "'";
		System.out.println(sql);
		 try {
		
		 this.con.usercommend.executeUpdate(sql);
		 } catch (SQLException e) {
		 // TODO Auto-generated catch block
		 e.printStackTrace();
		 }
	}

	public void changerole(String role, String power[]) {
		String powers = "";
		for (int a = 0; a < power.length; a++) {
			if (power[a] != null && !"null".equals(power[a])) {
				powers = powers + power[a] + "-";
			}
		}

		String sql = "update user_role set jurisdiction='" + powers + "' where ID='" + role + "'";
		try {
			this.con.usercommend.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public ArrayList<String> readrole(String role) {
		ArrayList<String> result = new ArrayList<>();
		String sql = "select jurisdiction from user_role where ID='" + role + "'";
		String power = "";
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);
			this.con.result.next();
			power = this.con.result.getString("jurisdiction");
			StringTokenizer chart = new StringTokenizer(power, "-");
			int num = chart.countTokens();
			for (int a = 0; a < num; a++) {
				result.add(chart.nextToken());
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	public void addrole(String rolename, String power[]) {
		// System.out.println(rolename);
		String powers = "";
		for (int a = 0; a < power.length; a++) {
			if (power[a] != null && !"null".equals(power[a])) {
				powers = powers + power[a] + "-";
			}
		}
		String sql = "select * from user_role";
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);
			int num = 1;
			while (this.con.result.next()) {
				num++;
			}
			sql = "insert into user_role value('" + num + "','" + rolename + "','" + powers + "')";
			this.con.usercommend.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
