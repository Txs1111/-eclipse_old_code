package 冒泡排序4;

import Tool.*;

public class 冒泡排序 {
	public static void main(String[] args) {
		int[] arr = new int[] { 4, 6, 9, 5, 0, 7, 8 };
		Print.print_result(bubbling(arr));
	}

	/**
	 * @param arr
	 * @return 优化思路，第一层循环是代表次数的意思
	 */
	public static int[] bubbling(int[] arr) {
		Print.print_start(arr);
		for (int i = arr.length - 1; i > 0; i--) {
			for (int j = 0; j < i; j++) {
				if (arr[j + 1] < arr[j]) {
					Swap.swap_arr(arr, j + 1, j);
//					Print.print_arr(arr);
				}
			}
		}
		return arr;
	}
}
