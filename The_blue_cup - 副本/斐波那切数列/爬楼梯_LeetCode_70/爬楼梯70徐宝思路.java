package 爬楼梯_LeetCode_70;

public class 爬楼梯70徐宝思路 {
	public static void main(String[] args) {
		System.out.println(徐宝思路(20));
	}

	public static int 徐宝思路(int n) {
		int[] m = new int[n];
		if (n == 1) {
			return 1;
		}
		if (n == 2) {
			return 2;
		} else {
			m[0] = 1;
			m[1] = 2;
			if (m[n - 2] == 0 || m[n - 3] == 0) {
				m[n - 1] = 徐宝思路(n - 1) + 徐宝思路(n - 2);
			} else {
				m[n - 1] = m[n - 2] + m[n - 3];
			}

		}
		return m[n - 1];
	}
}
