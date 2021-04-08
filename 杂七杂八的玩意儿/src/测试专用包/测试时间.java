package 测试专用包;

import java.text.SimpleDateFormat;
import java.util.Date;

public class 测试时间 {
	public static void main(String[] args) {
		long sa = new java.util.Date().getTime();
		try {
			boolean a = judgmentDate("2021-03-12 09:40:00", 2);
			System.out.println(a);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(sa);
	}

	/**
	 * 判断是否超过多少小时 如：24
	 *
	 * @param tableTime
	 *            业务时间
	 * @param hour
	 *            多少小时
	 * @return boolean
	 * @throws Exception
	 * parse:将String类型数据转化为时间类型eg："2021-03-12 09:40:00"==>Fri Mar 12 09:40:00 CST 2021
	 * format:格式化时间，如SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-d HH:mm:ss");里面的类型
	 */
	public static boolean judgmentDate(String tableTime, Integer hour) throws Exception {
		// 当前时间

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-d HH:mm:ss");

		Date start = sdf.parse(tableTime);// 业务时间
		System.out.println(start);
		Date end = new Date();
		System.out.println(sdf.format(new Date()));// new Date()为获取当前系统时间
		System.out.println(new Date());// new Date()为获取当前系统时间
		// Date end = sdf.parse(sdf.format(new Date()));
		System.out.println(sdf.parse(sdf.format(new Date())));
		long cha = end.getTime() - start.getTime();

		if (cha < 0) {

			return false;
		}

		double result = cha * 1.0 / (1000 * 60 * 60);

		if (result <= 24) {

			return true;// 是小于等于 hour 小时

		} else {

			return false;

		}

	}
}
