package ����ר�ð�;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ����ʱ�� {
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
	 * �ж��Ƿ񳬹�����Сʱ �磺24
	 *
	 * @param tableTime
	 *            ҵ��ʱ��
	 * @param hour
	 *            ����Сʱ
	 * @return boolean
	 * @throws Exception
	 * parse:��String��������ת��Ϊʱ������eg��"2021-03-12 09:40:00"==>Fri Mar 12 09:40:00 CST 2021
	 * format:��ʽ��ʱ�䣬��SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-d HH:mm:ss");���������
	 */
	public static boolean judgmentDate(String tableTime, Integer hour) throws Exception {
		// ��ǰʱ��

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-d HH:mm:ss");

		Date start = sdf.parse(tableTime);// ҵ��ʱ��
		System.out.println(start);
		Date end = new Date();
		System.out.println(sdf.format(new Date()));// new Date()Ϊ��ȡ��ǰϵͳʱ��
		System.out.println(new Date());// new Date()Ϊ��ȡ��ǰϵͳʱ��
		// Date end = sdf.parse(sdf.format(new Date()));
		System.out.println(sdf.parse(sdf.format(new Date())));
		long cha = end.getTime() - start.getTime();

		if (cha < 0) {

			return false;
		}

		double result = cha * 1.0 / (1000 * 60 * 60);

		if (result <= 24) {

			return true;// ��С�ڵ��� hour Сʱ

		} else {

			return false;

		}

	}
}
