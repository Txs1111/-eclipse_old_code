package ð������4;

import Tool.*;

public class ð������ {
	public static void main(String[] args) {
		int[] arr = new int[] { 4, 6, 9, 5, 0, 7, 8 };
		Print.print_result(bubbling(arr));
	}

	/**
	 * @param arr
	 * @return �Ż�˼·����һ��ѭ���Ǵ����������˼
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
