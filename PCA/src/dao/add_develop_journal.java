package dao;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.StringTokenizer;

public class add_develop_journal {
	public int add_journal(String content, String role, String version) {
		int result = 0;
		if (role != null && content != null && version != null) {
			get_version versionnow = new get_version();
			String version_now = versionnow.getversion();
			StringTokenizer chart = new StringTokenizer(version_now, ".");
			int first = Integer.parseInt(chart.nextToken());
			int second = Integer.parseInt(chart.nextToken());
			int threed = Integer.parseInt(chart.nextToken());
			if (role.equals("1")) {
				role = "Ì·±þê»";
			} else if (role.equals("2")) {
				role = "ÐíÁ¼";
			} else if (role.equals("3")) {
				role = "ÍõÐñÉý";
			} else {
				role = "Áõ¾ü";
			}
			if (version.equals("1")) {
				first = first + 1;
			} else if (version.equals("2")) {
				second = second + 1;
			} else if (version.equals("3")) {
				threed = threed + 1;
			}
			MySQL_connect con = new MySQL_connect();
			Date data = new Date();
			SimpleDateFormat time = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

			try {
				con.usercommend.executeUpdate("INSERT INTO `develop_journal` VALUES ('" + time.format(data) + "', '"
						+ role + "', '" + content + "', '" + first + "." + second + "." + threed + "');");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			result = 1;
		} else if (content == null || content.equals("")) {
			result = 2;
		} else if (role == null) {
			result = 3;
		} else if (version == null) {
			result = 4;
		}
		return result;

	}
}
