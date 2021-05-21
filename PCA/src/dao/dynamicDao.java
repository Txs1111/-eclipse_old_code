package dao;

import java.sql.*;
import java.util.*;

public class dynamicDao {
	/**
	 * ��ȡ���ݿ������ж�̬���ݣ������list��
	 * 
	 * @return
	 */
	public ArrayList<String> getAllData() {// ��ȡ���ݿ��й�����Ϣ���������ݣ����Ҵ���ArrayList����
		MySQL_connect connect = new MySQL_connect();
		String sql = "select * from dynamic,user_data where user_data.ID=dynamic.ID order by postdate desc,dynamic.ID desc";
		ArrayList<String> value = new ArrayList<>();
		System.out.println("<--------------------------------------->");
		System.out.println("<----------dynamicDao.java-------------->");
		System.out.println("<----------���ڴӷ������ж�ȡ����-------------->");
		System.out.println("<--------------------------------------->");
		try {
			connect.result = connect.usercommend.executeQuery(sql);
			while (connect.result.next()) {
				value.add(connect.result.getString("head_photo"));// ͷ��
				value.add(connect.result.getString("ID"));// ID
				value.add(connect.result.getString("nickiname"));// �ǳ�
				value.add(connect.result.getString("title"));// ����
				value.add(connect.result.getString("content"));// ����
				value.add(connect.result.getString("photourl"));// ����ͼƬ
				value.add(connect.result.getString("postdate"));// ʱ��
				value.add(connect.result.getString("like"));// ������
			}
			int length = value.size();
			/*
			 * for (int i = 0; length-- > 0; i++) { System.out.println("��" + i +
			 * "����" + value.get(i)); }
			 */
			System.out.println("<--------------------------------------->");
			System.out.println("<----------dynamicDao.java-------------->");
			System.out.println("<---------------��ȡ�ɹ�------------------->");
			System.out.println("<--------------------------------------->");

		} catch (SQLException e) {
			System.out.println("dynamicDaoҳ���ȡֵʧ��");
			e.printStackTrace();
		}
		connect.close();
		return value;
	}

	/**
	 * ��ȡgetAllData�����е�ֵ�����������ݴ���Message�����У�������Message����
	 * 
	 * @return
	 */
	public Message data() {// �����е����ݴ��ڶ�Ӧ�Ķ����У�ʹ������
		ArrayList<String> value = getAllData();
		int length = value.size();
		Message node = new Message();
		Message head = new Message();
		int number = 0;
		// System.out.println("dynamicDao�����е�ֵ�У�"+length);
		if (length >= 8) {
			// System.out.println("dynamicDao��ӡ����Ϣnumber��"+number);
			node = new Message(value.get(number++), value.get(number++), value.get(number++), value.get(number++),
					value.get(number++), value.get(number++), value.get(number++), value.get(number++));
			// System.out.println("һ����Ӻ�dynamicDao��ӡ����Ϣnumber��"+number);
			head = node;
			// System.out.println("dynamicDao�ڲ���ϢgetID��"+node.getID());
			// System.out.println("dynamicDao�ڲ���ϢgetContent_photourl��"+node.getContent_photourl());
			// System.out.println("dynamicDao�ڲ���Ϣgethead_photo��"+node.gethead_photo());
			if (length >= 16) {
				while (number < length) {
					node.next = new Message(value.get(number++), value.get(number++), value.get(number++),
							value.get(number++), value.get(number++), value.get(number++), value.get(number++),
							value.get(number++));
					// System.out.println("N����Ӻ�dynamicDao��ӡ����Ϣ��" + number);
					// System.out.println("dynamicDao�ڲ���ϢgetID��"+head.getID());
					// System.out.println("dynamicDao�ڲ���ϢgetContent_photourl��"+head.getContent_photourl());
					// System.out.println("dynamicDao�ڲ���Ϣgethead_photo��"+head.gethead_photo());
					node = node.next;
				}
			}
		} else {
			System.out.println("��̬ҳ������ϢΪ��");
		}
		return head;
	}

	/**
	 * �������ַ�����ָ��ȡ3��ͼƬ��ַ
	 * 
	 * @param message
	 * @return
	 */
	public ArrayList<String> getAllphotourl(Message message) {// ����ڼ�����Ϣ����ȡ���е�ַ����ת�����ӦͼƬ��ַ
		ArrayList<String> url = new ArrayList<>();
		// System.out.println("dynamicDao��ȡÿ��ͼƬ��url��" +
		// message.content_photourl);
		StringTokenizer chart1 = new StringTokenizer(message.content_photourl, "(&)");
		if (chart1.hasMoreTokens()) {
			url.add(chart1.nextToken());
			if (chart1.hasMoreTokens()) {
				url.add(chart1.nextToken());
				if (chart1.hasMoreTokens()) {
					url.add(chart1.nextToken());
				}
			}
		}
		return url;
	}
}

/*
 * //ͨ��request������bai a.jsp�� Car car = new Car();
 * request.setAttribute("objectName",car); try{ //����ֻ����du���·�ʽ����ת��zhi
 * request.getRequestDispatcher("b.jsp").forward(request, response); }catch(){}
 * b.jsp: Car c = (Car)request.getAttribute("objectName"); //ͨ��session��ʽ
 * ����dao��һ��jsp�� Car car = new Car();
 * request.getSession().setAttribute("objectName",car);
 * Ȼ��ֻҪ���������jsp��ͬһ�Ự�������κ�ҳ�涼����ͨ�����·�ʽ�õ�Car���� Car c =
 * (Car)request.getSession().getAttribute("objectName");
 * �����Ļ���������application�У�������
 */