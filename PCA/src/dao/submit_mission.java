package dao;

import java.sql.SQLException;

import bean.Handle_date;

public class submit_mission {
	public String ID = "";
	public String missionID = "";
	public MySQL_connect con = new MySQL_connect();
	Handle_date date = new Handle_date();

	public submit_mission(String ID, String missionID, String content) {
		this.ID = ID;
		this.missionID = missionID;
		submission(content);
	}

	public void submission(String content) {
		String sql = "select * from mission_finish";

		try {
			this.con.result = this.con.usercommend.executeQuery(sql);
			int num = 0;
			while (this.con.result.next()) {
				num++;
			}
			num = num + 1;
			sql = "insert into mission_finish value('"+num+"','" + this.missionID + "','" + this.ID + "','" + content
					+ "',' ',' ',' ','" + date.getIntDate() + "')";
			this.con.usercommend.executeUpdate(sql);
			add_web_journal add_journal = new add_web_journal(ID);
			add_journal.noothers("提交任务，任务ID为："+this.missionID+"");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
