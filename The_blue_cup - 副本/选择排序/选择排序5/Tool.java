package ѡ������5;

public class Tool {
	/**
	 * @param arr
	 *            ��������Ϳ��Զ���ӡ����
	 */
	public static void printarr(int[] arr) {
		for (int i = 0; i < arr.length; i++) {
			System.out.print("����"+"["+i+"]:"+arr[i]+" ");
		}
		System.out.println();
	}
	
	/**
	 * @param arr
	 * @param i
	 * @param j
	 * ��������������±��˳��
	 */
	public static void swaparr(int[] arr, int i, int j) {
		int t = arr[j];
		arr[j] = arr[i];
		arr[i] = t;
	}
}
