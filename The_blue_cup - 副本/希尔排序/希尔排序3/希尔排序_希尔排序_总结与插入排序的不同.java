package ϣ������3;

import Tool.Create;
import Tool.Print;
import Tool.Swap;

public class ϣ������_ϣ������_�ܽ����������Ĳ�ͬ {
	public static void main(String[] args) {
		int[] arr = Create.create_arr(12000);
		// arr = Create.create_big_litter_arr(12000);
		Print.print_result(ϣ������(arr));
	}// 71994000//135094347
		// 71994000//74768

	/**
	 * @param arr
	 * @return
	 * 
	 * 		�Ż��ṹ��ʹ�������ٴ���
	 * 
	 *         �Ż����
	 *         
	 *         �ܽ᣺ϣ��������forѭ�������������Ľ��ٵĽ�������
	 *         ��������forѭ���������٣����ǽ����Ĵ���̫����
	 */
	public static int[] ϣ������(int[] arr) {
		Print.print_start(arr);
		int number = 0;
		for (int gap = arr.length >> 1; gap > 0; gap >>= 1) {
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
