package ��������2;

import Tool.*;

public class ��������_�Ż����д�� {
	public static void main(String[] args) {
		int[] arr = Create.create_arr(12000);
		arr = Create.create_big_litter_arr(12000);
		Print.print_result(sort(arr));
		Compare.if_litter_big(arr);
	}

	/**
	 * @param arr
	 * @return �Ż����
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
