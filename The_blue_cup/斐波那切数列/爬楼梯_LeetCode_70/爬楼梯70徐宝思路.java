package ��¥��_LeetCode_70;

public class ��¥��70�챦˼· {
	public static void main(String[] args) {
		System.out.println(�챦˼·(20));
	}

	public static int �챦˼·(int n) {
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
				m[n - 1] = �챦˼·(n - 1) + �챦˼·(n - 2);
			} else {
				m[n - 1] = m[n - 2] + m[n - 3];
			}

		}
		return m[n - 1];
	}
}
