package bean;

import java.sql.SQLException;

import dao.MySQL_connect;

public class activity_bean {
	public String ID = null; // �û���ID
	public MySQL_connect con = new MySQL_connect(); // ���ݿ�����Ӷ��� �Զ�����
	public String nickiname; // �û��ǳ�
	public String sign; // �û�ǩ��
	public int level; // �û��ȼ�
	public String headphoto; // �û�ͷ��
	public String background; // �û�����
	public String role;

	// public static void main(String[] args) { //������������
	// Homepage_bean bean = new Homepage_bean("000"); //�ֶ����ID
	// }

	public activity_bean(String ID) { // �����û�ID ���Ҹ�д��ǰ���public ID
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
			con.result = con.usercommend.executeQuery(sql); // ��ȡĿ���û���ͷ��ģ����Ϣ
			con.result.next();
			this.nickiname = con.result.getString("nickiname"); // �ǳ�
			this.sign = con.result.getString("sign"); // ǩ��
			this.headphoto = con.result.getString("head_photo"); // ͷ��
			this.background = con.result.getString("background"); // ����
			this.level = con.result.getInt("experience"); // ����
			count_level count = new count_level(); // ���ڸ����û��ľ��� ������û��ĵȼ��Ķ���
			this.level = count.count(this.level); // ����ȼ�
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
