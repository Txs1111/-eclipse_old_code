package bean;

import java.sql.SQLException;

import dao.MySQL_connect;
import dao.add_web_journal;

public class user_personal_homepage_write_bean {

	public String ID = "";// �༭�ߵ�ID
	public String num = "";// ���ڱ༭��ģ����
	public MySQL_connect con = new MySQL_connect();
	public String user_personal_card = "<div style='background-color: #FFCAB0;width:100%;height:50px;line-hight:50px;text-align:center;margin-bottom:1px;color:#ffffff;border-radius:5px 5px 0px 0px;'><font style='font-size: 18px;'>�ҵĻ��ֿ�Ƭ</font></div><div style='width: 100%;height: 40px;line-height:30px;background-color: #FFFFFF;'><div style='width: 33.33%;height: 35px;float: left;text-align: center;line-height: 35px; small-font'>����</div><div style='width: 33.33%;height: 35px;float: left;text-align: center;line-height: 35px; small-font'>�����</div><div style='width: 33.33%;height: 35px;float: left;text-align: center;background-color:white;line-height: 35px; small-font'>����</div></div><div style='color: #FFCAB0;'><div style='width: 33.33%;height: 35px;float: left;text-align: center;line-height: 35px; font-size: 18px;'>|%|score|%|</div><div style='width: 33.33%;height: 35px;float: left;text-align: center;line-height: 35px; font-size: 18px;'>|%|finish|%|</div><div style=' width: 33.33%;height: 35px;float: left;text-align: center;background-color:white;line-height: 35px; font-size: 18px;'>|%|rank|%|</div></div>";
	public String user_personal_head = "";
	public String first_page = "<div style='font-size:100px;color:blue;'>hello world</div></br>������֪����ô���˰�~";

	public user_personal_homepage_write_bean(String ID, String num) {//��ʼ��bean��ID�����ڱ༭��ģ����
		this.ID = ID;
		this.num = num;

	}

	public String getblock() {//��ȡָ��ģ�������
		String block = "";
		String sql = "select block_" + this.num + " from user_personal_homepage where ID='"+this.ID+"'";
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);
			this.con.result.next();
			block = this.con.result.getString("block_" + this.num + "");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return block;
	}

	public void savedata(String data) {//�����û���д�Ĵ���
		data = data.replace("'", "\"");
		String sql = "update user_personal_homepage set reblock_" + this.num + "='" + data + "' where ID='" + this.ID
				+ "'";
		try {
			this.con.usercommend.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		add_web_journal add_journal = new add_web_journal(this.ID);
		add_journal.noothers("���������ҳģ����룬ģ����Ϊ��"+num+"");
	}

	public String readedata() {//��ȡ�û���д�Ĵ���
		String block = "";
		String sql = "select reblock_" + this.num + " from user_personal_homepage where ID='" + this.ID + "'";
		System.out.println(sql);
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);
			this.con.result.next();
			block = this.con.result.getString("reblock_" + this.num + "");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		add_web_journal add_journal = new add_web_journal(this.ID);
		add_journal.noothers("��ȡ������ҳģ����룬ģ����Ϊ��"+num+"");
		return block;
	}

	public void writrblock(String data) {//д���û��Ĵ������ڸ���ҳ��չʾ
		if (data.equals("<div style='font-size:100px;color:blue;'>hello world</div></br>������֪����ô���˰�~")) {
			data = "";
		}
		data = data.replace("'", "\"");
		String sql = "update user_personal_homepage set block_" + this.num + "='" + data + "' where ID='" + this.ID
				+ "'";
		try {
			this.con.usercommend.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		add_web_journal add_journal = new add_web_journal(this.ID);
		add_journal.noothers("�ύ������ҳģ����룬ģ����Ϊ��"+num+"");
	}

	public void openblock() {//���û����ִﵽ�ض�ֵ�� �ɵ��ô˺��������µ�ģ��
		String sql = "select block_" + this.num + " from user_personal_homepage where ID='" + this.ID + "'";
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);
			this.con.result.next();
			if (this.con.result.getString("block_" + this.num + "").equals("not_allow_to_use")) {
				sql = "update user_personal_homepage set block_" + this.num + "='' where ID='" + this.ID + "'";
				this.con.usercommend.executeUpdate(sql);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		add_web_journal add_journal = new add_web_journal(this.ID);
		add_journal.noothers("�����µĸ�����ҳģ�飬ģ����Ϊ��"+num+"");
	}

}
