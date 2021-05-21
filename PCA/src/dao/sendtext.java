package dao;

import java.sql.SQLException;

import bean.Handle_date;

public class sendtext {
	public MySQL_connect con = new MySQL_connect();

	public void send(String sendID, String getID, String role, String type, String tittle, String content) {

		String get_ID = getID;
		
		Handle_date date = new Handle_date();
		try {
		if ("0".equals(getID) && "0".equals(role)) {
			get_ID = "0";
		} else if ("0".equals(getID) && !"0".equals(role)) {
			get_ID = "role_" + role;
		}
		if ("3".equals(type)) {
			type = "0";// 作业消息

		} else if ("2".equals(type)) {
			type = "1";// 官方消息
		} else if ("1".equals(type)) {
			type = "2";// 短消息
		}
		tittle="tips";
		int num=1;
		this.con.result=this.con.usercommend.executeQuery("select ID from text");
		while(this.con.result.next()){
			num=num+1;
		}
		String sql = "insert into text value ('"+num+"','"+sendID+"','"+get_ID+"','"+tittle+"','"+content+"','"+date.getDate()+"','"+type+"')";
		System.out.println(sql);
		
			this.con.usercommend.executeLargeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
