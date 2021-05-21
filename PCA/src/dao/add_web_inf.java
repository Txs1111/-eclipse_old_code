package dao;

import java.sql.SQLException;

public class add_web_inf {
	MySQL_connect con = new MySQL_connect();
	String ID = null;

	public add_web_inf(String ID) {
		this.ID = ID;
	}

	public void add_pet(String inf) {
		String sql = "select * from pet_tips";
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);
			int num = 1;
			while (this.con.result.next()) {

				num++;
			}
			sql = "insert into pet_tips value('" + num + "','" + inf + "')";
			this.con.usercommend.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void add_head(String inf) {
		String sql = "select * from page_sets";
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);
			int num = 1;
			while (this.con.result.next()) {

				num++;
			}
			sql = "insert into page_sets value('" + num + "','" + inf + "')";
			this.con.usercommend.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
