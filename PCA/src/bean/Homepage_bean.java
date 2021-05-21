package bean;

import java.sql.SQLException;

import dao.MySQL_connect;

public class Homepage_bean {
	public String ID = null;				//�û���ID
	public MySQL_connect con=new MySQL_connect();			//���ݿ�����Ӷ��� �Զ�����
	public String nickiname;				//�û��ǳ�
	public String sign;						//�û�ǩ��
	public int level;						//�û��ȼ�	
	public String headphoto;				//�û�ͷ��	
	public String background;				//�û�����
	public String role;

//	public static void main(String[] args) {			//������������
//		Homepage_bean bean = new Homepage_bean("000");	//�ֶ����ID		
//	}

	public Homepage_bean(String ID){	//�����û�ID ���Ҹ�д��ǰ���public ID
		this.ID= ID;	
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

	// ǩ��ģ��---------------���ڲ�ѯ��ǰ�û�������ǩ������������-------------------------------------------------------------->
	public String singed_calendar() {
		String dates = "";						//���ص�ȫ�����ڶ���
		Handle_date date = new Handle_date();	//��ȡ��ǰ����
		String year = date.getyear();			//��ȡ��
		String month = date.getMonth();			//��ȡ��
		String sql = "select signin_time from calendar where ID='" + this.ID + "' and  signin_time like'" + year + "-"
				+ month + "%'";
		System.out.println("<----Homepage_bean.java---->");
		System.out.println(sql);
		System.out.println("<-------------------------->");
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);//��ѯ���е�����
			//�����е�����ƴ��Ϊһ��String�ַ��� �ָ���Ϊ" _ "
			while (this.con.result.next()) {
				if (dates.equals("")) {
					dates = dates + String.format("%td", this.con.result.getDate("signin_time"));
				} else {
					dates = dates + "_" + String.format("%td", this.con.result.getDate("signin_time"));
				}
			}
			System.out.println(dates);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return dates;//����ȫ������
	}

	// ͷ��ģ��------------------------------------------------------------------------------------------------>
	public void head() {
		String sql = "select * from user_data where ID='" + this.ID + "'";
		try {
			con.result = con.usercommend.executeQuery(sql);			//��ȡĿ���û���ͷ��ģ����Ϣ
			con.result.next();
			this.nickiname = con.result.getString("nickiname");		//�ǳ�
			this.sign = con.result.getString("sign");				//ǩ��
			this.headphoto = con.result.getString("head_photo");	//ͷ��
			this.background = con.result.getString("background");	//����
			this.level = con.result.getInt("experience");			//����
			count_level count = new count_level();					//���ڸ����û��ľ��� ������û��ĵȼ��Ķ���
			this.level = count.count(this.level);					//����ȼ�
//			System.out.println("<----homepage_bean.java---->");
//			System.out.println("nickiname:" + this.nickiname);
//			System.out.println("sign:" + this.sign);
//			System.out.println("level:" + this.level);
//			System.out.println("headphoto:" + this.headphoto);
//			System.out.println("background" + this.background);
//			System.out.println("<-------------------------->");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// ����Ի�------------------------------------------------------------------------------------------>
	public String[] get_content() {
		try {
			int i = 0;
			String sql = "select * from pet_tips";
			this.con.result = con.usercommend.executeQuery(sql);
			this.con.result.last();//��λ������������һ��
			int count = this.con.result.getRow();//���ص�ǰ����һ��
			String[] str = new String[count];
			this.con.result.beforeFirst();//�ص���һ�н����
			while (this.con.result.next()) {
				str[i] = this.con.result.getString("tips");
				i++;
			}
			return str;
		} catch (SQLException e) {
			String[] str = new String[1];
			str[0] = "��~";
			return str;
		}
	}

	// ���ſ�Ƭ------------------------------------------------------------------------------------------>
	public String apartment() {
		int apartment = 0;
		String sql = "select apartment from user_personal_data where ID='" + this.ID + "'";
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);//��ȡ����
			this.con.result.next();
			// 1 ��� 2������ 3������ 4������ 5��Ӫ�� 6����
			apartment = Integer.parseInt(this.con.result.getString("apartment"));

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String apart = "";
		if (apartment == 1) {
			apart = "���";
		}
		if (apartment == 2) {
			apart = "������";
		}
		if (apartment == 3) {
			apart = "������";
		}
		if (apartment == 4) {
			apart = "������";
		}
		if (apartment == 5) {
			apart = "��Ӫ��";
		}
		if (apartment == 6) {
			apart = "����";
		}
		return apart;
	}

	//��ѯ��ǰ�û������Ƿ���ǩ��
	public String check_clendar() {
		Handle_date date = new Handle_date();
		String ID = this.ID;

		String sql = "select * from calendar where ID='" + this.ID + "' and signin_time='" + date.getyear() + "-"
				+ date.getMonth() + "-" + date.getDay() + "'";
		try {
			this.con.result = con.usercommend.executeQuery(sql);

			if (con.result.next()) {
				ID = this.ID;
			} else {
				ID = null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ID;  //��ѯ �������ǩ�� �����û�ID
	}
	

}
