package bean;

import java.sql.SQLException;

import dao.MySQL_connect;
import dao.add_web_journal;

public class user_personal_write_part {

	public String ID = "";// �༭�ߵ�ID
	public MySQL_connect con = new MySQL_connect();
	public String user_personal_card = "<div style='background-color: #FFCAB0;width:100%;height:50px;line-hight:50px;text-align:center;margin-bottom:1px;color:#ffffff;border-radius:5px 5px 0px 0px;'><font style='font-size: 18px;'>�ҵĻ��ֿ�Ƭ</font></div><div style='width: 100%;height: 40px;line-height:30px;background-color: #FFFFFF;'><div style='width: 33.33%;height: 35px;float: left;text-align: center;line-height: 35px; small-font'>����</div><div style='width: 33.33%;height: 35px;float: left;text-align: center;line-height: 35px; small-font'>�����</div><div style='width: 33.33%;height: 35px;float: left;text-align: center;background-color:white;line-height: 35px; small-font'>����</div></div><div style='color: #FFCAB0;'><div style='width: 33.33%;height: 35px;float: left;text-align: center;line-height: 35px; font-size: 18px;'>|%|score|%|</div><div style='width: 33.33%;height: 35px;float: left;text-align: center;line-height: 35px; font-size: 18px;'>|%|finish|%|</div><div style=' width: 33.33%;height: 35px;float: left;text-align: center;background-color:white;line-height: 35px; font-size: 18px;'>|%|rank|%|</div></div>";
	public String user_personal_head = "<div style='width:100%;height:160px;margin:0auto;color:white;'><div style='width:100%;height:170px;float:left;background:url(img/theme_photo/1.png);'><div style='margin-left:4.7%;margin-top:30px;width:4%;height:40px;width:54px;height:54px;'><img src='img/level_photo/�ȼ�2.png'style='height:100%;width:100%;'></div><div style='width:70%;height:70px;margin-left:3%;margin-top:3px;'><img src='img/head_photo/1.jpg'style='width:70px;height:70px;float:left;display:flex;border-radius:50%;align-items:center;justify-content:center;overflow:hidden;'/><br/>&nbsp;nickiname<br/>&nbsp;sign</div></div></div>";
	public user_personal_write_part(String ID) {
this.ID=ID;
	}

	public String gethead() {// ��ȡָ��ģ�������
		String block = "";
		String sql = "select head from user_personal_homepage where ID='" + this.ID + "'";
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);
			this.con.result.next();
			block = this.con.result.getString("head");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return block;
	}

	public String getcard() {// ��ȡָ��ģ�������
		String block = "";
		String sql = "select point_card from user_personal_homepage where ID='" + this.ID + "'";
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);
			this.con.result.next();
			block = this.con.result.getString("point_card");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		add_web_journal add_journal = new add_web_journal(this.ID);
		add_journal.noothers("��ȡ������ҳ���ֿ�Ƭ��ʽ����");
		return block;
	}

	public void savecard(String data) {// �����û���д�Ĵ���
		data = data.replace("'", "\"");
		String sql = "update user_personal_homepage set repoint_card='" + data + "' where ID='" + this.ID + "'";
		try {
			this.con.usercommend.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		add_web_journal add_journal = new add_web_journal(this.ID);
		add_journal.noothers("���������ҳ���ֿ�Ƭ��ʽ����");
	}

	public void savehead(String data) {// �����û���д�Ĵ���
		data = data.replace("'", "\"");
		String sql = "update user_personal_homepage set rehead='" + data + "' where ID='" + this.ID + "'";
		try {
			this.con.usercommend.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public String readhead() {// ��ȡ�û���д�Ĵ���
		String block = "";
		String sql = "select rehead from user_personal_homepage where ID='" + this.ID + "'";
		System.out.println(sql);
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);
			this.con.result.next();
			block = this.con.result.getString("head");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		add_web_journal add_journal = new add_web_journal(this.ID);
		add_journal.noothers("��ȡ������ҳ���ֿ�Ƭ��ʽ����");
		return block;
	}

	public String readcard() {// ��ȡ�û���д�Ĵ���
		String block = "";
		String sql = "select repoint_card from user_personal_homepage where ID='" + this.ID + "'";
		System.out.println(sql);
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);
			this.con.result.next();
			block = this.con.result.getString("repoint_card");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		add_web_journal add_journal = new add_web_journal(this.ID);
		add_journal.noothers("��ȡ������ҳ���ֿ�Ƭ��ʽ����");
		return block;
	}

	public void writehead(String data) {// д���û��Ĵ������ڸ���ҳ��չʾ

		data = data.replace("'", "\"");
		String sql = "update user_personal_homepage set head='" + data + "' where ID='" + this.ID + "'";
		try {
			this.con.usercommend.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void writrecard(String data) {// д���û��Ĵ������ڸ���ҳ��չʾ

		data = data.replace("'", "\"");
		String sql = "update user_personal_homepage set point_card='" + data + "' where ID='" + this.ID + "'";
		try {
			this.con.usercommend.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		add_web_journal add_journal = new add_web_journal(this.ID);
		add_journal.noothers("�ύ������ҳ���ֿ�Ƭ��ʽ����");
	}

}
