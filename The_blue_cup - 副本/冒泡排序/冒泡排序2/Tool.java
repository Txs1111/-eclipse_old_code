package ð������2;

public class Tool {
	/**
	 * @param arr
	 *            ��������Ϳ��Զ���ӡ����
	 */
	public static void print_arr(int[] arr) {
		System.out.print("���飺{");
		for (int i = 0; i < arr.length; i++) {
			// System.out.print("����" + "[" + i + "]:" + arr[i] + " ");
			System.out.print(arr[i] + ",");
		}
		System.out.println("}");

	}

	/**
	 * @param arr
	 *            ��ӡ�������Ľ��
	 */
	public static void print_result(int[] arr) {
		System.out.print(arr + "������飺{");
		for (int i = 0; i < arr.length; i++) {
			// System.out.println("����" + "[" + i + "]:" + arr[i] + " ");
			System.out.print(arr[i] + ",");
		}
		System.out.println("}");
	}

	/**
	 * @param arr
	 *            ��ӡ�ʼ������Ľ��
	 */
	public static void print_start(int[] arr) {
		System.out.print("ԭ����Ϊ��");
		for (int i = 0; i < arr.length; i++) {
			// System.out.println("����" + "[" + i + "]:" + arr[i] + " ");
			System.out.print(arr[i] + ",");
		}
		System.out.println("}");
	}

	/**
	 * @param arr
	 * @param i
	 * @param j
	 *            ��������������±��˳��
	 */
	public static void swap_arr(int[] arr, int i, int j) {
		int t = arr[j];
		arr[j] = arr[i];
		arr[i] = t;
	}
}
