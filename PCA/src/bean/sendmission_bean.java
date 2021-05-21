package bean;

import java.sql.SQLException;

import dao.MySQL_connect;

public class sendmission_bean {
	public String ID = null;
	public String missiontypes = "";
	public String missionlanguage = "";
	public MySQL_connect con = new MySQL_connect();
public static void main(String[] args) {
	sendmission_bean bean=new sendmission_bean("000");
	bean.getmissionlanguage();
	
}
	public sendmission_bean(String ID) {
		this.ID = ID;
	}

	public void getmissiontype() {
		String sql = "select * from mission_type";
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);
			while (this.con.result.next()) {
				this.missiontypes = this.missiontypes + this.con.result.getString("ID") + "_";
				this.missiontypes = this.missiontypes + this.con.result.getString("type") + "+";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void getmissionlanguage() {
		String sql = "select * from mission_language";
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);
			while (this.con.result.next()) {
				this.missionlanguage = this.missionlanguage + this.con.result.getString("ID") + "_";
				this.missionlanguage = this.missionlanguage + this.con.result.getString("language") + "/";
			}
			System.out.println(this.missionlanguage);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
