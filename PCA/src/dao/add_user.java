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
			System.out.println("����1");
			sql = "insert into user_personal_data value('" + ID + "','" + username + "','2021-01-01','" + apartment
					+ "','" + clas + "','" + null + "','" + null + "','" + null + "','" + null + "','" + school_ID
					+ "')";
			con.usercommend.executeUpdate(sql);
			System.out.println("����2");
			sql = "insert  into user_data value('" + ID + "','Ĭ���ǳ�','����˺���~ɶ��ûд','1','1','0')";
			con.usercommend.executeUpdate(sql);
			System.out.println("����3");
			sql = "alter table user_mission add U_" + ID + " varchar(10)";
			con.usercommend.executeUpdate(sql);
			System.out.println("����4");

			add_web_journal add_journal = new add_web_journal(ID);
			add_journal.noothers("ע��");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("ע��3");
		return result;
	}
}
