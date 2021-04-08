package Tool;

public class Print {

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
		System.out.print("原数组为：{");
		for (int i = 0; i < arr.length; i++) {
			// System.out.println("数组" + "[" + i + "]:" + arr[i] + " ");
			System.out.print(arr[i] + ",");
		}
		System.out.println("}");
	}

	public static void print_result(double[] arr) {
		System.out.print(arr + "结果数组：{");
		for (int i = 0; i < arr.length; i++) {
			// System.out.println("数组" + "[" + i + "]:" + arr[i] + " ");
			System.out.print(arr[i] + ",");
		}
		System.out.println("}");
	}

	public static void print_start(double[] arr) {
		System.out.print("原数组为：{");
		for (int i = 0; i < arr.length; i++) {
			// System.out.println("数组" + "[" + i + "]:" + arr[i] + " ");
			System.out.print(arr[i] + ",");
		}
		System.out.println("}");
	}
}
