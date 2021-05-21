package bean;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.StringTokenizer;

import dao.MySQL_connect;

public class Score_bean {
	public String ID = null;
	public MySQL_connect con = new MySQL_connect();
	public MySQL_connect con3 = new MySQL_connect();
	public String nickiname;
	public String sign;
	public int level;
	public String headphoto;
	public String background;
	public String finishs = "";// ��������r�e�����ѶȘ�r�e�������Ԙ�r�e����÷֘�r�e�����ύʱ���r�e��������
	public String allpage = null;
	public int num = 0;// �������������
	public String role = null;
	public String allmission = "";
	public int allfinish = 0;

	public int userrank() {
		count_rank rank = new count_rank();
		rank.getrank();
		return rank.userrank(this.ID);

	}

	public Score_bean(String ID) {
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
		head();

	}

	public static void main(String[] args) {
		Score_bean bean = new Score_bean("2019000101906");
		bean.getpoint();

	}

	/**
	 * �����û���ɵ��������� �ó�������� ����һ��int��
	 * 
	 * @return
	 */
	public int getpoint() {
		int point = 0;
		String missiondate = "";
		String sql = "select U_" + this.ID + " from user_mission";
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);
			while (this.con.result.next()) {

				if (this.con.result.getString("U_" + this.ID + "") != null
						&& !this.con.result.getString("U_" + this.ID + "").equals("")) {
					this.allfinish = this.allfinish + 1;
					missiondate = missiondate + this.con.result.getString("U_" + this.ID + "") + "_";
				}
			}
			//System.out.println(missiondate);
			StringTokenizer chart = new StringTokenizer(missiondate, "_");
			int num = chart.countTokens() / 2;

