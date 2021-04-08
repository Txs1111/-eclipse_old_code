package Ã°ÅİÅÅĞò×î¼ò·½·¨;

import Tool.*;

public class Ã°ÅİÅÅĞò {
	public static void main(String[] args) {
		int[] arr = Create.create_arr(10);
		/*
		 * int[] arr = new int[] { 0, 0, 2, 6, 7, 8, 9, 9, 9, 10, 10, 11, 12,
		 * 12, 13, 14, 18, 18, 18, 18, 19, 19, 20, 20, 22, 22, 23, 23, 24, 24,
		 * 26, 26, 27, 27, 27, 30, 30, 33, 34, 34, 36, 38, 40, 41, 43, 43, 43,
		 * 43, 44, 45, 46, 47, 49, 49, 50, 51, 51, 53, 54, 55, 59, 59, 60, 62,
		 * 62, 62, 65, 65, 65, 66, 66, 66, 67, 70, 71, 76, 76, 76, 77, 79, 80,
		 * 81, 81, 83, 84, 84, 84, 85, 85, 85, 87, 87, 88, 88, 88, 91, 94, 94,
		 * 95, 97 };
		 */
		Print.print_result(bubbling(arr));
		Compare.if_litter_big(arr);
	}

	/**
	 * @param arr
	 * @return Ã°ÅİÅÅĞòµÄ×î¼òĞ´·¨
	 */
	public static int[] bubbling(int[] arr) {
		Print.print_start(arr);
		boolean ifalltrue = true;
		for (int i = 0; i < arr.length - 1; ++i) {
			ifalltrue = true;
			for (int j = 0; j < arr.length - i - 1; ++j) {
				if (arr[j + 1] < arr[j]) {
					Swap.swap_arr(arr, j, j + 1);
					ifalltrue = false;
				}
			}
			if (ifalltrue) {
				return arr;
			}
		}
		return arr;
	}
}
