package Ã°ÅİÅÅĞò3;

import Tool.*;

public class Ã°ÅİÅÅĞò {
	public static void main(String[] args) {
		int[] arr = new int[] { 4, 6, 9, 5, 0, 7, 8 };
		Print.print_result(bubbling(arr));
	}

	/**
	 * @param arr
	 * @return ÕûºÏTool·½·¨
	 */
	public static int[] bubbling(int[] arr) {
		Print.print_start(arr);
		for (int i = 1; i < arr.length; i++) {
			for (int j = 0; j < arr.length - i; j++) {
				if (arr[j + 1] < arr[j]) {
					Swap.swap_arr(arr, j + 1, j);
					Print.print_arr(arr);
				}
			}
		}
		return arr;
	}
}
