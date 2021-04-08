package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class two_use {
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			//��������
			Class.forName("com.mysql.jdbc.Dricer");
			//��������
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?serverTimezone=UTC","root","");
			//��������
			stmt = con.createStatement();
			//ִ��SQL���
			rs = stmt.executeQuery("select * form ");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try{
				if(rs != null){
					rs.close();
					rs = null;
				}
				if(stmt != null){
					stmt.close();
					stmt = null;
				}
				if(con != null){
					con.close();
					con = null;
				}
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		
	}
}
