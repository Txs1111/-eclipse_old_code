package �鲢����;

import Tool.*;

public class �鲢����_��һ�� {
	public static void main(String[] args) {
		int[] arr = Create.create_arr(11);
		arr = Create.create_big_litter_arr(10);
		Print.print_result(sort(arr));
	}

	/**
	 * @param arr
	 * @return
	 * 
	 * ���Գ���ʵ��
	 */
	public static int[] sort(int[] arr) {
		Print.print_start(arr);
		int[] arr2 = new int[arr.length];
		int k = arr.length / 2;
		int n = 0;
		int m = 0;
		for (int i = 0; n < arr.length / 2 && k < arr.length; i++) {
			if (arr[n] >= arr[k]) {
				arr2[m] = arr[k];
				k++;
				m++;
			} else {
				arr2[m] = arr[n];
				n++;
				m++;
			}
		}
		if (n < arr.length / 2) {
			for (int i = m; i < arr.length; i++) {
				arr2[i] = arr[n];
				n++;
			}
		} else if (k < arr.length) {
			for (int i = m; i < arr.length; i++) {
				arr2[i] = arr[k];
				k++;
			}
		}
		// if (arr.length == 1)
		// return arr;
		// return sort(arr2);
		return arr2;
	}

}
