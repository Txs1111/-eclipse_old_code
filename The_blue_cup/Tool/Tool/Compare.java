package Tool;

public class Compare {
	/**
	 * @param arr
	 * @return ��ȡ��������Сֵ
	 */
	public static int max_arr(int[] arr) {
		for (int i = 0; i < arr.length - 1; i++) {
			if (arr[i + 1] < arr[i]) {
				Tool.Swap.swap_arr(arr, i, i + 1);
			}

		}
		return arr[arr.length - 1];
	}

	/**
	 * @param arr
	 * @param index
	 * @return ��ȡ������ǰn��������Сֵ
	 */
	public static int max_arr_index(int[] arr, int n) {
		for (int i = 0; i < n; i++) {
			if (arr[i + 1] < arr[i]) {
				Tool.Swap.swap_arr(arr, i, i + 1);
			}

		}
		return arr[arr.length - 1];
	}

	/**
	 * @param arr
	 * @return �����ǲ��ǰ���С����˳������
	 */
	public static String if_litter_big(int[] arr) {
		String if_litter_big = "�����Ǵ�С�������е�";
		for (int i = 0; i < arr.length - 1; i++) {
			if (arr[i] > arr[i + 1]) {
				if_litter_big = "������NO��С�������е�";
				System.out.println(if_litter_big);
				return if_litter_big;
			}
		}
		System.out.println(if_litter_big);
		return if_litter_big;
	}

	/**
	 * @param arr
	 * @return �����ǲ��ǰ��Ӵ�С˳������
	 */
	public static String if_big_litter(int[] arr) {
		String if_big_litter = "�����ǴӴ�С���е�";
		for (int i = 0; i < arr.length - 1; i++) {
			if (arr[i] < arr[i + 1]) {
				if_big_litter = "������NO�Ӵ�С���е�";
				System.out.println(if_big_litter);
				return if_big_litter;
			}
		}
		System.out.println(if_big_litter);
		return if_big_litter;
	}

}
