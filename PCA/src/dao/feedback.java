package dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;

import bean.Handle_date;

public class feedback {
	public static void main(String[] args) {

	}

	public feedback() {
		// TODO Auto-generated constructor stub
		super();
	}

	public void setdate(String ID, String text) {
		MySQL_connect con = new MySQL_connect();
		try {
			con.usercommend.executeUpdate("INSERT INTO question(ID,content,askdate) VALUES('" + ID + "','" + text + "',localtime());");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
	}
}
