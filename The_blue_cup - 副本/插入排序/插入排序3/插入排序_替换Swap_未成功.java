package ��������3;

import Tool.*;

public class ��������_�滻Swap_δ�ɹ� {
	public static void main(String[] args) {
		int[] arr = Create.create_arr(120);
		Print.print_result(sort(arr));
		Compare.if_litter_big(arr);
	}

	/**
	 * @param arr
	 * @return �滻swap����
	 */
	public static int[] sort(int[] arr) {
		Print.print_start(arr);
		int count = 0;
		for (int i = 1; i < arr.length; i++) {
			int t = arr[i];
			for (int j = i; j > 0; j--) {
				count++;
				if (arr[j - 1] > t) {
					arr[j] = arr[j - 1];
				} else if (arr[j - 1] < t) {
					arr[j] = t;
					t = arr[j - 1];
				}
				Print.print_arr(arr);
				// Swap.swap_arr(arr, j, j - 1);
			}

		}
		// System.out.println(count);
		return arr;
	}
}
