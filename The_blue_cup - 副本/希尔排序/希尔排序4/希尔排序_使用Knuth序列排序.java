package Ï£¶ûÅÅĞò4;

import Tool.Create;
import Tool.Print;
import Tool.Swap;

public class Ï£¶ûÅÅĞò_Ê¹ÓÃKnuthĞòÁĞÅÅĞò {
	public static void main(String[] args) {
		int[] arr = Create.create_arr(12000);
		// arr = Create.create_big_litter_arr(12000);
		Print.print_result(Ï£¶ûÅÅĞò(arr));
	}

	/**
	 * @param arr
	 * @return
	 * 
	 * 
	 */
	public static int[] Ï£¶ûÅÅĞò(int[] arr) {
		Print.print_start(arr);
		int number = 0;
		int h = 1;
		while (h <= arr.length / 3) {
			h = h * 3 + 1;
		}
		for (int gap = h; gap > 0; gap = (gap - 1) / 3) {
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
