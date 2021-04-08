package �鲢����3;

import Tool.*;

public class �鲢����_����� {
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
		// �ֳ�����
		int mid = left + (right - left )/ 2;
		// �������
		sort(arr, left, mid);
		// �ұ�����
		sort(arr, mid + 1, right);
		merge(arr, left, mid + 1, right);
		return arr;
	}


	/**
	 * @param arr	--������������
	 * @param leftPtr	--��ߵ������±�
	 * @param rightPtr	--�ұߵ������±�
	 * @param rightBound	--���Ҳ�������±�
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
