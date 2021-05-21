package bean;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.StringTokenizer;

import dao.MySQL_connect;

public class Assignment_bean {
	public String ID = null;// 用户ID
	public MySQL_connect con = new MySQL_connect();
	public MySQL_connect con2 = new MySQL_connect();
	public MySQL_connect con3 = new MySQL_connect();
	public String nickiname;// 用户昵称
	public String sign;// 用户签名
	public int level;// 用户等级
	public String headphoto;// 用户头像
	public String background;// 用户背景图片
	public String role = null;// 用户角色
	public String missiondate = "";// 任务信息已完成未完成共用
	public String type = "";// 获取用于筛选的任务类型
	public String language = "";// 获取用于筛选的任务语言

	public static void main(String[] args) {
		Assignment_bean bean = new Assignment_bean("000");

		bean.getselections();

	}

	public Assignment_bean(String ID) {
		this.ID = ID;
		String sql = "select role from users_login where ID='" + this.ID + "'";
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);
			this.con.result.next();
			this.role = this.con.result.getString("role");
			// System.out.println(role);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void getselections() {
		String sql = "select * from mission_type";
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);
			while (this.con.result.next()) {
				this.type = this.type + this.con.result.getString("ID") + "_";
				this.type = this.type + this.con.result.getString("type") + "_";
			}
			sql = "select * from mission_language";
			this.con.result = this.con.usercommend.executeQuery(sql);
			while (this.con.result.next()) {
				this.language = this.language + this.con.result.getString("ID") + "_";
				this.language = this.language + this.con.result.getString("language") + "_";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// System.out.println(this.type);
		// System.out.println(this.language);

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

	public void get_allmission(String language, String type, String dif) {
		if (language == null || language.equals("") || language.equals("null")) {
			language = "%";
		}
		if (type == null || type.equals("") || type.equals("null")) {
			type = "%";
		}
		if (dif == null || dif.equals("") || dif.equals("null")) {
			dif = "%";
		}
		String sql = "select * from mission where language like'" + language + "' and type like'" + type
				+ "' and mission_difficult like'" + dif + "'  order by missionID desc";
		System.out.println(sql);
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);
			while (this.con.result.next()) {

				this.missiondate = this.missiondate + con.result.getString("publish_date") + "鰶";
				this.missiondate = this.missiondate + con.result.getString("end_date") + "鰶";
				con3.result = con3.usercommend.executeQuery(
						"select language from mission_language where ID='" + con.result.getString("language") + "'");
				con3.result.next();
				this.missiondate = this.missiondate + con3.result.getString("language") + "鰶";
				this.missiondate = this.missiondate + con.result.getString("missionID") + "鰶";
				con2.result = con2.usercommend.executeQuery("select U_" + this.ID + " from user_mission where U_"
						+ this.ID + " like '" + con.result.getString("missionID") + "_%'");
				if (con2.result.next()) {
					this.missiondate = this.missiondate + "完成" + "鰶";

				} else {
					con2.result = con2.usercommend.executeQuery("select * from mission_finish where finisherID='"
							+ this.ID + "' and missionID='" + con.result.getString("missionID") + "' ");
					if (con2.result.next()) {
						this.missiondate = this.missiondate + "审核" + "鰶";

					} else {
						this.missiondate = this.missiondate + "未完成" + "鰶";

					}
				}

				this.missiondate = this.missiondate + con.result.getString("tittle") + "鰶";
				this.missiondate = this.missiondate + con.result.getString("mission_difficult") + "鰶";
				con2.result = con2.usercommend
						.executeQuery("select type from mission_type where ID='" + con.result.getString("type") + "'");
				con2.result.next();
				this.missiondate = this.missiondate + con2.result.getString("type") + "欛";

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public ArrayList<String> gettype() {
		String sql = "select type from mission_type";
		ArrayList<String> result = new ArrayList<>();
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);
			while (this.con.result.next()) {
				result.add(this.con.result.getString("type"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}

	public ArrayList<String> getlanguage() {
		String sql = "select language from mission_language";
		ArrayList<String> result = new ArrayList<>();
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);
			while (this.con.result.next()) {
				result.add(this.con.result.getString("language"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}

	public void getfinished(String language, String type, String dif) {

		ResultSet res2 = null;
		String sql = "select U_" + this.ID + " from user_mission";

		try {

			this.con.result = this.con.usercommend.executeQuery(sql);
			while (this.con.result.next()) {
				if (con.result.getString("U_" + this.ID + "") != null
						&& !"".equals(con.result.getString("U_" + this.ID + ""))) {
					StringTokenizer chart = new StringTokenizer(con.result.getString("U_" + this.ID + ""), "_");

					String sql2 = "select * from mission where missionID = '" + chart.nextToken() + "'";

					res2 = con2.usercommend.executeQuery(sql2);
					res2.next();
					this.missiondate = this.missiondate + res2.getString("publish_date") + "[";
					this.missiondate = this.missiondate + res2.getString("end_date") + "[";
					con3.result = con3.usercommend.executeQuery(
							"select language from mission_language where ID='" + res2.getString("language") + "'");
					con3.result.next();
					this.missiondate = this.missiondate + con3.result.getString("language") + "[";
					this.missiondate = this.missiondate + res2.getString("missionID") + "[";
					this.missiondate = this.missiondate + res2.getString("tittle") + "[";
					this.missiondate = this.missiondate + chart.nextToken() + "[";
					this.missiondate = this.missiondate + res2.getString("mission_point") + "]";
				}
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}
	}

}
