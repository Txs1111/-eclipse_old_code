package dao;

import java.sql.SQLException;

import bean.Handle_date;

public class sign_calendar {
	public sign_calendar(String ID) {
		MySQL_connect con = new MySQL_connect();
		Handle_date date = new Handle_date();
		String sql = "insert into calendar value ('" + ID + "','" + date.getyear() + "-" + date.getMonth() + "-"
				+ date.getDay() + "')";
		String sql2 = "select * from calendar where ID='" + ID + "'and signin_time='" + date.getyear() + "-"
				+ date.getMonth() + "-" + date.getDay() + "'";
		add_web_journal add_journal = new add_web_journal(ID);
		add_journal.noothers("Ç©µ½");
		try {
			con.result = con.usercommend.executeQuery(sql2);
			if (!con.result.next()) {
				con.usercommend.executeUpdate(sql);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
