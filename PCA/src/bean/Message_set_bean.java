package bean;

import java.sql.SQLException;

import dao.MySQL_connect;

public class Message_set_bean {
	MySQL_connect con = new MySQL_connect();
	public String[] Message_set_bean(String[] data) {
		String[] user_data = new String[8];
		try {
			String[] date = data;//[0]id [1]����name [2]clas�༶ [3]collegeѧԺ [4]tel�绰[5]e-mail����[6]apartment����[7]birthday����
			String sql_1 = "select * from user_personal_data";
			con.result = con.usercommend.executeQuery(sql_1);
			while(con.result.next()){
				String ID = con.result.getString("ID");
				String name = con.result.getString("name");
				String clas = con.result.getString("clas");
				String college = con.result.getString("college");
				String tel = con.result.getString("tel");
				String e_mail = con.result.getString("mail");
				String apartment = Integer.toString(con.result.getInt("apartment"));
				String birthday = con.result.getString("birthday");
				if(ID.equals(date[0])){
					user_data[0] = ID;
					user_data[1] = name;
					user_data[2] = clas;
					user_data[3] = college;
					user_data[4] = tel;
					user_data[5] = e_mail;
					user_data[6] = apartment;
					user_data[7] = birthday;
				}
			}
			if(user_data[0]==null){   //����һ��ʹ�ù���ʱ�ȸ��û�����ֵ
				user_data[0] = "2222";
				user_data[1] = "δ¼��";
				user_data[2] = "1";
				user_data[3] = "1";
				user_data[4] = "1";
				user_data[5] = "1";
				user_data[6] = "1";
				user_data[7] = "2020-01-01";
			}
			for(int i=0;i<8;i++){
				if(date[i]!=null&&date[i]!=""){
				  user_data[i] = date[i];
				}
			}
			for(int i=0;i<8;i++){
				System.out.println(date[i]);
			}
			System.out.println("ȡ���ɹ�");
			
			String sql_2 = "replace into user_personal_data set ID='"+user_data[0]+
					       "',name='"+user_data[1]+
					       "',clas='"+user_data[2]+
					       "',college='"+user_data[3]+
					       "',tel='"+user_data[4]+
					       "',mail='"+user_data[5]+
					       "',apartment='"+user_data[6]+
					       "',birthday='"+user_data[7]+
					       "'";
			con.usercommend.executeUpdate(sql_2);
			System.out.println("����ɹ�");
			for(int i=0;i<8;i++){
				System.out.println(user_data[i]);
			}
		
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user_data;
	}

}
