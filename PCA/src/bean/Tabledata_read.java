package bean;

import java.sql.*;

public class Tabledata_read {
	//��ȡ��������ܳ��ȣ����м��������û�н������0
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
	
	//���ֶ������ֶ�ֵ��ȡ��һ����ά���鲢����
	public String[][] getFieldnums(ResultSet rs){
		try{
		ResultSetMetaData metaData = rs.getMetaData();
		int count = metaData.getColumnCount();
		String[][] str = new String[count][2];
		for (int i=0; i<count; i++) {
            // ��ȡ�ֶε�����
            String column_name = metaData.getColumnName(i + 1);
            // ��ȡ�ֶζ�Ӧ��ֵ
            Object object = rs.getObject(column_name);
            // ���ֶ������ֶ�ֵ, ����������
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
