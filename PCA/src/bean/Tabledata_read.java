package bean;

import java.sql.*;

public class Tabledata_read {
	//获取结果集的总长度（共有几条结果）没有结果返回0
	public int getRows(ResultSet rs){
		try{
			rs.last();
			int count = rs.getRow();
		rs.close();
		return count;
		}catch(SQLException e){
				return 0;			
			}
		}
	
	//将字段名和字段值读取到一个二维数组并返回
	public String[][] getFieldnums(ResultSet rs){
		try{
		ResultSetMetaData metaData = rs.getMetaData();
		int count = metaData.getColumnCount();
		String[][] str = new String[count][2];
		for (int i=0; i<count; i++) {
            // 获取字段的名字
            String column_name = metaData.getColumnName(i + 1);
            // 获取字段对应的值
            Object object = rs.getObject(column_name);
            // 将字段名和字段值, 存入数组中
            column_name = str[i][0];
            object = str[i][1];
       }
		rs.close();
		return str;
		}catch(SQLException e){
			String[][] str = null;
				return str;			
			}
		}
}
