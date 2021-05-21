package dao;

import java.sql.SQLException;

import bean.user_personal_homepage_bean;

public class add_user {
	MySQL_connect con = new MySQL_connect();

	public int add(String ID, String password, String username, String school_ID, String clas, String apartment) {
		String sql = "";
		int result = 0;
		result = 1;
		try {
			if ("0".equals(apartment)) {
				sql = "insert  into users_login value('" + ID + "','7','" + password + "')";
			} else {
				sql = "insert  into users_login value('" + ID + "','1','" + password + "')";
			}
			con.usercommend.executeUpdate(sql);
			System.out.println("插入1");
			sql = "insert into user_personal_data value('" + ID + "','" + username + "','2021-01-01','" + apartment
					+ "','" + clas + "','" + null + "','" + null + "','" + null + "','" + null + "','" + school_ID
					+ "')";
			con.usercommend.executeUpdate(sql);
			System.out.println("插入2");
			sql = "insert  into user_data value('" + ID + "','默认昵称','这个人很懒~啥都没写','1','1','0')";
			con.usercommend.executeUpdate(sql);
			System.out.println("插入3");
			sql = "alter table user_mission add U_" + ID + " varchar(10)";
			con.usercommend.executeUpdate(sql);
			System.out.println("插入4");

			add_web_journal add_journal = new add_web_journal(ID);
			add_journal.noothers("注册");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("注册3");
		return result;
	}
}
