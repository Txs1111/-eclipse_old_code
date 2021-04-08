package ¹é²¢ÅÅĞò;

import Tool.*;

public class ¹é²¢ÅÅĞò_µÚÒ»±é {
	public static void main(String[] args) {
		int[] arr = Create.create_arr(20);
		Print.print_result(arr);
	}

	public static int[] sort(int[] arr) {
		Print.print_start(arr);
		int[] arr2 = new int[arr.length];
		int k = arr.length / 2;
		int n = 0;
		int m = 0;
		for (int i = 0; i < arr.length; i++) {
			if (arr[n] > arr[k]) {
				k++;
				m++;
				arr2[i] = arr[k];
			} else if (arr[k] > arr[n]) {
				n++;
				m++;
				arr2[i] = arr[n];
			}
		}
		if (n < arr.length / 2) {
			for (int i = m; i < arr.length / 2 - n; i++) {
				arr2[i] = arr[n];
				n++;
			}
		} else if (k < arr.length) {
			for (int i = m; i < arr.length / 2 - n; i++) {
				arr2[i] = arr[k];
				k++;
			}
		}

		return arr;
	}

}
