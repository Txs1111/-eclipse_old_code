package bean;

import java.sql.ResultSet;
import java.sql.SQLException;
import bean.Handle_date;
import dao.MySQL_connect;

public class check_work_tool {
	public MySQL_connect con = new MySQL_connect();
	public Handle_date hd = new Handle_date();
	
	//目录获取id和标题
			public String get_Tittle(String type,String ID){
				try{
					String allData = "";
					
					String sql2  = "select * from work_judge where judge_ID = '"+ID+"'";
					ResultSet con2= con.usercommend.executeQuery(sql2);
					con2.last();
					int count = con2.getRow(); 	
					con2.beforeFirst();
					String[] str = new String[count];
					int a =0;
					int ifnull = 0;
					int ifsame = 0;
					while(con2.next()){
						if(a==0&&con2.getString("work_ID")==null){
							ifnull = 1;
						}
						str[a] = con2.getString("work_ID");
						a++;
					}
					String sql = "select * from all_works where type = '"+type+"' order by work_id desc";
					con.result = con.usercommend.executeQuery(sql);				
					while(con.result.next()){
						String w_id = con.result.getString("work_id");
						for(int i = 0;i<str.length;i++){
							if(w_id.equals(str[i])){
								ifsame = 1;
							}
						}
						if(ifsame==0){
						allData = allData +""+ con.result.getString("work_id") + "麤讜黌";
						allData = allData +""+ con.result.getString("tittle") + "麤讜黌";
						}
						ifsame = 0;
					}
					return allData;
				}catch(SQLException e){
					return "1麤讜黌11111麤讜黌";
				}
			}
			
			//获取作品内容
			public String get_content(String work_id){
				try{
					String allData = "";
					String sql = "select * from all_works where work_id = '"+work_id+"'";
					con.result = con.usercommend.executeQuery(sql);
					while(con.result.next()){
					allData = allData +""+ con.result.getString("work_id") + "麤讜黌";
					allData = allData +""+ con.result.getString("ID") + "麤讜黌";
					allData = allData +""+ con.result.getString("tittle") + "麤讜黌";
					allData = allData +""+ con.result.getString("work_point") + "麤讜黌";
					allData = allData +""+ con.result.getString("content") + "麤讜黌";
					}
					return allData;
				}catch(SQLException e){
					return "1麤讜黌11111麤讜黌11麤讜黌1111麤讜黌";
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
			
			//评价作品
			public String judge_work(String poster_id,String points,String ID,String work_id,String content) {
				try{
					String sql="insert into work_judge(poster_ID,judge_ID,points,judge_time,work_ID,judge_content) value('"+poster_id+"','"+ID+"','"+points+"','"+hd.getDate()+"','"+work_id+"','"+content+"')";
					con.usercommend.executeUpdate(sql);
					String sql2="select * from work_judge where work_ID = '"+work_id+"'";
					con.result = con.usercommend.executeQuery(sql2);
					int a=0;int b=0;
					while(con.result.next()){
						a = con.result.getInt("points") + a;
						b++;
					}
					int points1 = a/b;
					String sql3="Update all_works set work_point = "+points1+" where work_id = '"+work_id+"'";
					con.usercommend.executeUpdate(sql3);
					return "OK";
				}
				catch(SQLException e){
					return "sorry";
				}
			}
}
