package JDBC;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class _14_TestScroll {
	public static void main(String[] args) {
		try {
			Connection con = null;
			Statement stmt = null;
			ResultSet rs = null;
			String url = "jdbc:mysql:"
					+ "//localhost:3306/cs?serverTimezone=UTC&useUnicode=true&characterEncoding=UTF-8";
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, "root", "");
			stmt = con.createStatement(	ResultSet.TYPE_SCROLL_INSENSITIVE, // 降低敏感度
										ResultSet.CONCUR_READ_ONLY);// 当并发处理时只能读取这里面的内容 使可以滚动处理
			String sql = "select * from test;";
			rs = stmt.executeQuery(sql);
			System.out.println(sql);
			rs.next();
			System.out.println(rs.getInt(1)); // 打印数据库第一列
			rs.last(); // 最后一个数据
			System.out.println("打印最后一行数据的第一列:" + rs.getString(1)); // 打印最后一行数据的第一列
			System.out.println("是不是最后一个:" + rs.isLast()); // 是不是最后一个
			System.out.println("是不是最后一个的前一个:" + rs.isAfterLast()); // 是不是最后一个的前一个
			System.out.println("当前这条记录是第几条:" + rs.getRow()); // ##当前这条记录是第几条
			rs.previous(); // #########向前一个
			System.out.println(rs.getString(1));
			int zhiding = 3;
			rs.absolute(zhiding); // #########指定位置
			System.out.println("指定位置" + zhiding + ":" + rs.getString(1));
			rs.close();
			stmt.close();
			con.close();
			System.out.println("数据库第一行必须是数字，不知道为什么");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
