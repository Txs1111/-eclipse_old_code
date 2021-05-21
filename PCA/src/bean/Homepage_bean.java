package bean;

import java.sql.SQLException;

import dao.MySQL_connect;

public class Homepage_bean {
	public String ID = null;				//用户的ID
	public MySQL_connect con=new MySQL_connect();			//数据库的连接对象 自动连接
	public String nickiname;				//用户昵称
	public String sign;						//用户签名
	public int level;						//用户等级	
	public String headphoto;				//用户头像	
	public String background;				//用户背景
	public String role;

//	public static void main(String[] args) {			//测试用主函数
//		Homepage_bean bean = new Homepage_bean("000");	//手动添加ID		
//	}

	public Homepage_bean(String ID){	//传递用户ID 并且改写当前类的public ID
		this.ID= ID;	
		String sql = "select role from users_login where ID='" + this.ID + "'";
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);
			this.con.result.next();
			this.role = this.con.result.getString("role");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	// 签到模块---------------用于查询当前用户当月已签到的所有日期-------------------------------------------------------------->
	public String singed_calendar() {
		String dates = "";						//返回的全部日期对象
		Handle_date date = new Handle_date();	//获取当前日期
		String year = date.getyear();			//获取年
		String month = date.getMonth();			//获取月
		String sql = "select signin_time from calendar where ID='" + this.ID + "' and  signin_time like'" + year + "-"
				+ month + "%'";
		System.out.println("<----Homepage_bean.java---->");
		System.out.println(sql);
		System.out.println("<-------------------------->");
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);//查询所有的日期
			//把所有的日期拼接为一个String字符串 分隔符为" _ "
			while (this.con.result.next()) {
				if (dates.equals("")) {
					dates = dates + String.format("%td", this.con.result.getDate("signin_time"));
				} else {
					dates = dates + "_" + String.format("%td", this.con.result.getDate("signin_time"));
				}
			}
			System.out.println(dates);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return dates;//返回全部日期
	}

	// 头部模块------------------------------------------------------------------------------------------------>
	public void head() {
		String sql = "select * from user_data where ID='" + this.ID + "'";
		try {
			con.result = con.usercommend.executeQuery(sql);			//获取目标用户的头部模块信息
			con.result.next();
			this.nickiname = con.result.getString("nickiname");		//昵称
			this.sign = con.result.getString("sign");				//签名
			this.headphoto = con.result.getString("head_photo");	//头像
			this.background = con.result.getString("background");	//背景
			this.level = con.result.getInt("experience");			//经验
			count_level count = new count_level();					//用于根据用户的经验 计算出用户的等级的对象
			this.level = count.count(this.level);					//计算等级
//			System.out.println("<----homepage_bean.java---->");
//			System.out.println("nickiname:" + this.nickiname);
//			System.out.println("sign:" + this.sign);
//			System.out.println("level:" + this.level);
//			System.out.println("headphoto:" + this.headphoto);
//			System.out.println("background" + this.background);
//			System.out.println("<-------------------------->");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 宠物对话------------------------------------------------------------------------------------------>
	public String[] get_content() {
		try {
			int i = 0;
			String sql = "select * from pet_tips";
			this.con.result = con.usercommend.executeQuery(sql);
			this.con.result.last();//定位到结果集的最后一个
			int count = this.con.result.getRow();//返回当前是哪一行
			String[] str = new String[count];
			this.con.result.beforeFirst();//回到第一行结果集
			while (this.con.result.next()) {
				str[i] = this.con.result.getString("tips");
				i++;
			}
			return str;
		} catch (SQLException e) {
			String[] str = new String[1];
			str[0] = "喵~";
			return str;
		}
	}

	// 部门卡片------------------------------------------------------------------------------------------>
	public String apartment() {
		int apartment = 0;
		String sql = "select apartment from user_personal_data where ID='" + this.ID + "'";
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);//获取部门
			this.con.result.next();
			// 1 活动部 2宣传部 3外联部 4技术部 5运营部 6财务部
			apartment = Integer.parseInt(this.con.result.getString("apartment"));

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String apart = "";
		if (apartment == 1) {
			apart = "活动部";
		}
		if (apartment == 2) {
			apart = "宣传部";
		}
		if (apartment == 3) {
			apart = "外联部";
		}
		if (apartment == 4) {
			apart = "技术部";
		}
		if (apartment == 5) {
			apart = "运营部";
		}
		if (apartment == 6) {
			apart = "财务部";
		}
		return apart;
	}

	//查询当前用户当天是否已签到
	public String check_clendar() {
		Handle_date date = new Handle_date();
		String ID = this.ID;

		String sql = "select * from calendar where ID='" + this.ID + "' and signin_time='" + date.getyear() + "-"
				+ date.getMonth() + "-" + date.getDay() + "'";
		try {
			this.con.result = con.usercommend.executeQuery(sql);

			if (con.result.next()) {
				ID = this.ID;
			} else {
				ID = null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ID;  //查询 如果是已签到 返回用户ID
	}
	

}
