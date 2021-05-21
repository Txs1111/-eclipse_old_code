package dao;

import java.sql.SQLException;
import java.sql.*;

public class petsign_dao {
	
	public String[] get_content(MySQL_connect con){
		try{
			int i=0;
			String sql ="select * from pet_tips";
			con.result = con.usercommend.executeQuery(sql);
			con.result.last();
			int count = con.result.getRow();
			String[] str = new String[count];
			con.result.beforeFirst();
			while(con.result.next()){
				str[i] = con.result.getString("tips");
				i++;
			}
			return str;
		}catch(SQLException e){
			String[] str = new String[1];
			str[0] = "xxx";
			return str;
		}
	}
		
}
