package 爬楼梯_LeetCode_70;

public class 爬楼梯70 {
	public static void main(String[] args) {
		System.out.println(pp(45));
	}

	/**
	 * @param n
	 * @return
	 * 从第一个数计算，将每一个数都保存在数组里，然后调用
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
