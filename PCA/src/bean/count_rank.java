package bean;

import java.sql.SQLException;
import java.util.StringTokenizer;

import dao.MySQL_connect;

public class count_rank {
	// 输入学号 返回排名
	// 返回排序后的结果集 姓名 ID 积分
	public MySQL_connect con = new MySQL_connect();
	public ranknode node = new ranknode();

	public String getrank() {
		count_rank rank = new count_rank();
		ranknode head = new ranknode();
		head = rank.addalldata();
		head = rank.sort_point(head);
		this.node = head;
		String rankdata = "";
		while (head != null) {
			rankdata = rankdata + head.ID + "鰶";
			rankdata = rankdata + head.name + "鰶";
			rankdata = rankdata + head.point + "鰶";
			head = head.next;
		}
		// System.out.println(rankdata);
		return rankdata;

	}

	public int userrank(String ID) {
		int a = this.node.userrank(ID, node);
		System.out.println("==========================================" + a);
		return a;
	}

	public ranknode sort_point(ranknode head) {// 链表根据积分来排序
		ranknode sortnode = new ranknode();
		ranknode exhead = new ranknode();
		exhead = head;
		int num = head.getcount(head);
		String bridgename = "";
		String bridgeID = "";
		int bridgepoint = 0;
		for (int a = 0; a < num; a++) {
			sortnode = exhead;
			for (int b = 0; b < num; b++) {
				if (sortnode.point < sortnode.next.point) {
					bridgeID = sortnode.ID;
					bridgename = sortnode.name;
					bridgepoint = sortnode.point;
					sortnode.ID = sortnode.next.ID;
					sortnode.name = sortnode.next.name;
					sortnode.point = sortnode.next.point;
					sortnode.next.ID = bridgeID;
					sortnode.next.name = bridgename;
					sortnode.next.point = bridgepoint;

				}
				sortnode = sortnode.next;
			}
		}
		return head;
	}

	public ranknode addalldata() {// 获取所有用户的积分信息ID 姓名 并且存储到链表里面
		ranknode head = new ranknode();
		ranknode node = null;
		StringTokenizer chart = new StringTokenizer(getalluser(), "鰶");
		int num = chart.countTokens();
		for (int a = 0; a < num; a++) {
			node = new ranknode();
			String ID = chart.nextToken();
			String sql = "select name from user_personal_data where ID='" + ID + "'";
			try {
				this.con.result = this.con.usercommend.executeQuery(sql);
				this.con.result.next();

				node.name = this.con.result.getString("name");
				node.ID = ID;
				node.point = getpoint(ID);
				// System.out.println("编号" + node.num);
				// System.out.println("注入name:" + node.name);
				// System.out.println("注入ID:" + node.ID);
				// System.out.println("注入point:" + node.point);
				head = head.addbody(head, node);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return head;
	}

	public String getalluser() {// 获取所有用户的ID
		String users = "";
		String reID ="";
		getpower power =null;
		String sql = "Select ID from users_login";
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);
			while (this.con.result.next()) {
				reID = this.con.result.getString("ID");
				power = new getpower(reID);
				if (power.checkpower("22")) {
					users = users + reID + "鰶";
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return users;
	}

	public int getpoint(String ID) {// 获取指定ID用户的积分
		int point = 0;
		String missiondate = "";
		String sql = "select U_" + ID + " from user_mission";
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);
			while (this.con.result.next()) {

				if (this.con.result.getString("U_" + ID + "") != null
						&& !this.con.result.getString("U_" + ID + "").equals("")) {
					missiondate = missiondate + this.con.result.getString("U_" + ID + "") + "_";
				}
			}
			// System.out.println(missiondate);
			StringTokenizer chart = new StringTokenizer(missiondate, "_");
			int num = chart.countTokens() / 2;

			for (int a = 0; a < num; a++) {
				int missionpoint = getmissionpoint(Integer.parseInt(chart.nextToken()));
				String userpoint = chart.nextToken();
				if (userpoint.equals("A")) {
					missionpoint = (int) (missionpoint * 0.8);
				} else if (userpoint.equals("B")) {
					missionpoint = (int) (missionpoint * 0.6);
				} else if (userpoint.equals("C")) {
					missionpoint = (int) (missionpoint * 0.5);
				}
				point = point + missionpoint;
			}
			// 计算签到的积分======================================
			sql = "select * from calendar where ID='" + ID + "'";
			this.con.result = this.con.usercommend.executeQuery(sql);
			while (this.con.result.next()) {
				point = point + 5;
			}
			// System.out.println("用户积分为:" + point);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return point;
	}

	public int getmissionpoint(int missionID) {// 获取指定任务ID的积分
		int mission_point = 0;
		String sql = "select mission_point from mission where missionID='" + missionID + "'";
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);
			this.con.result.next();
			mission_point = this.con.result.getInt("mission_point");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mission_point;
	}
}
