package dao;

import java.sql.SQLException;

import bean.Handle_date;

public class add_web_journal {
	public String ID;
	public MySQL_connect con = new MySQL_connect();
	Handle_date date = new Handle_date();

	public add_web_journal(String ID) {
		this.ID = ID;
	}
	// 此事件只与登录用户有关
	public void noothers(String content) {
		String sql = "select * from journal";
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);
			int num = 1;
			while (this.con.result.next()) {
				num++;
			}
			sql = "select name from user_personal_data where ID='" + this.ID + "'";
			this.con.result = this.con.usercommend.executeQuery(sql);
			this.con.result.next();
			String name = this.con.result.getString("name");

			sql = "insert into journal value ('" + num + "','" + date.getIntDate() + "','" + this.ID + "','" + name
					+ "','null','null','" + content + "')";
			System.out.println(sql);
			this.con.usercommend.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 此事件有被影响者
	public void oneelse(String inID, String content) {
		String sql = "select * from journal";
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);
			int num = 1;
			while (this.con.result.next()) {
				num++;
			}
			sql = "select name from user_personal_data where ID='" + this.ID + "'";
			this.con.result = this.con.usercommend.executeQuery(sql);
			this.con.result.next();
			String name1 = this.con.result.getString("name");
			sql = "select name from user_personal_data where ID='" + inID + "'";
			this.con.result = this.con.usercommend.executeQuery(sql);
			this.con.result.next();
			String name2 = this.con.result.getString("name");
			sql = "insert into journal value ('" + num + "','" + date.getIntDate() + "','" + this.ID + "','" + name1
					+ "','"+inID+"','"+name2+"','" + content + "')";
			System.out.println(sql);
			this.con.usercommend.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
