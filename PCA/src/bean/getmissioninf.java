package bean;

import java.sql.SQLException;

import dao.MySQL_connect;

public class getmissioninf {
	public String missionID;
	public String missioninf = "";
	public MySQL_connect con = new MySQL_connect();
	public MySQL_connect con2 = new MySQL_connect();
	public getmissioninf(String missionID) {
		this.missionID = missionID;
		getmission();
	}

	public void getmission() {
		String sql = "select * from mission where missionID='" + this.missionID + "'";
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);
			this.con.result.next();
			this.missioninf=this.missioninf+this.con.result.getString("tittle")+"��";
			this.missioninf=this.missioninf+this.con.result.getString("publish_date")+"��";
			this.missioninf=this.missioninf+this.con.result.getString("end_date")+"��";
			String sql2="select language from mission_language where ID='"+this.con.result.getString("language")+"'";
			this.con2.result=this.con2.usercommend.executeQuery(sql2);
			this.con2.result.next();
			this.missioninf=this.missioninf+this.con2.result.getString("language")+"��";
			sql2="select type from mission_type where ID='"+this.con.result.getString("type")+"'";
			this.con2.result=this.con2.usercommend.executeQuery(sql2);
			this.con2.result.next();
			this.missioninf=this.missioninf+this.con2.result.getString("type")+"��";
			this.missioninf=this.missioninf+this.con.result.getString("mission_point")+"��";
			this.missioninf=this.missioninf+this.con.result.getString("mission_difficult")+"��";
			this.missioninf=this.missioninf+this.con.result.getString("content")+"��";
	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		System.out.println(this.missioninf);
	}
}
