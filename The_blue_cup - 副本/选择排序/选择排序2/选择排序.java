package ѡ������2;

public class ѡ������ {

	public static void main(String[] args) {
		int[] arr = new int[] { 4, 6, 9, 5, 0, 7, 8 };
		int[] result = �ڶ���(arr);
		for (int i = 0; i < result.length; i++) {
			System.out.println("arr[" + i + "]=" + result[i]);
		}
	}

	/**
	 * @param arr
	 * @return ʹ��������±�д
	 */
	public static int[] �ڶ���(int[] arr) {
		int minPos;
		for (int i = 0; i < arr.length; i++) {
			minPos = i;
			for (int j = i + 1; j < arr.length; j++) {
				if (arr[minPos] > arr[j]) {
					minPos = j;
				}
				int t = arr[minPos];
				arr[minPos] = arr[i];
				arr[i] = t;
			}
		}
		return arr;
	}

}
