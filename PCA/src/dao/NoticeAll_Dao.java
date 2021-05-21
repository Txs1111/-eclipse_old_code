package dao;

import java.sql.SQLException;
import java.util.StringTokenizer;

public class NoticeAll_Dao {
	public  MySQL_connect con = new MySQL_connect();
	
	
	//根据数据库名获取该库中的总记录数
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
	
	
	//根据起始记录、查询数量、数据库名、总获取该库中的总记录数
	public String get_pageData(int startRecord, int pageSize, String table_name, String need_search){
		try{
			StringTokenizer fieldcut = new StringTokenizer(need_search,",");
			String allData = ""; //定义数据总串
			int field_nums = 0;//定义字段数量
			int i = 0;//临时变量
			
			//根据传来的字段获取字段数量
		    while(fieldcut.hasMoreTokens()){
				try{
					fieldcut.nextToken();
					field_nums++;
				}catch(Error e){
					
				}
			}
		    
		    String[] field_names = new String[field_nums];//创建数组存储字段
		    StringTokenizer fieldcut_copy = new StringTokenizer(need_search,",");
		    
		    //将字段存储到数组中
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
					allData = allData +""+ con.result.getString(""+field_names[a]) + "麤讜黌";//将数据之间用'麤讜黌'分开
				}
				
				//将整行数据串之间用'轎藎燼'分割开
				allData =""+ allData + "轎藎燼";
			}
			
			return allData;
		}
		catch(Exception e)       // 最后的数据串为 ：行一数据一,行一数据二,行一数据三,/行二数据一,行二数据二,行三数据三,/...	
		{
			return "";
		}
		
	}
	
	
	//根据id在用户信息表(表名：user_data)中获取该id的昵称
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
	
	//根据id在用户信息表(表名：user_data)中获取该id的头像
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

	
	//公告详情页面获取值
	public String get_content(String id){
		try{
			String allData = "";
			String sql = "select * from notice where ID = "+id;
			con.result = con.usercommend.executeQuery(sql);
			con.result.next();
			allData = allData +""+ con.result.getString("poster_id") + "麤讜黌";
			allData = allData +""+ con.result.getString("tittle") + "麤讜黌";
			allData = allData +""+ con.result.getString("content") + "麤讜黌";
			allData = allData +""+ con.result.getString("postdate") + "麤讜黌";
			return allData;
		}catch(SQLException e){
			return "000麤讜黌11麤讜黌22麤讜黌2020-1-1";
		}
	}
	
	//公告详情页面获取id和标题
		public String get_Tittle(){
			try{
				String allData = "";
				String sql = "select * from notice order by id desc";
				con.result = con.usercommend.executeQuery(sql);
				while(con.result.next()){
				allData = allData +""+ con.result.getString("ID") + "麤讜黌";
				allData = allData +""+ con.result.getString("tittle") + "麤讜黌";
				}
				return allData;
			}catch(SQLException e){
				return "18麤讜黌11麤讜黌";
			}
		}
}
