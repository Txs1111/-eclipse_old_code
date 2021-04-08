package Tool;

public class Swap {

	/**
	 * @param arr
	 * @param i
	 * @param j
	 *            交换数组的两个下标的顺序
	 */
	public static void swap_arr(int[] arr, int i, int j) {
		int t = arr[j];
		arr[j] = arr[i];
		arr[i] = t;
	}

	public static void swap_arr(double[] arr, int i, int j) {
		double t = arr[j];
		arr[j] = arr[i];
		arr[i] = t;

	}

}
