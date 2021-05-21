package bean;

import java.sql.SQLException;
import java.util.StringTokenizer;

import dao.MySQL_connect;

public class count_rank {
	// ����ѧ�� ��������
	// ���������Ľ���� ���� ID ����
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
			rankdata = rankdata + head.ID + "��";
			rankdata = rankdata + head.name + "��";
			rankdata = rankdata + head.point + "��";
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

	public ranknode sort_point(ranknode head) {// ������ݻ���������
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

	public ranknode addalldata() {// ��ȡ�����û��Ļ�����ϢID ���� ���Ҵ洢����������
		ranknode head = new ranknode();
		ranknode node = null;
		StringTokenizer chart = new StringTokenizer(getalluser(), "��");
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
				// System.out.println("���" + node.num);
				// System.out.println("ע��name:" + node.name);
				// System.out.println("ע��ID:" + node.ID);
				// System.out.println("ע��point:" + node.point);
				head = head.addbody(head, node);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return head;
	}

	public String getalluser() {// ��ȡ�����û���ID
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
					users = users + reID + "��";
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return users;
	}

	public int getpoint(String ID) {// ��ȡָ��ID�û��Ļ���
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
			// ����ǩ���Ļ���======================================
			sql = "select * from calendar where ID='" + ID + "'";
			this.con.result = this.con.usercommend.executeQuery(sql);
			while (this.con.result.next()) {
				point = point + 5;
			}
			// System.out.println("�û�����Ϊ:" + point);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return point;
	}

	public int getmissionpoint(int missionID) {// ��ȡָ������ID�Ļ���
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
