package bean;

import java.sql.SQLException;
import java.util.StringTokenizer;

import dao.MySQL_connect;

public class chat_room_allmessage {
	public MySQL_connect con = new MySQL_connect();

	public String getdata() {
		String data = "";
		String sql = "select ID from chat_room";
		try {
			int num = 0;
			this.con.result = this.con.usercommend.executeQuery(sql);
			while (this.con.result.next()) {
				num++;
			}
			String IDs = "";
			String content = "";
			String name = "";
			sql = "select * from chat_room limit " + (num - 20) + "," + 20 + "";
			this.con.result = this.con.usercommend.executeQuery(sql);
			while (this.con.result.next()) {
				IDs = IDs + this.con.result.getString("sendID") + "��";
				content = content + this.con.result.getString("content") + "��";
			}
			StringTokenizer chart = new StringTokenizer(IDs, "��");
			int xun = chart.countTokens();
			for (int a = 0; a < xun; a++) {
				sql = "select name from user_personal_data where ID='" + chart.nextToken() + "'";
				this.con.result = this.con.usercommend.executeQuery(sql);
				this.con.result.next();
				name = name + this.con.result.getString("name") + "��";
			}
			String head_photo = "";
			chart = new StringTokenizer(IDs, "��");
			xun = chart.countTokens();
			for (int a = 0; a < xun; a++) {
				sql = "select head_photo from user_data where ID='" + chart.nextToken() + "'";
				this.con.result = this.con.usercommend.executeQuery(sql);
				this.con.result.next();
				head_photo = head_photo + this.con.result.getString("head_photo") + "��";
			}
			// System.out.println(IDs);
			// System.out.println(content);
			// System.out.println(name);
			// System.out.println(head_photo);
			StringTokenizer chart0 = new StringTokenizer(IDs, "��");
			chart = new StringTokenizer(head_photo, "��");
			StringTokenizer chart1 = new StringTokenizer(name, "��");
			StringTokenizer chart2 = new StringTokenizer(content, "��");

			for (int c = 0; c < xun; c++) {
				data = data + chart0.nextToken() + "��" + chart.nextToken() + "��" + chart1.nextToken() + "��"
						+ chart2.nextToken() + "��";
			}
			// System.out.println(data);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return data;

	}

}
