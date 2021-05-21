package bean;

import java.sql.SQLException;
import java.util.StringTokenizer;
import dao.*;

public class rankIng_bean {
	MySQL_connect con = new MySQL_connect();
	public String[] ranking_bean(int n){
		int i = 0;
		String[] order = new String[n];
		try {
			String sql = "select * from score_card order by all_score desc";
			con.result = con.usercommend.executeQuery(sql);
			con.result.beforeFirst();
//			System.out.println(con.result.getRow());
			while (con.result.next()){
				String ID = con.result.getString("ID");
				String all_score = Integer.toString(con.result.getInt("all_score"));
				String synthesize_score = Integer.toString(con.result.getInt("synthesize_score"));
				String finished_assignment = Integer.toString(con.result.getInt("finished_assignment"));
				String like = Integer.toString(con.result.getInt("like"));
				order[i++] = ID+"]"+all_score+"]"+synthesize_score+"]"+finished_assignment+"]"+like;	
//	            System.out.println("Ñ­»·³É¹¦");
	            if(i==n){
	            	break;
	            }
			}
			
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		} catch (Exception e){
			e.printStackTrace();
		}
		try {
			i=0;
			String sqls = "select * from user_personal_data";
			con.result = con.usercommend.executeQuery(sqls);
			con.result.last();
			String[] data = new String[con.result.getRow()];
			con.result.beforeFirst();
//			System.out.println(con.result.getRow());
			while (con.result.next()){
				String ID = con.result.getString("ID");
				String name = con.result.getString("name");
				for(int l=0;l<n;l++){
					int y=0;
					String[] score = new String[5];
		    	    StringTokenizer st = new StringTokenizer(order[l],"]");
		    	    while(st.hasMoreElements()){
					    score[y]=st.nextToken();
					    y++;
				    }
		    	    if(score[0].equals(ID)){
		    	    	order[l] = name+"]"+score[1]+"]"+score[2]+"]"+score[3]+"]"+score[4];
		    	    }
				}
			}
			
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		} catch (Exception e){
			e.printStackTrace();
		}
		return order;
	}
	
	public static void main(String[] args) {
		rankIng_bean rb = new rankIng_bean();
		String[] x = rb.ranking_bean(10);
		for(int i=0;i<10;i++){
			System.out.println(x[i]);
		}
	}
}
