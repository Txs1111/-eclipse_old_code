package Tool;

public class Create {
	/**
	 * @param n
	 * @return ����������Ϊn���������
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
	 * 		����һ����С����˳���ŵ�����
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
	 * 		����һ������С˳���ŵ�����
	 */
	public static int[] create_big_litter_arr(int n) {
		int[] arr = new int[n];
		for (int i = 0; i < arr.length; i++) {
			arr[arr.length-i-1] = i;
		}
		return arr;
	}

}
