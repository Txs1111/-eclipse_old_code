package bean;

import java.sql.SQLException;
import java.util.StringTokenizer;

import dao.MySQL_connect;

public class sendtext_bean {
	public String ID;
	public MySQL_connect con = new MySQL_connect();
	public String ID_headphoto = "";
	public String usersname = "";
	public int countuser = 0;

	public static void main(String[] args) {
		sendtext_bean bean = new sendtext_bean("000");
		bean.getuser("3", 2);
		System.out.println(bean.ID_headphoto);
		System.out.println(bean.usersname);
	}

	public sendtext_bean(String ID) {
		this.ID = ID;
	}

	public String getuserrole() {
		String sql = "select * from user_role";
		String data = "";
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);
			while (this.con.result.next()) {
				data = data + this.con.result.getString("ID") + "_";
				data = data + this.con.result.getString("role") + "_";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return data;
	}

	public void getuser(String role, int nowpage) {
		String IDs = "";
		String sql = "";
		if ("0".equals(role)) {
			try {
				sql = "select ID from users_login ";
				this.con.result = this.con.usercommend.executeQuery(sql);
				while (this.con.result.next()) {
					this.countuser = this.countuser + 1;
				}
				sql = "select ID from users_login limit " + ((nowpage - 1) * 15) + ",15";
				this.con.result = this.con.usercommend.executeQuery(sql);
				while (this.con.result.next()) {
					IDs = IDs + this.con.result.getString("ID") + "ö›";
				}
				StringTokenizer chart = new StringTokenizer(IDs, "ö›");
				int num = chart.countTokens();
				String userID = "";
				for (int a = 0; a < num; a++) {
					userID = chart.nextToken();
					sql = "select head_photo from user_data where ID='" + userID + "'";
					this.con.result = this.con.usercommend.executeQuery(sql);
					this.con.result.next();
					this.ID_headphoto = this.ID_headphoto + userID + "ö›" + this.con.result.getString("head_photo")
							+ "ö›";
				}
				chart = new StringTokenizer(IDs, "ö›");
				for (int a = 0; a < num; a++) {
					userID = chart.nextToken();
					sql = "select name from user_personal_data where ID='" + userID + "'";
					this.con.result = this.con.usercommend.executeQuery(sql);
					this.con.result.next();
					this.usersname = this.usersname + this.con.result.getString("name") + "ö›";
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			try {
				sql = "select ID from users_login where role='" + role + "'";
				this.con.result = this.con.usercommend.executeQuery(sql);
				while (this.con.result.next()) {
					this.countuser = this.countuser + 1;
				}
				sql = "select ID from users_login where role='" + role + "'limit " + ((nowpage - 1) * 15) + ",15";
				this.con.result = this.con.usercommend.executeQuery(sql);
				while (this.con.result.next()) {
					IDs = IDs + this.con.result.getString("ID") + "ö›";
				}
				StringTokenizer chart = new StringTokenizer(IDs, "ö›");
				int num = chart.countTokens();
				String userID = "";
				for (int a = 0; a < num; a++) {
					userID = chart.nextToken();
					sql = "select head_photo from user_data where ID='" + userID + "'";
					this.con.result = this.con.usercommend.executeQuery(sql);
					this.con.result.next();
					this.ID_headphoto = this.ID_headphoto + userID + "ö›" + this.con.result.getString("head_photo")
							+ "ö›";
				}
				chart = new StringTokenizer(IDs, "ö›");
				for (int a = 0; a < num; a++) {
					userID = chart.nextToken();
					sql = "select name from user_personal_data where ID='" + userID + "'";
					this.con.result = this.con.usercommend.executeQuery(sql);
					this.con.result.next();
					this.usersname = this.usersname + this.con.result.getString("name") + "ö›";
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	public boolean equal(String A, String B) {

		if (A.equals(B)) {
			return true;
		} else {
			return false;
		}
	}

}
