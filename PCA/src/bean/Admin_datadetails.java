package bean;

import java.sql.SQLException;
import java.util.StringTokenizer;

import dao.MySQL_connect;

public class Admin_datadetails {
	public MySQL_connect con = new MySQL_connect();
	public String mission_language_data = "";
	public int missionsnum = 0;
	public String mission_type_data = "";

	public static void main(String[] args) {
		Admin_datadetails bean = new Admin_datadetails();
		bean.load_mission_data();
	}

	public void load_mission_data() {
		String missionlanguage_data = "";
		String missionlanguage = "";
		String sql = "select * from mission_language";
		int num = 0;
		int languagenum = 0;
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);
			while (this.con.result.next()) {
				languagenum++;
				missionlanguage = missionlanguage + this.con.result.getString("language") + "_";
			}
			// System.out.println(missionlanguage);
			// System.out.println(languagenum);
			StringTokenizer chart = new StringTokenizer(missionlanguage, "_");
			int allmission = 0;
			for (int a = 1; a <= languagenum; a++) {
				sql = "select * from mission where language='" + a + "'";
				this.con.result = this.con.usercommend.executeQuery(sql);
				num = 0;
				while (this.con.result.next()) {
					num++;
					allmission++;
				}
				missionlanguage_data = missionlanguage_data + chart.nextToken() + "_" + num + "_";
				this.mission_language_data = missionlanguage_data;
			}
			// System.out.println(missionlanguage_data);
			this.missionsnum = allmission;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String missiontype_data = "";
		String missiontype = "";
		sql = "select * from mission_type";
		num = 0;
		int typenum = 0;
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);
			while (this.con.result.next()) {
				typenum++;
				missiontype = missiontype + this.con.result.getString("type") + "_";
			}
			// System.out.println(missiontype);
			// System.out.println(typenum);
			StringTokenizer chart = new StringTokenizer(missiontype, "_");
			int allmission = 0;
			for (int a = 1; a <= typenum; a++) {
				sql = "select * from mission where type='" + a + "'";
				this.con.result = this.con.usercommend.executeQuery(sql);
				num = 0;
				while (this.con.result.next()) {
					num++;
				}
				missiontype_data = missiontype_data + chart.nextToken() + "_" + num + "_";
				this.mission_type_data = missiontype_data;
			}
			// System.out.println(missiontype_data);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public String getPCAstudata() {
		// 1 活动部 2宣传部 3外联部 4技术部 5运营部 6财务部
		int usernum = 0;// 总注册人数
		int signnum = 0;// 当天签到总人数
		int submissionnum = 0;// 当天提交任务人数
		int activitynum = 0;// 活动部
		int publicitynum = 0;// 宣传部
		int connectnum = 0;// 外联部
		int operationnum = 0;// 运营部
		int moneynum = 0;// 财务部
		String data = "";// 数据汇总
		String sql = "select ID from users_login";
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);
			while (this.con.result.next()) {
				usernum++;
			}
			Handle_date date = new Handle_date();
			sql = "select ID from calendar where signin_time='" + date.getDate() + "'";
			this.con.result = this.con.usercommend.executeQuery(sql);
			while (this.con.result.next()) {
				signnum++;
			}
			sql = "select ID from mission_finish where update_time like'" + date.getDate() + "%'";
			this.con.result = this.con.usercommend.executeQuery(sql);
			while (this.con.result.next()) {
				submissionnum++;
			}
			sql = "select ID from user_personal_data where apartment='1'";
			this.con.result = this.con.usercommend.executeQuery(sql);
			while (this.con.result.next()) {
				activitynum++;
			}
			sql = "select ID from user_personal_data where apartment='2'";
			this.con.result = this.con.usercommend.executeQuery(sql);
			while (this.con.result.next()) {
				publicitynum++;
			}
			sql = "select ID from user_personal_data where apartment='3'";
			this.con.result = this.con.usercommend.executeQuery(sql);
			while (this.con.result.next()) {
				connectnum++;
			}
			sql = "select ID from user_personal_data where apartment='5'";
			this.con.result = this.con.usercommend.executeQuery(sql);
			while (this.con.result.next()) {
				operationnum++;
			}
			sql = "select ID from user_personal_data where apartment='6'";
			this.con.result = this.con.usercommend.executeQuery(sql);
			while (this.con.result.next()) {
				moneynum++;
			}

			data = usernum + "_" + signnum + "_" + submissionnum + "_" + activitynum + "_" + publicitynum + "_"
					+ connectnum + "_" + operationnum + "_" + moneynum;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return data;
	}
}
