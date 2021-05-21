package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.StringTokenizer;

import bean.Handle_date;

public class Admin_tools {
	public MySQL_connect con = new MySQL_connect();
	Handle_date date = new Handle_date();
	public String ID = "";
	public String missions = "";// checkmission������Ϣ
	public int showmission = 0;
	public int allmission = 0;
	public String missioninf = "";
	public String missionfinishcontent = "";

	// д��ʹ����ID
	public Admin_tools(String ID) {
		this.ID = ID;
	}

	// ������������
	// public static void main(String[] args) {
	// Admin_tools tools = new Admin_tools("000");
	// tools.getPCAdate();
	// }

	// �ύ������ҵ
	public void subcharge(String missionID, String pageID, String content, String point) {
		String finisherID = "";
		String sql = "";
		try {
			sql = "select finisherID from mission_finish where ID='" + pageID + "'";
			this.con.result = this.con.usercommend.executeQuery(sql);
			this.con.result.next();
			finisherID = this.con.result.getString("finisherID");
			String setpoint;
			if (point.equals("1")) {
				setpoint = "A+";
			} else if (point.equals("2")) {
				setpoint = "A";
			} else if (point.equals("3")) {
				setpoint = "B";
			} else {
				setpoint = "C";
			}
			sql = "update mission_finish set chargerID='" + this.ID + "' where ID='" + pageID + "'";
			this.con.usercommend.executeUpdate(sql);
			sql = "update mission_finish set mission_note='" + content + "' where ID='" + pageID + "'";
			this.con.usercommend.executeUpdate(sql);
			sql = "update mission_finish set point='" + setpoint + "' where ID='" + pageID + "'";
			this.con.usercommend.executeUpdate(sql);
			sql = "select finisherID from mission_finish where ID='" + pageID + "'";
			this.con.result = this.con.usercommend.executeQuery(sql);
			this.con.result.next();
			String finishID=this.con.result.getString("finisherID");
			// ��������������
			sql = "select ID from text";
			this.con.result = this.con.usercommend.executeQuery(sql);
			int num = 1;
			while (this.con.result.next()) {
				num++;
			}
			String missionname = "";
			sql = "select tittle from mission where missionID='" + missionID + "'";
			this.con.result = this.con.usercommend.executeQuery(sql);
			this.con.result.next();
			missionname = this.con.result.getString("tittle");
			sql = "select name from user_personal_data where ID='" + this.ID + "'";
			this.con.result = this.con.usercommend.executeQuery(sql);
			this.con.result.next();
			String charger = this.con.result.getString("name");
			sql = "insert into text value ('" + num + "','1','"+finishID+"','" + missionname + "����������','�����Ա���������ύ�ġ�"
					+ missionname + "��������ע����ա������:" + charger + "��','" + this.date.getDate() + "','0')";
			this.con.usercommend.executeUpdate(sql);
			add_web_journal add_journal = new add_web_journal(this.ID);
			add_journal.oneelse(finisherID, "�������û��ύ����������ID��" + missionID + ",�����ύ��ţ�" + pageID + "");
			// ======================================================
			sql = "select * from user_mission where U_" + finisherID + " like '" + missionID + "_%'";
			this.con.result = this.con.usercommend.executeQuery(sql);
			if (this.con.result.next()) {
				System.out.println(sql);
				System.out.println("aaa���");
				// �Ѿ���ɹ������
				System.out.println(this.con.result.getString("U_" + ID + ""));
				StringTokenizer chart = new StringTokenizer(this.con.result.getString("U_" + ID + ""), "_");
				chart.nextToken();
				String oldpoint = chart.nextToken();
				String oldpoint2 = oldpoint;
				if (oldpoint.equals("A+")) {
					oldpoint = "1";
				} else if (oldpoint.equals("A")) {
					oldpoint = "2";
				} else if (oldpoint.equals("B")) {
					oldpoint = "3";
				} else {
					oldpoint = "4";
				}
				System.out.println("point:" + point);
				if (Integer.parseInt(point) < Integer.parseInt(oldpoint)) {
					if (point.equals("1")) {
						point = missionID + "_A+";
					} else if (point.equals("2")) {
						point = missionID + "_A";
					} else if (point.equals("3")) {
						point = missionID + "_B";
					} else {
						point = missionID + "_C";
					}
					sql = "update user_mission set U_" + ID + "='" + point + "' where U_" + ID + "='" + missionID + "_"
							+ oldpoint2 + "'";
					System.out.println(sql);
					this.con.usercommend.executeUpdate(sql);
				}

			} else {
				if (point.equals("1")) {
					point = missionID + "_A+";
				} else if (point.equals("2")) {
					point = missionID + "_A";
				} else if (point.equals("3")) {
					point = missionID + "_B";
				} else {
					point = missionID + "_C";
				}
				System.out.println("else");
				sql = "select * from user_mission";
				this.con.result = this.con.usercommend.executeQuery(sql);
				num = 0;
				while (this.con.result.next()) {
					if (this.con.result.getString("U_" + finisherID + "") != null
							&& !"".equals(this.con.result.getString("U_" + finisherID + ""))) {
						num++;
					}
				}
				num++;
				sql = "update user_mission set U_" + finisherID + "='" + point + "' where ID ='" + num + "'";

				System.out.println(sql);
				this.con.usercommend.executeUpdate(sql);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// ��ȡ������Ϣ
	public void getmissioninf(String missionID, String pageID) {
		String sql = "select content from mission where missionID='" + missionID + "'";
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);
			this.con.result.next();
			this.missioninf = this.con.result.getString("content");
			sql = "select content from mission_finish where ID='" + pageID + "'";
			this.con.result = this.con.usercommend.executeQuery(sql);
			this.con.result.next();
			this.missionfinishcontent = this.con.result.getString("content");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// ��ȡ����������������ɵ�ҳ��
	public int getallpages() {
		int allpages = 0;
		String sql = "select * from mission_finish ";
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);
			float num = 0;
			while (this.con.result.next()) {
				num++;
			}
			System.out.println(num);
			this.allmission = (int) num;
			num = num / 15;
			System.out.println(num);
			allpages = (int) num;
			if (num % 1 > 0) {
				allpages = allpages + 1;
			}
			System.out.println(allpages);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return allpages;
	}

	// ��ȡָ��ҳ��������ĵ�����
	public void getcheck_mission(int page) {
		MySQL_connect con1 = new MySQL_connect();
		ResultSet rs1 = null;
		this.showmission = this.allmission - ((page - 1) * 15);
		if (this.showmission > 15) {
			this.showmission = 15;
		}
		System.out.println("showmission:" + this.showmission);
		String missionID = "";
		String pageID = "";
		String finisherID = "";
		String update_time = "";
		String name = "";
		String tittle = "";
		String language = "";
		String charge = "";
		String type = "";
		String difficult = "";
		String sql = "select * from mission_finish  limit " + ((page - 1) * 15) + ",15";
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);
			while (this.con.result.next()) {
				update_time = this.con.result.getString("update_time");
				missionID = this.con.result.getString("missionID");
				pageID = this.con.result.getString("ID");
				finisherID = this.con.result.getString("finisherID");
				sql = "select name from user_personal_data where ID = '" + finisherID + "'";
				rs1 = con1.usercommend.executeQuery(sql);
				rs1.next();
				name = rs1.getString("name");
				sql = "select tittle,language,type,mission_difficult from mission where missionID = '" + missionID
						+ "'";
				rs1 = con1.usercommend.executeQuery(sql);
				rs1.next();
				tittle = rs1.getString("tittle");
				language = rs1.getString("language");
				difficult = rs1.getString("mission_difficult");
				type = rs1.getString("type");
				sql = "select language from mission_language where ID = '" + language + "'";
				rs1 = con1.usercommend.executeQuery(sql);
				rs1.next();
				language = rs1.getString("language");
				// ��ѯ״̬================
				sql = "select * from user_mission where U_" + finisherID + " like '" + missionID + "_%'";
				rs1 = con1.usercommend.executeQuery(sql);
				if (rs1.next()) {
					charge = "�����";
				} else {
					charge = "δ���";
				}
				// ========================
				sql = "select type from mission_type where ID = '" + type + "'";
				rs1 = con1.usercommend.executeQuery(sql);
				rs1.next();
				type = rs1.getString("type");
				this.missions = this.missions + difficult + "��";
				this.missions = this.missions + pageID + "��";
				this.missions = this.missions + missionID + "��";
				this.missions = this.missions + update_time + "��";
				this.missions = this.missions + tittle + "��";
				this.missions = this.missions + name + "��";
				this.missions = this.missions + language + "��";
				this.missions = this.missions + charge + "��";
				this.missions = this.missions + type + "��";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// ����ͨ��
	public void send_notice(String tittle, String content) {
		int ID2 = 0;
		String sql = "select ID from notice";
		try {
			this.con.result = con.usercommend.executeQuery(sql);
			while (this.con.result.next()) {
				ID2 = con.result.getInt("ID");
			}
			System.out.println(ID2);
			sql = "insert into notice value('" + (ID2 + 1) + "','" + ID + "','" + tittle + "','" + content + "','"
					+ date.getDate() + "')";
			con.usercommend.executeUpdate(sql);
			add_web_journal add_journal = new add_web_journal(this.ID);
			add_journal.noothers("�����˹��棬����IDΪ��" + (ID2 + 1) + "");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// ��������
	public void send_mission(String tittle, String content, String type, String difficult, String language,
			String point, String end_date, String newlanguage, String newtype) {
		String sql = "";
		if (newlanguage != null && !"".equals(newlanguage)) {
			sql = "select * from mission_language where language ='" + newlanguage + "'";
			try {
				this.con.result = this.con.usercommend.executeQuery(sql);
				if (this.con.result.next()) {
					language = this.con.result.getString("ID");
				} else {
					sql = "select * from mission_language ";
					this.con.result = this.con.usercommend.executeQuery(sql);
					while (con.result.next()) {
						language = con.result.getString("ID");
					}
					language = (Integer.parseInt(language) + 1) + "";
					sql = "insert into mission_language value ('" + language + "','" + newlanguage + "')";
					this.con.usercommend.executeUpdate(sql);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (newtype != null && !"".equals(newtype)) {
			sql = "select * from mission_type where type ='" + newtype + "'";
			try {
				this.con.result = this.con.usercommend.executeQuery(sql);
				if (this.con.result.next()) {
					type = this.con.result.getString("ID");
				} else {
					sql = "select * from mission_type ";
					this.con.result = this.con.usercommend.executeQuery(sql);
					while (con.result.next()) {
						type = con.result.getString("ID");
					}
					type = (Integer.parseInt(type) + 1) + "";
					sql = "insert into mission_type value ('" + type + "','" + newtype + "')";
					this.con.usercommend.executeUpdate(sql);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		String missionID = "0";
		sql = "select missionID from mission";
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);
			while (this.con.result.next()) {
				missionID = this.con.result.getString("missionID");
			}
			missionID = (Integer.parseInt(missionID) + 1) + "";
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		sql = "insert into mission  value ('" + missionID + "','" + tittle + "','" + content + "','"
				+ this.date.getDate() + "','" + this.ID + "','" + end_date + "','" + language + "','" + type + "','"
				+ difficult + "','" + point + "')";
		System.out.println(sql);
		try {
			this.con.usercommend.executeUpdate(sql);
			sql = "select ID from text";
			this.con.result = this.con.usercommend.executeQuery(sql);
			int num = 1;
			while (this.con.result.next()) {
				num++;
			}
			String date = "";
			if (!"--".equals(end_date)) {
				date = "��ֹ����Ϊ" + end_date;
			} else {
				date = "ʱ�䲻��";
			}
			sql = "insert into text value ('" + num + "','" + this.ID + "','0','" + tittle + "�����ѷ���','" + tittle
					+ "�����ѷ������Ѷ�Ϊ" + difficult + "������߿ɻ�û���" + point + date + "��','" + this.date.getDate() + "','0')";
			add_web_journal add_journal = new add_web_journal(this.ID);
			add_journal.noothers("��������ҵ��"+tittle+",��ҵIDΪ:" + num + "");
			this.con.usercommend.executeUpdate(sql);
			sql = "select ID from user_mission";
			this.con.result = this.con.usercommend.executeQuery(sql);
			num = 1;
			while (this.con.result.next()) {
				num++;
			}

			sql = "insert into user_mission (ID) value (" + num + ")";
			this.con.usercommend.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
