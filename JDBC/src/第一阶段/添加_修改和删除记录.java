package 第一阶段;

import java.sql.*;

public class 添加_修改和删除记录 {
	static Connection con;
	static PreparedStatement ps;
	static ResultSet res;

	public Connection getConnection() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("数据库加载成功");
		con = DriverManager.getConnection("jdbc:mysql:" + "//localhost:3306/test?serverTimezone=UTC", "root",
				"123456");
		System.out.println("数据库连接成功");
		return con;
	}

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		添加_修改和删除记录 c = new 添加_修改和删除记录();
		con = c.getConnection();

		try {
			ps = con.prepareStatement("select * from tb_stu");
			res = ps.executeQuery();
			System.out.println("执行添加、修改、删除前数据");
			while (res.next()) {
				String id = res.getString(1);
				String name = res.getString("name");
				String sex = res.getString("sex");
				String birthday = res.getString("birthday");
				System.out.print("编号："+id);
				System.out.print("姓名："+name);
				System.out.print("性别："+sex);
				System.out.println("生日：" + birthday);
			}
			ps = con.prepareStatement("insert into tb_stu(name,sex,birthday) values(?,?,?)");
			ps.setString(1, "张一");
			ps.setString(2, "女");
			ps.setString(3, "2012-12-1");
			ps.executeUpdate();
			Statement stmt = con.createStatement();
			stmt.executeUpdate("delete from tb_stu where id=1");
			ps = con.prepareStatement("select * from tb_stu");
			res = ps.executeQuery();
			System.out.println("执行增加、修改、删除之后的数据");
			while (res.next()) {
				String id = res.getString(1);
				String name = res.getString("name");
				String sex = res.getString("sex");
				String birthday = res.getString("birthday");
				System.out.print("编号："+id);
				System.out.print("姓名："+name);
				System.out.print("性别："+sex);
				System.out.println("生日：" + birthday);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (res != null) {
				try {
					res.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

		}
	}
}
