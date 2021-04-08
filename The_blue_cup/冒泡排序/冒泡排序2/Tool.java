package 冒泡排序2;

public class Tool {
	/**
	 * @param arr
	 *            传入数组就可以都打印出来
	 */
	public static void print_arr(int[] arr) {
		System.out.print("数组：{");
		for (int i = 0; i < arr.length; i++) {
			// System.out.print("数组" + "[" + i + "]:" + arr[i] + " ");
			System.out.print(arr[i] + ",");
		}
		System.out.println("}");

	}

	/**
	 * @param arr
	 *            打印最后数组的结果
	 */
	public static void print_result(int[] arr) {
		System.out.print(arr + "结果数组：{");
		for (int i = 0; i < arr.length; i++) {
			// System.out.println("数组" + "[" + i + "]:" + arr[i] + " ");
			System.out.print(arr[i] + ",");
		}
		System.out.println("}");
	}

	/**
	 * @param arr
	 *            打印最开始的数组的结果
	 */
	public static void print_start(int[] arr) {
		System.out.print("原数组为：");
		for (int i = 0; i < arr.length; i++) {
			// System.out.println("数组" + "[" + i + "]:" + arr[i] + " ");
			System.out.print(arr[i] + ",");
		}
		System.out.println("}");
	}

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
}
