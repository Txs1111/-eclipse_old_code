package dao;

import java.sql.SQLException;

public class noticedao {
	MySQL_connect con= new MySQL_connect();
	//输入学号id自动查询返回Notice的全部字段数据
	public String[] selectid(int id){
		String[] content = new String[id];
		String[] noticedaos = null;
		try {
			int y=0;
			String sql ="select * from notice";
			con.result = con.usercommend.executeQuery(sql);
			con.result.last();
			noticedaos = new String[con.result.getRow()];
			con.result.beforeFirst();
			while(con.result.next()){
				String sid = con.result.getString("ID");
				String stittle = con.result.getString("tittle");
				String scontent = con.result.getString("content");
				String spostdate = con.result.getString("postdate");
				noticedaos[y++] = sid+"]"+stittle+"]"+scontent+"]"+spostdate;
                System.out.println(sid);
				 
			}
			for(int i=0;i<id;i++){
				content[i] = noticedaos[--y];
			}
		}
		catch (SQLException e){
			e.printStackTrace();
		} catch (Exception e){
			e.printStackTrace();
		}
		return content;
		
	}
}
//
