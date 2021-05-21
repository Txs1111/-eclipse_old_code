package bean;

import java.sql.SQLException;
import java.util.ArrayList;

import dao.MySQL_connect;

public class change_user_data_bean {
	public String ID = "";
	public MySQL_connect con = new MySQL_connect();

	public change_user_data_bean(String ID) {
		this.ID = ID;
	}

	public ArrayList<String> getdata() {
		ArrayList<String> result = new ArrayList<>();
		String sql = "select * from user_personal_data where ID='" + this.ID + "'";
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);
			this.con.result.next();
			result.add(this.con.result.getString("name"));
			result.add(this.con.result.getString("college"));
			result.add(this.con.result.getString("major"));
			result.add(this.con.result.getString("clas"));
			result.add(this.con.result.getString("tel"));
			result.add(this.con.result.getString("mail"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	public void change(String name, String college, String major, String clas, String tel, String mail) {
		String sql = "update user_personal_data set name='" + name + "',college='" + college + "',major='" + major
				+ "',clas='" + clas + "',tel='" + tel + "',mail='" + mail + "' where ID='" + this.ID + "'";
		System.out.println(sql);
		try {
			this.con.usercommend.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
