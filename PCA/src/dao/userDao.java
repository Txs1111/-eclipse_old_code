package dao;

import java.sql.ResultSet;
import java.sql.SQLException;

public class userDao {
	String ID;
	String password;
	MySQL_connect con = new MySQL_connect();


	public userDao(String ID, String password) {
		this.ID = ID;
		this.password = password;
	}

	public int checkuser() {
		int result = 0;
		String sql = "select * from users_login where ID = '" + this.ID + "'";

		try {

			this.con.result = con.usercommend.executeQuery(sql);
			if (this.con.result.next()) {
				if (this.con.result.getString("password").equals(this.password)) {
					result = 1;// 登陆成功
					
					System.out.println("登陆成功");
					
				} else {
					result = 2;// 密码错误
					System.out.println("密码错误");
				}
			} else {
				result = 3;// 账号不存在
				System.out.println("账号不存在");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("连接失败");
			e.printStackTrace();
		}
		return result;

	}
}