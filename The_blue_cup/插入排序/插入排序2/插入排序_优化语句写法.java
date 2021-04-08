package 插入排序2;

import Tool.*;

public class 插入排序_优化语句写法 {
	public static void main(String[] args) {
		int[] arr = Create.create_arr(12000);
		arr = Create.create_big_litter_arr(12000);
		Print.print_result(sort(arr));
		Compare.if_litter_big(arr);
	}

	/**
	 * @param arr
	 * @return 优化语句
	 */
	public static int[] sort(int[] arr) {
		Print.print_start(arr);
		int count = 0;
		for (int i = 1; i < arr.length; i++) {
			for (int j = i; j > 0 && arr[j] < arr[j - 1]; j--) {
				count++;
				Swap.swap_arr(arr, j, j - 1);
				// Print.print_arr(arr);
			}

		}
		System.out.println("count:"+count);
		return arr;
	}
}
