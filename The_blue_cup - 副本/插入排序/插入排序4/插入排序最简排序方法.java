package ��������4;

import Tool.*;

public class ��������������򷽷� {
	public static void main(String[] args) {
		int[] arr = Create.create_arr(10);
		Print.print_result(sort(arr));
		Compare.if_litter_big(arr);
	}

	/**
	 * @param arr
	 * @return �滻swap����
	 */
	public static int[] sort(int[] arr) {
		Print.print_start(arr);
		boolean iftrue = true;
		for (int i = 1; i < arr.length; i++) {
			for (int j = i; j > 0; j--) {
				if (arr[j] < arr[j - 1]) {
					Swap.swap_arr(arr, j, j - 1);
					iftrue = false;
				}
				Print.print_arr(arr);
				// Swap.swap_arr(arr, j, j - 1);
			}
			if (iftrue) {
				return arr;
			}
		}
		return arr;
	}
}
