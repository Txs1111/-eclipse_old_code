package ϣ������2;

import Tool.Compare;
import Tool.Create;
import Tool.Print;
import Tool.Swap;

public class ϣ������_�����Լ���ϣ������ {
	public static void main(String[] args) {
		int[] arr = Create.create_arr(12);
//		arr = Create.create_big_litter_arr(12);
		Print.print_result(ϣ������(arr, 13));
	}

	public static int[] ϣ������(int[] arr, int gap) {
		Print.print_start(arr);
		for (; gap > 0; gap /= 2) {
			for (int j = gap; j < arr.length; j++) {
				for (int j2 = j; j2 > gap - 1; j2 -= gap) {
					if (arr[j2] < arr[j2 - gap]) {
						Swap.swap_arr(arr, j2, j2 - gap);
					}
				}
			}
		}

		return arr;
	}
}
