package ц╟ещеепР;

import Tool.Print;

public class ц╟ещеепР {
	public static void main(String[] args) {
		int[] arr = new int[] { 4, 6, 9, 5, 0, 7, 8 };
		Tool.print_result(bubbling(arr));
	}

	/**
	 * @param arr
	 * @return
	 * 
	 */
	public static int[] bubbling(int[] arr) {
		for (int i = 0; i < arr.length - 1; i++) {
			for (int j = 0; j < arr.length - i - 1; j++) {
				if (arr[j + 1] < arr[j]) {
					Tool.swap_arr(arr, j + 1, j);
					Print.print_arr(arr);
				}
			}
		}
		return arr;
	}
}
