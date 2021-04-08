package 选择排序5;

public class Tool {
	/**
	 * @param arr
	 *            传入数组就可以都打印出来
	 */
	public static void printarr(int[] arr) {
		for (int i = 0; i < arr.length; i++) {
			System.out.print("数组"+"["+i+"]:"+arr[i]+" ");
		}
		System.out.println();
	}
	
	/**
	 * @param arr
	 * @param i
	 * @param j
	 * 交换数组的两个下标的顺序
	 */
	public static void swaparr(int[] arr, int i, int j) {
		int t = arr[j];
		arr[j] = arr[i];
		arr[i] = t;
	}
}
