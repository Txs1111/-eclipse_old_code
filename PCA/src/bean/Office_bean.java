package bean;
import java.util.*;
import dao.MySQL_connect;

public class Office_bean {
	MySQL_connect con = new MySQL_connect();
	//模块功能函数
	public String[] Office_bean(String tittles) {
		int y = 0;
		String office = null;
		String[] field = new String[6];
		try {
			String sql = "select * from text where tittle='"+tittles+"'";
			con.result = con.usercommend.executeQuery(sql);
			System.out.println("接收成功");
			if(con.result.next()){
				String sent_ID = con.result.getString("sent_ID");
				String get_ID = con.result.getString("get_ID");
				String tittle = con.result.getString("tittle");
				String content = con.result.getString("content");
				String send_time = con.result.getString("send_time");
				String type = Integer.toString(con.result.getInt("type"));
				office = sent_ID+"]"+get_ID+"]"+tittle+"]"+content+"]"+send_time+"]"+type;	
	            System.out.println("循环成功");
			}
			StringTokenizer st = new StringTokenizer(office,"]");
			while(st.hasMoreElements()){
				field[y++] = st.nextToken();
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return field;
	}
	public String[] office_all(){
		int i = 0;
		String[] office_all=null;
		try {
			String sql = "select * from text";
			con.result = con.usercommend.executeQuery(sql);
			con.result.last();
			office_all = new String[con.result.getRow()];
			con.result.beforeFirst();
			while(con.result.next()){
				String title = con.result.getString("tittle");
				office_all[i++] = title;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return office_all;
	}
	public static void main(String[] args) {
		Office_bean ob = new Office_bean();
		String[] m = ob.office_all();
		for(int i=0;i<m.length;i++){
			System.out.println(m[i]);
		}
	}
}
