package bean;

import java.sql.SQLException;
import java.util.StringTokenizer;

import dao.MySQL_connect;

public class Work_bean {
	public String ID = null;
	public MySQL_connect con = new MySQL_connect();
	public String nickiname;
	public String sign;
	public int level;
	public String headphoto;
	public String background;
	public String role=null;
	public Work_bean(String ID) {
		this.ID = ID;
		String sql = "select role from users_login where ID='" + this.ID + "'";
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);
			this.con.result.next();
			this.role = this.con.result.getString("role");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void head() {
		String sql = "select * from user_data where ID='" + this.ID + "'";
		try {
			con.result = con.usercommend.executeQuery(sql);
			con.result.next();
			this.nickiname = con.result.getString("nickiname");
			this.sign = con.result.getString("sign");
			this.headphoto = con.result.getString("head_photo");
			this.background = con.result.getString("background");
			this.level = con.result.getInt("experience");
			count_level count = new count_level();
			this.level = count.count(this.level);
			System.out.println("<----homepage_bean.java---->");
			System.out.println("nickiname:" + this.nickiname);
			System.out.println("sign:" + this.sign);
			System.out.println("level:" + this.level);
			System.out.println("headphoto:" + this.headphoto);
			System.out.println("background" + this.background);
			System.out.println("<-------------------------->");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	//�������ݿ�����ȡ�ÿ��е��ܼ�¼��
		public int get_allRecord(String table_name,String type,String person,String id){
			try{
				String sql = "";
				if(type.equals("1")&&person.equals("1")){
				sql = "select * from all_works where if_show = '1' and type = '0'";
				}
				if(type.equals("2")&&person.equals("1")){
				sql = "select * from all_works where if_show = '1' and type = '1'";
				}
				if(type.equals("1")&&person.equals("2")){
				sql = "select * from all_works where type = '0' and id = '"+id+"'";
				}
				if(type.equals("2")&&person.equals("2")){
				sql = "select * from all_works where type = '1' and id = '"+id+"'";
				}
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
	
		
	//
	public String get_Allcontent(int startRecord, int pageSize, String table_name, String need_search,String type,String person,String id){
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
			String sql = "";
			if(type.equals("1")&&person.equals("1")){
			sql = "select * from all_works where if_show = '1' and type = '0' order by work_id desc LIMIT "+startRecord+","+pageSize+";";
			}
			if(type.equals("2")&&person.equals("1")){
			sql = "select * from all_works where if_show = '1' and type = '1' order by work_id desc LIMIT "+startRecord+","+pageSize+";";
			}
			if(type.equals("1")&&person.equals("2")){
			sql = "select * from all_works where if_show = '1' and type = '0' and id = '"+id+"' order by work_id desc LIMIT "+startRecord+","+pageSize+";";
			}
			if(type.equals("2")&&person.equals("2")){
			sql = "select * from all_works where if_show = '1' and type = '1' and id = '"+id+"' order by work_id desc LIMIT "+startRecord+","+pageSize+";";
			}
				
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
	
	
	public int get_allwork(String table_name,String person,String id){
		try{
			String sql = "";
			if(person.equals("1")){
			sql = "select * from all_works where if_show = '1'";
			}
			if(person.equals("2")){
			sql = "select * from all_works where if_show = '1' and id = '"+id+"'";
			}
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

	
	
	public String get_Allworks(int startRecord, int pageSize, String table_name, String need_search,String person,String id){
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
			String sql = "";
			if(person.equals("1")){
			sql = "select * from all_works where if_show = '1' order by work_id desc LIMIT "+startRecord+","+pageSize+";";
			}

			if(person.equals("2")){
			sql = "select * from all_works where if_show = '1' and id = '"+id+"' order by work_id desc LIMIT "+startRecord+","+pageSize+";";
			}
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
		
		
		//work_details
		public String work_details(String work_id){
			try{
				String sql = "select * from all_works where work_id = "+work_id;
				con.result = con.usercommend.executeQuery(sql);
				String allData = null;
				while (con.result.next()) {
					allData = allData +""+ con.result.getString("ID") + "��ו�Z";
					allData = allData +""+ con.result.getString("tittle") + "��ו�Z";
					allData = allData +""+ con.result.getString("content") + "��ו�Z";
					allData = allData +""+ con.result.getString("finish_date") + "��ו�Z";
					allData = allData +""+ con.result.getString("like") + "��ו�Z";
					allData = allData +""+ con.result.getString("work_point") + "��ו�Z";//������֮����'��ו�Z'�ֿ�
				}
				return allData;
			}catch(SQLException e){
				return "1";
			}		
		}
		
		//��ȡ��Ʒ����
		public String work_judge(String work_id){
			try{
				String sql = "select * from work_judge where work_ID = "+work_id;
				con.result = con.usercommend.executeQuery(sql);
				String allData = null;
				while (con.result.next()) {
					String ifhas = con.result.getString("judge_content");
					if(ifhas!=null&&!ifhas.equals("")&&!ifhas.equals("null")){
					allData = allData +""+ con.result.getString("judge_ID") + "��ו�Z";
					allData = allData +""+ con.result.getString("judge_time") + "��ו�Z";
					allData = allData +""+ con.result.getString("judge_content") + "��ו�Z";
					allData =""+ allData + "�I�|�a";
					}
				}
				return allData;
			}catch(SQLException e){
				return "1";
			}		
		}

}

