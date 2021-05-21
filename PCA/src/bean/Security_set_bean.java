package bean;

import java.sql.SQLException;

import dao.*;

public class Security_set_bean {
	MySQL_connect con = new MySQL_connect();

	public boolean Security_set_bean(String[] data) {// [0]id [1]旧密码
														// oldpassword[2]新密码newpassword
		String[] user_data = new String[3];
		try {
			String[] date = data;
			String sql_1 = "select * from users_login";
			con.result = con.usercommend.executeQuery(sql_1);
			while (con.result.next()) {
				String ID = con.result.getString("ID");
				String role = con.result.getString("role");
				String password = con.result.getString("password");
				if (ID.equals(date[0])) {
					user_data[0] = ID;
					user_data[1] = role;
					user_data[2] = password;
				}
			}
			for (int i = 0; i < 3; i++) {
//				add_web_journal add_journal = new add_web_journal(data[0]);
//				add_journal.noothers("修改密码，从" + data[1] + "修改为" + data[2] + "");
				System.out.println(user_data[i]);
			}
			System.out.println("取出成功");
			if (date[2] != null && date[2] != "" && date[0] != null && date[0] != "" && date[1] != null
					&& date[1] != "") {
				if (user_data[2].equals(date[1])) {
					user_data[2] = date[2];
					String sql_2 = "replace into users_login set ID='" + user_data[0] + "',role='" + user_data[1]
							+ "',password='" + user_data[2] + "'";
					con.usercommend.executeUpdate(sql_2);
					for (int i = 0; i < 3; i++) {
						System.out.println(user_data[i]);
					}
					System.out.println("载入成功");

					return true;
				}
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

}