			for (int a = 0; a < num; a++) {
				int missionpoint = getmissionpoint(Integer.parseInt(chart.nextToken()));
				//System.out.println("++++++++++++++++++++++++++missiondate:"+missionpoint);
				String userpoint = chart.nextToken();

				if (userpoint.equals("A")) {
					missionpoint = (int) (missionpoint * 0.8);
				} else if (userpoint.equals("B")) {
					missionpoint = (int) (missionpoint * 0.6);
				} else if(userpoint.equals("C")){
					missionpoint = (int) (missionpoint * 0.5);
				}
				//System.out.println("missionpoint:"+missionpoint);
				point = point + missionpoint;
			}//����ǩ���Ļ���======================================
			sql="select * from calendar where ID='"+ID+"'";
			this.con.result=this.con.usercommend.executeQuery(sql);
			while(this.con.result.next()){
				point=point+5;
			}
			System.out.println("�û�����Ϊ:" + point);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return point;
	}

	public int getmissionpoint(int missionID) {
		int mission_point = 0;
		String sql = "select mission_point from mission where missionID='" + missionID + "'";
		try {
			this.con3.result = this.con3.usercommend.executeQuery(sql);
			this.con3.result.next();
			mission_point = this.con3.result.getInt("mission_point");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mission_point;
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

	public void getmission(String topage) {
		System.out.println("��ֵ��page:" + topage);
		if (topage == null) {
			topage = "1";
		}
		int page = Integer.parseInt(topage);

		System.out.println("�����page:" + page);
		StringTokenizer chart1 = null;
		StringTokenizer chart2 = null;
		String sql = "select U_" + this.ID + " from user_mission";
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);
			String U_mission = "";

			while (this.con.result.next()) {
				if (this.con.result.getString("U_" + this.ID + "") != null
						&& !"".equals(this.con.result.getString("U_" + this.ID + ""))
						&& !"null".equals(this.con.result.getString("U_" + this.ID + "")))
					U_mission = U_mission + this.con.result.getString("U_" + this.ID + "") + "/";
			}
			System.out.println(U_mission);
			chart1 = new StringTokenizer(U_mission, "/");
			int num = chart1.countTokens();
			int num2 = num;
			int pages = 0;
			System.out.println("===============================num:" + num2);
			for (;;) {
				num2 = num2 - 5;
				if (num2 == -5) {
					this.allpage = pages + "";
					break;
				} else if (num2 > -5 && num2 < 0) {
					pages = pages + 1;
					this.allpage = pages + "";
					break;
				} else if (num2 > 0) {
					pages = pages + 1;

				}

			}
			System.out.println("����ҳ:" + this.allpage);
			System.out.println(num);
			num = num - (page - 1) * 5;
			System.out.println("num:" + num);
			for (int a = 0; a < page - 1; a++) {
				for (int b = 0; b < 5; b++) {
					System.out.println("next:" + chart1.nextToken());
				}
			}

			if (num > 5) {
				num = 5;
			}
			int missionpoint = 0;
			for (int a = 0; a < num; a++) {
				System.out.println("���ɣ�" + num);
				chart2 = new StringTokenizer(chart1.nextToken(), "_");
				String missionID = chart2.nextToken();
				sql = "select * from mission where missionID='" + missionID + "'";
				this.con.result = this.con.usercommend.executeQuery(sql);
				if (this.con.result.next()) {
					this.finishs = this.finishs + missionID + "��";
					this.finishs = this.finishs + this.con.result.getString("tittle") + "��";
					this.finishs = this.finishs + this.con.result.getString("mission_difficult") + "��";
					con3.result = con3.usercommend.executeQuery("select language from mission_language where ID='"
							+ this.con.result.getString("language") + "'");
					con3.result.next();
					this.finishs = this.finishs + con3.result.getString("language") + "��";
					missionpoint = this.con.result.getInt("mission_point");
					sql = "select * from mission_finish where missionID='" + missionID + "' and finisherID='" + this.ID
							+ "' and point='" + chart2.nextToken() + "'";
					this.con.result = this.con.usercommend.executeQuery(sql);
					this.con.result.next();
					if (this.con.result.getString("point").equals("A")) {
						missionpoint = (int) (missionpoint * 0.8);
					} else if (this.con.result.getString("point").equals("B")) {
						missionpoint = (int) (missionpoint * 0.6);
					} else if (this.con.result.getString("point").equals("C")) {
						missionpoint = (int) (missionpoint * 0.5);
					}
					this.finishs = this.finishs + missionpoint + "��";
					this.finishs = this.finishs + this.con.result.getString("content") + "��";
					this.finishs = this.finishs + this.con.result.getString("update_time");
					if (a < num) {
						this.finishs = this.finishs + "�a";
					}
				} else {
					this.allpage = "0";
				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public String equally_points() {
		String sql = "select U_" + this.ID + " from user_mission";
		String temp = "";
		int i = 0;
		int all_points = 0;
		String equally_points = "B";
		try {
			con.result = con.usercommend.executeQuery(sql);
			if(con.result.next()){
			temp = con.result.getString("U_" + ID);
			}
			System.out.println("temp1:" + temp);
			if (temp != null && !temp.equals("")) {
				con.result.beforeFirst();
			} else {
				return "--";
			}
			while (con.result.next()) {

				temp = con.result.getString("U_" + ID);
				if (temp != null && !"".equals(temp)) {
					System.out.println("temp2:" + temp);
					if (temp.contains("A+")) {
						all_points = all_points + 10;// A+ 40��
					}
					if (temp.contains("A")) {
						all_points = all_points + 30;// A 30��
					}
					if (temp.contains("B")) {
						all_points = all_points + 20;// B 20��
					}
					if (temp.contains("C")) {
						all_points = all_points + 10;// C 10��
					}
					i++;
				}
			}
			int eq_points = all_points / i;// �ѷ���ƽ����һ��
			// System.out.println("------------�ۺ�����-----------------");
			// System.out.println(eq_points);
			if (eq_points >= 32 && eq_points <= 40) {
				equally_points = "A+";
			} // 32~40��ΪA+
			if (eq_points >= 22 && eq_points < 32) {
				equally_points = "A";
			} // 22~32��ΪA
			if (eq_points >= 14 && eq_points < 22) {
				equally_points = "B";
			} // 14~22��ΪB
			if (eq_points >= 8 && eq_points < 14) {
				equally_points = "C";
			} // 8~14��ΪC
				// System.out.println(equally_points);
				// System.out.println("-------------------------------------");
			return equally_points;
		} catch (SQLException e) {

			// TODO Auto-generated catch block
			e.printStackTrace();
			return "B";
		}
	}

	/**
	 * ��ȡ���ݿ��еĻ��ֺ�������������������û��ֽ������򣬽����еĽ�����ظ�һ��list
	 * 
	 * @return
	 */
	public ArrayList<Integer> get_score_card() {
		MySQL_connect con = new MySQL_connect();
		// System.out.println("Score_bean.javaID=" + this.ID);
		String sql = "select all_score,finished_assignment from score_card where ID='" + this.ID + "'";// ��ȡ���ݿ���ĳ�˵Ļ����������ҵ��
		// System.out.println("Score_bean.javasql=" + sql);
		String sql2 = "select all_score from score_card order by all_score asc";// ��ȡ���ݿ��е����л��֣���������
		ResultSet rs = null;// ��ȡ���ݿ���ĳ�˵Ļ����������ҵ��
		ResultSet rs2 = null;// ��ȡ���ݿ��е����л��֣���������
		int rank = 0;
		ArrayList<Integer> list = new ArrayList<>();
		try {
			rs = con.result = con.usercommend.executeQuery(sql);
			while (rs.next()) {
				list.add(rs.getInt("all_score"));
				list.add(rs.getInt("finished_assignment"));
				// System.out.println("Score_bean.java" + list.get(0));
				// System.out.println("Score_bean.java" + list.get(1));
			}
			rs2 = con.result = con.usercommend.executeQuery(sql2);
			while (rs2.next()) {
				if (rs2.getInt("all_score") < list.get(1)) {
					rank++;
				}
			}
			con.close();
			rs.close();
			rs2.close();
			list.add(rank);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			list.add(0);
			list.add(0);
			list.add(0);
			System.out.println("Score_bean.java��������ʧ��");
			e.printStackTrace();
		}
		// System.out.println("Score_bean.java" + list.get(0));
		// System.out.println("Score_bean.java" + list.get(1));
		// System.out.println("Score_bean.java" + list.get(2));
		return list;
	}
}
