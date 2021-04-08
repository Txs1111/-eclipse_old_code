package 选择排序4;

public class 选择排序 {

	public static void main(String[] args) {
		int[] arr = new int[] { 4, 6, 9, 5, 0, 7, 8 };
		int[] result = 第四遍(arr);
		for (int i = 0; i < result.length; i++) {
			System.out.println("arr[" + i + "]=" + result[i]);
		}
	}

	/**
	 * @param arr
	 * @return 优化语句
	 */
	public static int[] 第四遍(int[] arr) {
		int minPos;
		for (int i = 0; i < arr.length - 1; i++) {
			minPos = i;
			for (int j = i + 1; j < arr.length; j++) {
				minPos = arr[j] < arr[minPos] ? j : minPos;
				int t = arr[minPos];
				arr[minPos] = arr[i];
				arr[i] = t;
			}
		}
		return arr;
	}

}
