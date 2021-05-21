package bean;

import java.sql.SQLException;

import dao.MySQL_connect;

public class get_mission_user_finished {
	public MySQL_connect con = new MySQL_connect();
	public MySQL_connect con2 = new MySQL_connect();
	public String alldate = "";// 日期
	public String missioninf = "";// 考核标题 考核详情 发布日期 截止日期 考核类型 语言类型
	public String finishedinf = "";// 评价 评分 完成内容
	public String allfinish = "";// 全部完成人数
	public int allpagenum = 0; // 总页数
	public String nowdate = null;

	public static void main(String[] args) {
		get_mission_user_finished user = new get_mission_user_finished();
		user.getmissioninf("3", "000", "2021-02-08 12:07:59", "2");
	}

	public void getmissioninf(String missionID, String ID, String date, String nowpage) {
		if (nowpage == null || nowpage.equals("")) {
			nowpage = "1";
		}
System.out.println("查询的日期:"+date);
		// 获取所有往期完成的日期
		String sql = "select * from mission_finish where missionID='" + missionID + "'and finisherID='" + ID + "'";
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);
			String nulldate = null;
			int num = 0;
			// 把结果集指针推进到需求页面的数据
			for (int a = 1; a < Integer.parseInt(nowpage); a++) {
				for (int b = 0; b < 12; b++) {
					con.result.next();
				}
			}
			while (con.result.next()) {
				num++;
				if (num == 13) {
					break;
				}
				this.alldate = this.alldate + this.con.result.getString("update_time") + "@";
				if (num == 1) {
					nulldate = this.con.result.getString("update_time");
				}
			}
			System.out.println("num:" + num);
			float num2 = num / 12;
			this.allpagenum = (int) num2 + Integer.parseInt(nowpage);
//			System.out.println("allpages:" + this.allpagenum);
//
//			System.out.println("date:" + this.alldate);
			if (date == null) {
				date = nulldate;
			}
			System.out.println("searchdate:" + date);
			this.nowdate = date;
			// 获取任务完成信息
			sql = "select * from mission_finish where timestamp(update_time) = '" + date + "'  ";
			this.con.result = this.con.usercommend.executeQuery(sql);
			while (this.con.result.next()) {
				this.finishedinf = this.finishedinf + this.con.result.getString("mission_note") + "晸郶蔖";
				if (this.con.result.getString("point") == null || "".equals(this.con.result.getString("point"))) {
					this.finishedinf = this.finishedinf + "不合格" + "晸郶蔖";
				} else {
					this.finishedinf = this.finishedinf + this.con.result.getString("point") + "晸郶蔖";
				}
				this.finishedinf = this.finishedinf + this.con.result.getString("content") + "晸郶蔖";
			}
//			System.out.println("finisherinf:" + this.finishedinf);

			// 获取任务信息
			sql = "select * from mission where missionID= '" + missionID + "' ";
			this.con.result = this.con.usercommend.executeQuery(sql);
			while (this.con.result.next()) {
				this.missioninf = this.missioninf + this.con.result.getString("tittle") + "晸郶蔖";
				this.missioninf = this.missioninf + this.con.result.getString("content") + "晸郶蔖";
				this.missioninf = this.missioninf + this.con.result.getString("publish_date") + "晸郶蔖";
				this.missioninf = this.missioninf + this.con.result.getString("end_date") + "晸郶蔖";

				this.con2.result = this.con2.usercommend.executeQuery(
						"select type from mission_type where ID='" + this.con.result.getString("type") + "'");
				this.con2.result.next();
				this.missioninf = this.missioninf + con2.result.getString("type") + "晸郶蔖";
				con2.result = con2.usercommend.executeQuery("select language from mission_language where ID='"
						+ this.con.result.getString("language") + "'");
				con2.result.next();
				this.missioninf = this.missioninf + con2.result.getString("language") + "晸郶蔖";
			}
//			System.out.println("missioninf:" + this.missioninf);
			this.con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
