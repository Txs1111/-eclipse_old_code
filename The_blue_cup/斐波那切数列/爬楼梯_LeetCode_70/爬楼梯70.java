package ��¥��_LeetCode_70;

public class ��¥��70 {
	public static void main(String[] args) {
		System.out.println(pp(45));
	}

	/**
	 * @param n
	 * @return
	 * �ӵ�һ�������㣬��ÿһ�����������������Ȼ�����
	 */
	public static int pp(int n) {
		if (n == 1) {
			return 1;
		}
		if (n == 2) {
			return 2;
		} else {
			return pp(n - 1) + pp(n - 2);
		}
	}
}
