package bean;


import java.sql.SQLException;

import dao.*;

public class official_bean {
	MySQL_connect con = new MySQL_connect();
	MySQL_connect con2 = new MySQL_connect();
	public int allnum = 0;

	public String getmessage(String ID, String t) {
		
		System.out.println("type" + t);
		String official = "";
		System.out.println("成功");
		try {
			String sql = "select role from users_login where ID='" + ID + "'";
			con2.result = con2.usercommend.executeQuery(sql);
			con2.result = con2.usercommend.executeQuery(sql);
			con2.result.next();
			String role = con2.result.getString("role");
			sql = "select * from text where get_ID='" + ID + "'or get_ID='role_" + role + " 'or get_ID='0' and "
					+ "type='" + t + "' Order By ID desc ";
			con.result = con.usercommend.executeQuery(sql);
			while (con.result.next()) {
				String type = con.result.getString("type");
				if (type.equals(t)) {
					this.allnum++;
				}
			}
			System.out.println("allnum:" + allnum);

			sql = "select * from text where get_ID='" + ID + "'or get_ID='role_" + role + " 'or get_ID='0' and "
					+ "type='" + t + "' Order By ID desc ";
			con.result = con.usercommend.executeQuery(sql);
			while (con.result.next()) {
				String sent_ID = con.result.getString("sent_ID");
				sql = "select head_photo from user_data where ID='" + sent_ID + "'";
				con2.result = con2.usercommend.executeQuery(sql);
				con2.result.next();
				String head_photo = con2.result.getString("head_photo");
				sql = "select name from user_personal_data where ID='" + sent_ID + "'";
				con2.result = con2.usercommend.executeQuery(sql);
				con2.result.next();
				sent_ID = con2.result.getString("name");
				String get_ID = con.result.getString("get_ID");
				String tittle = con.result.getString("tittle");
				String content = con.result.getString("content");
				String send_time = con.result.getString("send_time");
				String type = con.result.getString("type");
				if (type.equals(t)) {
					official = official + head_photo + "鰶" + sent_ID + "鰶" + get_ID + "鰶" + tittle + "鰶" + content + "鰶"
							+ send_time + "鰶" + type + "鰶";

				}
				// System.out.println("循环成功");

			}
			System.out.println("---------------------------------------"+official);
			if ("".equals(official)) {
				official = null;
			}
			System.out.println("成功");
		} catch (SQLException e) {
			e.printStackTrace();
			// TODO: handle exception
		} catch (Exception e) {
			e.printStackTrace();
		}
		return official;
	}

}
