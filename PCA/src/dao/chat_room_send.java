package dao;

import java.sql.SQLException;

import bean.Handle_date;

public class chat_room_send {
	public String ID = "";
	public MySQL_connect con = new MySQL_connect();

	public chat_room_send(String ID) {
		this.ID = ID;
	}

	public void send(String content) {
		if (this.ID != null || !"null".equals(this.ID) || !"".equals(this.ID)) {
			Handle_date date = new Handle_date();
			String sql = "select ID from chat_room";
			try {
				int num = 1;
				this.con.result = this.con.usercommend.executeQuery(sql);
				while (this.con.result.next()) {
					num++;
				}
				sql = "insert into chat_room value ('" + num + "','" + ID + "','" + content + "','" + date.getIntDate()
						+ "')";
				System.out.println(sql);
				this.con.usercommend.executeUpdate(sql);
				add_web_journal add_journal = new add_web_journal(ID);
				add_journal.noothers("聊天室发送消息"+content+",消息ID为:"+num+"");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
	}
}
