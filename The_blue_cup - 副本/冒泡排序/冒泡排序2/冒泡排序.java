package ц╟ещеепР2;

import Tool.Print;
import ц╟ещеепР.Tool;

public class ц╟ещеепР {
	public static void main(String[] args) {
		int[] arr = new int[] { 4, 6, 9, 5, 0, 7, 8 };
		Tool.print_result(bubbling(arr));
	}

	public static int[] bubbling(int[] arr) {
		for (int i = 1; i < arr.length; i++) {
			for (int j = 0; j < arr.length - i; j++) {
				if (arr[j + 1] < arr[j]) {
					Tool.swap_arr(arr, j + 1, j);
					Print.print_arr(arr);
				}
			}
		}
		return arr;
	}
}
