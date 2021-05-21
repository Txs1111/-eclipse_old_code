package bean;

import java.sql.SQLException;

import dao.MySQL_connect;
import dao.add_web_journal;

public class user_personal_homepage_bean {
	public String ID = "";
	public MySQL_connect con = new MySQL_connect();
	Handle_date date = new Handle_date();
	public user_personal_homepage_bean(String ID) {
		this.ID = ID;
	}
	public int getalllike(){
		String sql="select * from user_personal_homepage_like where getID='"+this.ID+"'";
		int num=0;
		try {
			this.con.result=this.con.usercommend.executeQuery(sql);
			while(this.con.result.next()){
				num++;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return num;
	}
	public int check_if_like(String ID) {
		
		String sql = "select * from user_personal_homepage_like where giveID='" + ID + "'and date='" + date.getDate()
				+ "' and getID='"+this.ID+"'";
		System.out.println(sql);
		int result = 0;
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);
			if (this.con.result.next()) {
				result = 1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	public void like(String visitID) {
		String sql = "select * from user_personal_homepage_like";
		int num=1;
		try {
			this.con.result=this.con.usercommend.executeQuery(sql);
			while(this.con.result.next()){
				 num++;
			}
			sql = "insert into user_personal_homepage_like value ('"+num+"','"+this.ID+"','"+visitID+"','"+date.getDate()+"')";
			this.con.usercommend.executeUpdate(sql);
			sql="select ID from text";
			this.con.result=this.con.usercommend.executeQuery(sql);
			while(this.con.result.next()){
				 num=this.con.result.getInt("ID")+1;
			}
			sql="insert into text value ('"+num+"','1','"+this.ID+"','tips','"+getname(visitID)+"给你的个人主页点了赞','"+date.getDate()+"','2')";
			add_web_journal add_journal = new add_web_journal(visitID);
			add_journal.oneelse(ID, "个人主页点赞");
			this.con.usercommend.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public String getname(String toID) {
		String sql = "select name from user_personal_data where ID='" + toID + "'";
		String name = "";
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);
			this.con.result.next();
			name = this.con.result.getString("name");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return name;
	}

	public void creat_page(String ID) {
		String sql = "select * from  user_personal_homepage where ID='"+ID+"'";
		try {
			this.con.result=this.con.usercommend.executeQuery(sql);
			if (!this.con.result.next()) {
				sql = "select * from user_personal_homepage";
				this.con.result = this.con.usercommend.executeQuery(sql);
				int num = 1;
				while (this.con.result.next()) {
					num++;
				}
				sql = "insert into user_personal_homepage value('" + num + "','" + ID
						+ "','','','','','','not_allow_to_use','not_allow_to_use','','','','','','','')";
				this.con.usercommend.executeUpdate(sql);
				add_web_journal add_journal = new add_web_journal(ID);
				add_journal.noothers("创建个人主页");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public String getblock(String num) {
		String block = "";
		String sql = "select block_" + num + " from user_personal_homepage where ID='" + this.ID + "'";
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);

			if (this.con.result.next()) {
				block = this.con.result.getString("block_" + num + "");
			} else {
				block = "nouser";
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return block;
	}

	public void writrblock(String num, String data) {
		
		data = data.replace("'", "\"");
		String sql = "update user_personal_homepage set block_" + num + "='" + data + "' where ID='" + this.ID + "'";
		System.out.println(sql);
		try {
			this.con.usercommend.executeUpdate(sql);
			add_web_journal add_journal = new add_web_journal(this.ID);
			add_journal.noothers("提交个人主页模块代码，模块编号为："+num+"");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void openblock(String num) {
		String sql = "select block_" + num + " from user_personal_homepage where ID='" + this.ID + "'";
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);
			this.con.result.next();
			if (this.con.result.getString("block_" + num + "").equals("not_allow_to_use")) {
				sql = "update user_personal_homepage set block_" + num + "='' where ID='" + this.ID + "'";
				this.con.usercommend.executeUpdate(sql);
			}
			add_web_journal add_journal = new add_web_journal(this.ID);
			add_journal.noothers("开启个人主页模块，模块编号为："+num+"");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
