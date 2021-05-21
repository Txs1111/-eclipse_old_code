package dao;

import java.util.StringTokenizer;

public class journal_tool {
	public  MySQL_connect con = new MySQL_connect();
	
	public String sqlCatchup(String usename, String useID , String cotent,String btime,String ctime){
		Boolean i = false;
		String nasq = "";
		String sesq = "";
		String idsq = "";
		String clsq = "";
		String cclsq = "";
		
		if(usename!=null&&!usename.equals("")){
				nasq = " usename like'%"+usename+"%'";
				i = true;
		}
		
		if(useID!=null&&!useID.equals("")){
			if(i){
				sesq = " and useID = '"+useID+"'";	
				}
			else{
				sesq = " useID = '"+useID+"'";
				i = true;
				}
		}
		
		if(cotent!=null&&!cotent.equals("")){
			if(i){
				idsq = " and cotent like '%"+cotent+"%'";
				}
			else{
				idsq = " cotent like '%"+cotent+"%'";
				i = true;
				}
		}
		
		if(btime!=null&&!btime.equals("")){
			if(i){
				clsq = " and time >'"+btime+"'";
				}
			else{
				clsq = " time >'"+btime+"'";
				i = true;
				}
		}
		if(ctime!=null&&!ctime.equals("")){
			if(i){
				cclsq = " and time <'"+ctime+"'";
				}
			else{
				cclsq = " time <'"+ctime+"'";
				i = true;
				}
		}
		
		String sql = "select * from journal where"+nasq+sesq+idsq+clsq+cclsq;
		return sql;
	}
	
	//�������ݿ�����ȡ�ÿ��е��ܼ�¼��
	public int get_allRecord(String table_name,String type,String search_type,String content){
		try{
			 String sql = null;
			  if(type.equals("1")){ 
				  sql = "select * from "+table_name+"";
			    }
			  if(type.equals("2")){ 
				  sql = content;
			    }
			    if(type.equals("3")){
			    	if(search_type.equals("needsearch_username")){
			    		sql = "select * from "+table_name+" where usename = '"+content+"'";
			    	}
			    	if(search_type.equals("needsearch_userID")){
			    		sql = "select * from "+table_name+" where useID = '"+content+"'";
				    }
			    }
			    if(type.equals("4")){
			    	sql = "select * from "+table_name+"";
			    }
			    if(type.equals("5")){
			    	if(search_type.equals("needsearch_dowhat")){
			    		sql = "select * from "+table_name+" where cotent like '%"+content+"%'";
				    }
			    }
			    if(type.equals("6")){
			    	if(search_type.equals("needsearch_innusername")){
			    		sql = "select * from "+table_name+" where inname = '"+content+"'";
			    	}
			    	if(search_type.equals("needsearch_innuserID")){
			    		sql = "select * from "+table_name+" where inID = '"+content+"'";
				    }
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
	
	//������ʼ��¼����ѯ���������ݿ������ܻ�ȡ�ÿ��е��ܼ�¼��
		public String get_pageData(int startRecord, int pageSize, String table_name, String need_search,String type,String search_type,String content){
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
			    String sql = null;
			    if(type.equals("1")){ 
			    	sql = "select * from "+table_name+" order by tips desc LIMIT "+startRecord+","+pageSize+";";
			    }
			    if(type.equals("2")){ 
					  sql = content+"order by tips desc LIMIT "+startRecord+","+pageSize+";";
				    }
			    if(type.equals("3")){
			    	if(search_type.equals("needsearch_username")){
			    		sql = "select * from "+table_name+" where usename = '"+content+"' order by tips desc LIMIT "+startRecord+","+pageSize+";";
			    	}
			    	if(search_type.equals("needsearch_userID")){
			    		sql = "select * from "+table_name+" where useID = '"+content+"' order by tips desc LIMIT "+startRecord+","+pageSize+";";
				    }
			    }
			    
			    if(type.equals("4")){
			    	sql = "select * from "+table_name+" order by tips desc LIMIT "+startRecord+","+pageSize+";";
			    }
			    if(type.equals("5")){
			    	if(search_type.equals("needsearch_dowhat")){
			    		sql = "select * from "+table_name+" where cotent like '%"+content+"%' order by tips desc LIMIT "+startRecord+","+pageSize+";";
				    }
			    }
			    if(type.equals("6")){
			    	if(search_type.equals("needsearch_innusername")){
			    		sql = "select * from "+table_name+" where inname = '"+content+"' order by tips desc LIMIT "+startRecord+","+pageSize+";";
			    	}
			    	if(search_type.equals("needsearch_innuserID")){
			    		sql = "select * from "+table_name+" where inID = '"+content+"' order by tips desc LIMIT "+startRecord+","+pageSize+";";
				    }
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
		
}
