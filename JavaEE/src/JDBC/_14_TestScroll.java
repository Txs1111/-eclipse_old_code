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
			stmt = con.createStatement(	ResultSet.TYPE_SCROLL_INSENSITIVE, // �������ж�
										ResultSet.CONCUR_READ_ONLY);// ����������ʱֻ�ܶ�ȡ����������� ʹ���Թ�������
			String sql = "select * from test;";
			rs = stmt.executeQuery(sql);
			System.out.println(sql);
			rs.next();
			System.out.println(rs.getInt(1)); // ��ӡ���ݿ��һ��
			rs.last(); // ���һ������
			System.out.println("��ӡ���һ�����ݵĵ�һ��:" + rs.getString(1)); // ��ӡ���һ�����ݵĵ�һ��
			System.out.println("�ǲ������һ��:" + rs.isLast()); // �ǲ������һ��
			System.out.println("�ǲ������һ����ǰһ��:" + rs.isAfterLast()); // �ǲ������һ����ǰһ��
			System.out.println("��ǰ������¼�ǵڼ���:" + rs.getRow()); // ##��ǰ������¼�ǵڼ���
			rs.previous(); // #########��ǰһ��
			System.out.println(rs.getString(1));
			int zhiding = 3;
			rs.absolute(zhiding); // #########ָ��λ��
			System.out.println("ָ��λ��" + zhiding + ":" + rs.getString(1));
			rs.close();
			stmt.close();
			con.close();
			System.out.println("���ݿ��һ�б��������֣���֪��Ϊʲô");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
