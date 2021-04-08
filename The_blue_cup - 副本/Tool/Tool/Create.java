package Tool;

public class Create {
	/**
	 * @param n
	 * @return 创建产长度为n的随机数组
	 */
	public static int[] create_arr(int n) {
		int a = 0;
		if (n <= 10) {
			a = 1;
		} else
			a = n / 10;
		int[] arr = new int[n];
		for (int i = 0; i < arr.length; i++) {
			arr[i] = (int) (Math.random() * 10 * a);
		}
		return arr;
	}

	/**
	 * @param n
	 * @return
	 * 
	 * 		创建一个按小到大顺序排的数组
	 */
	public static int[] create_litter_big_arr(int n) {
		int[] arr = new int[n];
		for (int i = 0; i < arr.length; i++) {
			arr[i] = i;
		}
		return arr;
	}

	/**
	 * @param n
	 * @return
	 * 
	 * 		创建一个按大到小顺序排的数组
	 */
	public static int[] create_big_litter_arr(int n) {
		int[] arr = new int[n];
		for (int i = 0; i < arr.length; i++) {
			arr[arr.length-i-1] = i;
		}
		return arr;
	}

}
