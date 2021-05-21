package bean;

import java.sql.SQLException;

import dao.MySQL_connect;
import dao.add_web_journal;

public class user_personal_homepage_write_bean {

	public String ID = "";// 编辑者的ID
	public String num = "";// 正在编辑的模块编号
	public MySQL_connect con = new MySQL_connect();
	public String user_personal_card = "<div style='background-color: #FFCAB0;width:100%;height:50px;line-hight:50px;text-align:center;margin-bottom:1px;color:#ffffff;border-radius:5px 5px 0px 0px;'><font style='font-size: 18px;'>我的积分卡片</font></div><div style='width: 100%;height: 40px;line-height:30px;background-color: #FFFFFF;'><div style='width: 33.33%;height: 35px;float: left;text-align: center;line-height: 35px; small-font'>积分</div><div style='width: 33.33%;height: 35px;float: left;text-align: center;line-height: 35px; small-font'>已完成</div><div style='width: 33.33%;height: 35px;float: left;text-align: center;background-color:white;line-height: 35px; small-font'>排名</div></div><div style='color: #FFCAB0;'><div style='width: 33.33%;height: 35px;float: left;text-align: center;line-height: 35px; font-size: 18px;'>|%|score|%|</div><div style='width: 33.33%;height: 35px;float: left;text-align: center;line-height: 35px; font-size: 18px;'>|%|finish|%|</div><div style=' width: 33.33%;height: 35px;float: left;text-align: center;background-color:white;line-height: 35px; font-size: 18px;'>|%|rank|%|</div></div>";
	public String user_personal_head = "";
	public String first_page = "<div style='font-size:100px;color:blue;'>hello world</div></br>你现在知道怎么做了吧~";

	public user_personal_homepage_write_bean(String ID, String num) {//初始化bean的ID和正在编辑的模块编号
		this.ID = ID;
		this.num = num;

	}

	public String getblock() {//获取指定模块的数据
		String block = "";
		String sql = "select block_" + this.num + " from user_personal_homepage where ID='"+this.ID+"'";
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);
			this.con.result.next();
			block = this.con.result.getString("block_" + this.num + "");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return block;
	}

	public void savedata(String data) {//保存用户编写的代码
		data = data.replace("'", "\"");
		String sql = "update user_personal_homepage set reblock_" + this.num + "='" + data + "' where ID='" + this.ID
				+ "'";
		try {
			this.con.usercommend.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		add_web_journal add_journal = new add_web_journal(this.ID);
		add_journal.noothers("保存个人主页模块代码，模块编号为："+num+"");
	}

	public String readedata() {//读取用户编写的代码
		String block = "";
		String sql = "select reblock_" + this.num + " from user_personal_homepage where ID='" + this.ID + "'";
		System.out.println(sql);
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);
			this.con.result.next();
			block = this.con.result.getString("reblock_" + this.num + "");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		add_web_journal add_journal = new add_web_journal(this.ID);
		add_journal.noothers("读取个人主页模块代码，模块编号为："+num+"");
		return block;
	}

	public void writrblock(String data) {//写入用户的代码用于个人页面展示
		if (data.equals("<div style='font-size:100px;color:blue;'>hello world</div></br>你现在知道怎么做了吧~")) {
			data = "";
		}
		data = data.replace("'", "\"");
		String sql = "update user_personal_homepage set block_" + this.num + "='" + data + "' where ID='" + this.ID
				+ "'";
		try {
			this.con.usercommend.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		add_web_journal add_journal = new add_web_journal(this.ID);
		add_journal.noothers("提交个人主页模块代码，模块编号为："+num+"");
	}

	public void openblock() {//当用户积分达到特定值后 可调用此函数开启新的模块
		String sql = "select block_" + this.num + " from user_personal_homepage where ID='" + this.ID + "'";
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);
			this.con.result.next();
			if (this.con.result.getString("block_" + this.num + "").equals("not_allow_to_use")) {
				sql = "update user_personal_homepage set block_" + this.num + "='' where ID='" + this.ID + "'";
				this.con.usercommend.executeUpdate(sql);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		add_web_journal add_journal = new add_web_journal(this.ID);
		add_journal.noothers("开启新的个人主页模块，模块编号为："+num+"");
	}

}
