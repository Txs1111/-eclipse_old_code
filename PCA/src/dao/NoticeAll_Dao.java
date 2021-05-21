package dao;

import java.sql.SQLException;
import java.util.StringTokenizer;

public class NoticeAll_Dao {
	public  MySQL_connect con = new MySQL_connect();
	
	
	//�������ݿ�����ȡ�ÿ��е��ܼ�¼��
	public int get_allRecord(String table_name){
		try{
			String sql = "select * from "+ table_name;
			con.result = con.usercommend.executeQuery(sql);
			con.result.last();
			
			int count = con.result.getRow(); 	
			return count;
		}
		catch(Exception e)
		{
			return 0;
		}
		
	}
	
	
	//������ʼ��¼����ѯ���������ݿ������ܻ�ȡ�ÿ��е��ܼ�¼��
	public String get_pageData(int startRecord, int pageSize, String table_name, String need_search){
		try{
			StringTokenizer fieldcut = new StringTokenizer(need_search,",");
			String allData = ""; //���������ܴ�
			int field_nums = 0;//�����ֶ�����
			int i = 0;//��ʱ����
			
			//���ݴ������ֶλ�ȡ�ֶ�����
		    while(fieldcut.hasMoreTokens()){
				try{
					fieldcut.nextToken();
					field_nums++;
				}catch(Error e){
					
				}
			}
		    
		    String[] field_names = new String[field_nums];//��������洢�ֶ�
		    StringTokenizer fieldcut_copy = new StringTokenizer(need_search,",");
		    
		    //���ֶδ洢��������
		    while(fieldcut_copy.hasMoreTokens()){
				try{
					field_names[i] = fieldcut_copy.nextToken();
					i++;
				}catch(Error e){
					
				}
			}	
		    
			String sql = "select * from "+table_name+" order by id desc LIMIT "+startRecord+","+pageSize+";";
		    //String sql = "select * from notice order by id desc LIMIT 10,10;";
			con.result = con.usercommend.executeQuery(sql);
			
			while (con.result.next()) {
				
				for(int a = 0;a<field_nums;a++){
					allData = allData +""+ con.result.getString(""+field_names[a]) + "��ו�Z";//������֮����'��ו�Z'�ֿ�
				}
				
				//���������ݴ�֮����'�I�|�a'�ָ
				allData =""+ allData + "�I�|�a";
			}
			
			return allData;
		}
		catch(Exception e)       // �������ݴ�Ϊ ����һ����һ,��һ���ݶ�,��һ������,/�ж�����һ,�ж����ݶ�,����������,/...	
		{
			return "";
		}
		
	}
	
	
	//����id���û���Ϣ��(������user_data)�л�ȡ��id���ǳ�
	public String get_nickiname(String id){
		try{
			String sql = "select * from user_data where ID = "+id;
			con.result = con.usercommend.executeQuery(sql);
			con.result.next();
			String nickiname = con.result.getString("nickiname");			
			return nickiname;
		}catch(SQLException e){
			return "";
		}
	}
	
	//����id���û���Ϣ��(������user_data)�л�ȡ��id��ͷ��
	public String get_headPhoto(String id){
		try{
			String sql = "select * from user_data where ID = "+id;
			con.result = con.usercommend.executeQuery(sql);
			con.result.next();
			String head_photo = con.result.getString("head_photo");			
			return head_photo;
		}catch(SQLException e){
			return "1";
		}
	}

	
	//��������ҳ���ȡֵ
	public String get_content(String id){
		try{
			String allData = "";
			String sql = "select * from notice where ID = "+id;
			con.result = con.usercommend.executeQuery(sql);
			con.result.next();
			allData = allData +""+ con.result.getString("poster_id") + "��ו�Z";
			allData = allData +""+ con.result.getString("tittle") + "��ו�Z";
			allData = allData +""+ con.result.getString("content") + "��ו�Z";
			allData = allData +""+ con.result.getString("postdate") + "��ו�Z";
			return allData;
		}catch(SQLException e){
			return "000��ו�Z11��ו�Z22��ו�Z2020-1-1";
		}
	}
	
	//��������ҳ���ȡid�ͱ���
		public String get_Tittle(){
			try{
				String allData = "";
				String sql = "select * from notice order by id desc";
				con.result = con.usercommend.executeQuery(sql);
				while(con.result.next()){
				allData = allData +""+ con.result.getString("ID") + "��ו�Z";
				allData = allData +""+ con.result.getString("tittle") + "��ו�Z";
				}
				return allData;
			}catch(SQLException e){
				return "18��ו�Z11��ו�Z";
			}
		}
}
