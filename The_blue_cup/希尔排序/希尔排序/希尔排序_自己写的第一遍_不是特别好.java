package ϣ������;

import Tool.Compare;
import Tool.Create;
import Tool.Print;
import Tool.Swap;

public class ϣ������_�Լ�д�ĵ�һ��_�����ر�� {
	public static void main(String[] args) {
		int[] arr = Create.create_arr(13);
		arr = Create.create_big_litter_arr(12);
		Print.print_result(ϣ������(arr));
	}

	/**
	 * @param arr
	 * @return
	 * 
	 * 		�Լ���д��һ�飬�е�׸��
	 */
	public static int[] ϣ������(int[] arr) {
		int a = 1;
		int gap = 4;
		Print.print_start(arr);
		for (; gap > 0; gap--) {
			for (int i = 0; i < gap; i++) {
				for (int j = gap + i; j < arr.length; j += gap) {
					for (int j2 = j; j2 > gap - 1; j2 -= gap) {
						if (arr[j2] < arr[j2 - gap + a]) {
							Swap.swap_arr(arr, j2, j2 - gap + a);
						}
						a = 0;
					}
				}
			}
		}

		return arr;
	}
}
