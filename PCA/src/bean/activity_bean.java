package bean;

import java.sql.SQLException;

import dao.MySQL_connect;

public class activity_bean {
	public String ID = null; // 用户的ID
	public MySQL_connect con = new MySQL_connect(); // 数据库的连接对象 自动连接
	public String nickiname; // 用户昵称
	public String sign; // 用户签名
	public int level; // 用户等级
	public String headphoto; // 用户头像
	public String background; // 用户背景
	public String role;

	// public static void main(String[] args) { //测试用主函数
	// Homepage_bean bean = new Homepage_bean("000"); //手动添加ID
	// }

	public activity_bean(String ID) { // 传递用户ID 并且改写当前类的public ID
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
			con.result = con.usercommend.executeQuery(sql); // 获取目标用户的头部模块信息
			con.result.next();
			this.nickiname = con.result.getString("nickiname"); // 昵称
			this.sign = con.result.getString("sign"); // 签名
			this.headphoto = con.result.getString("head_photo"); // 头像
			this.background = con.result.getString("background"); // 背景
			this.level = con.result.getInt("experience"); // 经验
			count_level count = new count_level(); // 用于根据用户的经验 计算出用户的等级的对象
			this.level = count.count(this.level); // 计算等级
			// System.out.println("<----homepage_bean.java---->");
			// System.out.println("nickiname:" + this.nickiname);
			// System.out.println("sign:" + this.sign);
			// System.out.println("level:" + this.level);
			// System.out.println("headphoto:" + this.headphoto);
			// System.out.println("background" + this.background);
			// System.out.println("<-------------------------->");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
