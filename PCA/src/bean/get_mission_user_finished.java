package bean;

import java.sql.SQLException;

import dao.MySQL_connect;

public class get_mission_user_finished {
	public MySQL_connect con = new MySQL_connect();
	public MySQL_connect con2 = new MySQL_connect();
	public String alldate = "";// ����
	public String missioninf = "";// ���˱��� �������� �������� ��ֹ���� �������� ��������
	public String finishedinf = "";// ���� ���� �������
	public String allfinish = "";// ȫ���������
	public int allpagenum = 0; // ��ҳ��
	public String nowdate = null;

	public static void main(String[] args) {
		get_mission_user_finished user = new get_mission_user_finished();
		user.getmissioninf("3", "000", "2021-02-08 12:07:59", "2");
	}

	public void getmissioninf(String missionID, String ID, String date, String nowpage) {
		if (nowpage == null || nowpage.equals("")) {
			nowpage = "1";
		}
System.out.println("��ѯ������:"+date);
		// ��ȡ����������ɵ�����
		String sql = "select * from mission_finish where missionID='" + missionID + "'and finisherID='" + ID + "'";
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);
			String nulldate = null;
			int num = 0;
			// �ѽ����ָ���ƽ�������ҳ�������
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
			// ��ȡ���������Ϣ
			sql = "select * from mission_finish where timestamp(update_time) = '" + date + "'  ";
			this.con.result = this.con.usercommend.executeQuery(sql);
			while (this.con.result.next()) {
				this.finishedinf = this.finishedinf + this.con.result.getString("mission_note") + "���^�P";
				if (this.con.result.getString("point") == null || "".equals(this.con.result.getString("point"))) {
					this.finishedinf = this.finishedinf + "���ϸ�" + "���^�P";
				} else {
					this.finishedinf = this.finishedinf + this.con.result.getString("point") + "���^�P";
				}
				this.finishedinf = this.finishedinf + this.con.result.getString("content") + "���^�P";
			}
//			System.out.println("finisherinf:" + this.finishedinf);

			// ��ȡ������Ϣ
			sql = "select * from mission where missionID= '" + missionID + "' ";
			this.con.result = this.con.usercommend.executeQuery(sql);
			while (this.con.result.next()) {
				this.missioninf = this.missioninf + this.con.result.getString("tittle") + "���^�P";
				this.missioninf = this.missioninf + this.con.result.getString("content") + "���^�P";
				this.missioninf = this.missioninf + this.con.result.getString("publish_date") + "���^�P";
				this.missioninf = this.missioninf + this.con.result.getString("end_date") + "���^�P";

				this.con2.result = this.con2.usercommend.executeQuery(
						"select type from mission_type where ID='" + this.con.result.getString("type") + "'");
				this.con2.result.next();
				this.missioninf = this.missioninf + con2.result.getString("type") + "���^�P";
				con2.result = con2.usercommend.executeQuery("select language from mission_language where ID='"
						+ this.con.result.getString("language") + "'");
				con2.result.next();
				this.missioninf = this.missioninf + con2.result.getString("language") + "���^�P";
			}
//			System.out.println("missioninf:" + this.missioninf);
			this.con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
