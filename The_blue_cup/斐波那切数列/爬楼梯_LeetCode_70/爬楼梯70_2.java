package ��¥��_LeetCode_70;

public class ��¥��70_2 {
	public static void main(String[] args) {
		System.out.println(p(45));
	}

	/**
	 * @param n
	 * @return
	 * �ݹ�ʵ�֣�����ʱ�临�Ӷ�̫����
	 */
	public static int p(int n) {
		int[] node = new int[n];
		node[0] = 1;
		if (n > 2)
			node[1] = 2;
		for (int i = 2; i < node.length; i++) {
			node[i] = node[i - 1] + node[i - 2];
		}
		if (n == 1)
			return 1;
		else if (n == 2)
			return 2;
		else
			return node[n - 1];

	}

}
