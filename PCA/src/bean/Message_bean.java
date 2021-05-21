package bean;

import java.sql.SQLException;

import dao.MySQL_connect;

public class Message_bean {
	public String ID = null;
	MySQL_connect con = new MySQL_connect();
	public String nickiname;
	public String sign;
	public int level;
	public String headphoto;
	public String background;
	public String role=null;
	public Message_bean(String ID) {
		this.ID = ID;
		String sql = "select role from users_login where ID='" + this.ID + "'";
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);
			this.con.result.next();
			this.role = this.con.result.getString("role");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void head() {
		String sql = "select * from user_data where ID='" + this.ID + "'";
		try {
			con.result = con.usercommend.executeQuery(sql);
			con.result.next();
			this.nickiname = con.result.getString("nickiname");
			this.sign = con.result.getString("sign");
			this.headphoto = con.result.getString("head_photo");
			this.background = con.result.getString("background");
			this.level = con.result.getInt("experience");
			count_level count = new count_level();
			this.level = count.count(this.level);
			System.out.println("<----homepage_bean.java---->");
			System.out.println("nickiname:" + this.nickiname);
			System.out.println("sign:" + this.sign);
			System.out.println("level:" + this.level);
			System.out.println("headphoto:" + this.headphoto);
			System.out.println("background" + this.background);
			System.out.println("<-------------------------->");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
