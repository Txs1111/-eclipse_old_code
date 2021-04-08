package 希尔排序3;

import Tool.Create;
import Tool.Print;
import Tool.Swap;

public class 希尔排序_希尔排序_总结与插入排序的不同 {
	public static void main(String[] args) {
		int[] arr = Create.create_arr(12000);
		// arr = Create.create_big_litter_arr(12000);
		Print.print_result(希尔排序(arr));
	}// 71994000//135094347
		// 71994000//74768

	/**
	 * @param arr
	 * @return
	 * 
	 * 		优化结构，使计算最少次数
	 * 
	 *         优化语句
	 *         
	 *         总结：希尔牺牲了for循环次数，换来的较少的交换次数
	 *         而插入则for循环次数较少，但是交换的次数太多了
	 */
	public static int[] 希尔排序(int[] arr) {
		Print.print_start(arr);
		int number = 0;
		for (int gap = arr.length >> 1; gap > 0; gap >>= 1) {
			for (int j = gap; j < arr.length; j++) {
				for (int j2 = j; j2 > gap - 1; j2 -= gap) {
					if (arr[j2] < arr[j2 - gap]) {
						number++;
						Swap.swap_arr(arr, j2, j2 - gap);
					}
				}
			}
		}
		System.out.println("number:" + number);
		return arr;
	}
}
