package bean;

import java.sql.SQLException;
import java.util.StringTokenizer;

import dao.*;

public class personal_set_bean {
	MySQL_connect con = new MySQL_connect();
	
	public String showHead_photo(){
		try {
			String sql_1 = "select head_photo from theme_library";
			con.result = con.usercommend.executeQuery(sql_1);
			String resule = "";
			while(con.result.next()){
				if(con.result.getString("head_photo")!=null&&!con.result.getString("head_photo").equals("")){
					resule = resule +""+ con.result.getString("head_photo") + "Ѭ���Z";
				}
				else{
					break;
				}
			}
				
			return resule;
		} catch (Exception e) {
			// TODO: handle exception
			return "";
		}
	}
	
	public personal_set_bean(String[] data) {
		try {
			String[] date = data;//[0]id [1]�ǳ�nickname [2]signǩ�� [3]head_photoͷ�� [4]background����
			String[] user_data = new String[6];
			String sql_1 = "select * from user_data";
			con.result = con.usercommend.executeQuery(sql_1);
			while(con.result.next()){
				String ID = con.result.getString("ID");
				String nickiname = con.result.getString("nickiname");
				String sign = con.result.getString("sign");
				String head_photo = con.result.getString("head_photo");
				String background = con.result.getString("background");
				String experience = Integer.toString(con.result.getInt("experience"));
				if(ID.equals(date[0])){
					user_data[0] = ID;
					user_data[1] = nickiname;
					user_data[2] = sign;
					user_data[3] = head_photo;
					user_data[4] = background;
					user_data[5] = experience;
				}
			}
			if(user_data[0]==null){   //����һ��ʹ�ù���ʱ�ȸ��û�����ֵ
				user_data[1] = "Ĭ�����ǳ�";
				user_data[2] = "����˺���~ɶ��ûд";
				user_data[3] = "1";
				user_data[4] = "1";
				user_data[5] = "0";
			}
			for(int i=0;i<5;i++){
				if(date[i]!=null&&date[i]!=""){
				  user_data[i] = date[i];
				}
			}
			for(int i=0;i<5;i++){
				System.out.println(date[i]);
			}
			StringTokenizer st = new StringTokenizer(user_data[4], "/");
			while(st.hasMoreTokens()){
				user_data[4] = st.nextToken();
			}
			StringTokenizer sts = new StringTokenizer(user_data[4], ".");
			user_data[4] = sts.nextToken();
			sts = new StringTokenizer(user_data[3], ".");
			user_data[3] = sts.nextToken();
			System.out.println("ȡ���ɹ�");
			for(int i=0;i<6;i++){
				System.out.println(user_data[i]);
			}
			String sql_2 = "replace into user_data set ID='"+user_data[0]+
					       "',nickiname='"+user_data[1]+
					       "',sign='"+user_data[2]+
					       "',head_photo='"+user_data[3]+
					       "',background='"+user_data[4]+
					       "',experience='"+user_data[5]+
					       "'";
			con.usercommend.executeUpdate(sql_2);
			System.out.println("����ɹ�");
		
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
