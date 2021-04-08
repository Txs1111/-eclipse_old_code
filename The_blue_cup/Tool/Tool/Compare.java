package Tool;

public class Compare {
	/**
	 * @param arr
	 * @return 获取数组中最小值
	 */
	public static int max_arr(int[] arr) {
		for (int i = 0; i < arr.length - 1; i++) {
			if (arr[i + 1] < arr[i]) {
				Tool.Swap.swap_arr(arr, i, i + 1);
			}

		}
		return arr[arr.length - 1];
	}

	/**
	 * @param arr
	 * @param index
	 * @return 获取数组中前n个数的最小值
	 */
	public static int max_arr_index(int[] arr, int n) {
		for (int i = 0; i < n; i++) {
			if (arr[i + 1] < arr[i]) {
				Tool.Swap.swap_arr(arr, i, i + 1);
			}

		}
		return arr[arr.length - 1];
	}

	/**
	 * @param arr
	 * @return 数组是不是按从小到大顺序排列
	 */
	public static String if_litter_big(int[] arr) {
		String if_litter_big = "数组是从小到大排列的";
		for (int i = 0; i < arr.length - 1; i++) {
			if (arr[i] > arr[i + 1]) {
				if_litter_big = "数组是NO从小到大排列的";
				System.out.println(if_litter_big);
				return if_litter_big;
			}
		}
		System.out.println(if_litter_big);
		return if_litter_big;
	}

	/**
	 * @param arr
	 * @return 数组是不是按从大到小顺序排列
	 */
	public static String if_big_litter(int[] arr) {
		String if_big_litter = "数组是从大到小排列的";
		for (int i = 0; i < arr.length - 1; i++) {
			if (arr[i] < arr[i + 1]) {
				if_big_litter = "数组是NO从大到小排列的";
				System.out.println(if_big_litter);
				return if_big_litter;
			}
		}
		System.out.println(if_big_litter);
		return if_big_litter;
	}

}
