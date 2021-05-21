package dao;

import java.sql.*;
import java.util.*;

public class dynamicDao {
	/**
	 * 读取数据库中所有动态内容，并存进list中
	 * 
	 * @return
	 */
	public ArrayList<String> getAllData() {// 获取数据库中关于消息的所有内容，并且存在ArrayList里面
		MySQL_connect connect = new MySQL_connect();
		String sql = "select * from dynamic,user_data where user_data.ID=dynamic.ID order by postdate desc,dynamic.ID desc";
		ArrayList<String> value = new ArrayList<>();
		System.out.println("<--------------------------------------->");
		System.out.println("<----------dynamicDao.java-------------->");
		System.out.println("<----------正在从服务器中读取数据-------------->");
		System.out.println("<--------------------------------------->");
		try {
			connect.result = connect.usercommend.executeQuery(sql);
			while (connect.result.next()) {
				value.add(connect.result.getString("head_photo"));// 头像
				value.add(connect.result.getString("ID"));// ID
				value.add(connect.result.getString("nickiname"));// 昵称
				value.add(connect.result.getString("title"));// 标题
				value.add(connect.result.getString("content"));// 内容
				value.add(connect.result.getString("photourl"));// 内容图片
				value.add(connect.result.getString("postdate"));// 时间
				value.add(connect.result.getString("like"));// 点赞数
			}
			int length = value.size();
			/*
			 * for (int i = 0; length-- > 0; i++) { System.out.println("第" + i +
			 * "条：" + value.get(i)); }
			 */
			System.out.println("<--------------------------------------->");
			System.out.println("<----------dynamicDao.java-------------->");
			System.out.println("<---------------读取成功------------------->");
			System.out.println("<--------------------------------------->");

		} catch (SQLException e) {
			System.out.println("dynamicDao页面获取值失败");
			e.printStackTrace();
		}
		connect.close();
		return value;
	}

	/**
	 * 读取getAllData方法中的值，将所有数据存入Message对象中，并返回Message对象
	 * 
	 * @return
	 */
	public Message data() {// 将所有的数据存在对应的对象中，使用链表
		ArrayList<String> value = getAllData();
		int length = value.size();
		Message node = new Message();
		Message head = new Message();
		int number = 0;
		// System.out.println("dynamicDao中所有的值有："+length);
		if (length >= 8) {
			// System.out.println("dynamicDao打印了消息number："+number);
			node = new Message(value.get(number++), value.get(number++), value.get(number++), value.get(number++),
					value.get(number++), value.get(number++), value.get(number++), value.get(number++));
			// System.out.println("一次添加后dynamicDao打印了消息number："+number);
			head = node;
			// System.out.println("dynamicDao内部信息getID："+node.getID());
			// System.out.println("dynamicDao内部信息getContent_photourl："+node.getContent_photourl());
			// System.out.println("dynamicDao内部信息gethead_photo："+node.gethead_photo());
			if (length >= 16) {
				while (number < length) {
					node.next = new Message(value.get(number++), value.get(number++), value.get(number++),
							value.get(number++), value.get(number++), value.get(number++), value.get(number++),
							value.get(number++));
					// System.out.println("N次添加后dynamicDao打印了消息：" + number);
					// System.out.println("dynamicDao内部信息getID："+head.getID());
					// System.out.println("dynamicDao内部信息getContent_photourl："+head.getContent_photourl());
					// System.out.println("dynamicDao内部信息gethead_photo："+head.gethead_photo());
					node = node.next;
				}
			}
		} else {
			System.out.println("动态页面中消息为空");
		}
		return head;
	}

	/**
	 * 将对象地址变量分割，获取3张图片地址
	 * 
	 * @param message
	 * @return
	 */
	public ArrayList<String> getAllphotourl(Message message) {// 传入第几条消息，获取其中地址，并转码出对应图片地址
		ArrayList<String> url = new ArrayList<>();
		// System.out.println("dynamicDao获取每个图片的url：" +
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
 * //通过request传对象bai a.jsp： Car car = new Car();
 * request.setAttribute("objectName",car); try{ //这里只能以du如下方式请求转发zhi
 * request.getRequestDispatcher("b.jsp").forward(request, response); }catch(){}
 * b.jsp: Car c = (Car)request.getAttribute("objectName"); //通过session方式
 * 在任dao何一个jsp中 Car car = new Car();
 * request.getSession().setAttribute("objectName",car);
 * 然后只要访问了这个jsp，同一会话的其他任何页面都可以通过如下方式得到Car对象 Car c =
 * (Car)request.getSession().getAttribute("objectName");
 * 其他的还有设置在application中，不常用
 */