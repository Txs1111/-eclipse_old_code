package 归并排序3;

import Tool.*;

public class 归并排序_简化语句 {
	public static void main(String[] args) {
		int[] arr = Create.create_arr(16);
//		arr = Create.create_big_litter_arr(2);
//		arr = new int[] { 1, 3 };
		Print.print_result(sort(arr, 0, arr.length - 1));
//		Print.print_result(merge(arr, 0, (arr.length + 1) / 2, arr.length - 1));
	}

	public static int[] sort(int[] arr, int left, int right) {
		if (left == right)
			return arr;
		// 分成两半
		int mid = left + (right - left )/ 2;
		// 左边排序
		sort(arr, left, mid);
		// 右边排序
		sort(arr, mid + 1, right);
		merge(arr, left, mid + 1, right);
		return arr;
	}


	/**
	 * @param arr	--传进来的数组
	 * @param leftPtr	--左边的数组下标
	 * @param rightPtr	--右边的数组下标
	 * @param rightBound	--最右侧的数组下标
	 * @return
	 */
	public static int[] merge(int[] arr, int leftPtr, int rightPtr, int rightBound) {
		Print.print_start(arr);
		int[] arr2 = new int[rightBound - leftPtr + 1];
		int r = rightPtr;
		int l = leftPtr;
		int mid = rightPtr - 1;
		int arr2_index = 0;
		while (l <= mid && r <= rightBound)
			arr2[arr2_index++] = arr[l] >= arr[r] ? arr[r++] : arr[l++];
		while (l <= mid || r <= rightBound)
			arr2[arr2_index++] = l <= mid ? arr[l++] : arr[r++];

		for (int i = 0; i < arr2.length; i++) {
			arr[leftPtr + i] = arr2[i];

		}
		return arr;
	}

}
