package ѡ������;

public class ѡ������ {

	public static void main(String[] args) {
		int[] arr = new int[] { 4, 6, 9, 5, 0, 7, 8 };
		int[] result = �Լ��ĵ�һ��ѡ������(arr);
		for (int i = 0; i < result.length; i++) {
			System.out.println("arr[" + i + "]=" + result[i]);
		}
	}

	public static int[] �Լ��ĵ�һ��ѡ������(int[] arr) {
		int mix;
		for (int i = 0; i < arr.length; i++) {
			mix = arr[i];
			for (int j = i + 1; j < arr.length; j++) {
				if (mix > arr[j]) {
					mix = arr[j];
					arr[j] = arr[i];
					arr[i] = mix;
				}
			}
			// System.out.println("arr[" + i + "]=" + mix);
		}
		return arr;
	}

	/*
	 * �ܽ᣺ ���鲻�ô�ֵ��ֻ�ô����������
	 */
	/**
	 * @param arr
	 * @return ʹ��������±�д
	 */
	public static int[] �ڶ���(int[] arr) {
		int minPos;
		for (int i = 0; i < arr.length; i++) {
			minPos = i;
			for (int j = i + 1; j < arr.length; j++) {
				if (arr[minPos] > arr[j]) {
					minPos = j;
				}
				int t = arr[minPos];
				arr[minPos] = arr[i];
				arr[i] = t;
			}
		}
		return arr;
	}

	/**
	 * @param arr
	 * @return ��ϸ���߽�
	 */
	public static int[] ������(int[] arr) {
		int minPos;
		for (int i = 0; i < arr.length - 1; i++) {
			minPos = i;
			for (int j = i + 1; j < arr.length; j++) {
				if (arr[minPos] > arr[j]) {
					minPos = j;
				}
				int t = arr[minPos];
				arr[minPos] = arr[i];
				arr[i] = t;
			}
		}
		return arr;
	}

	/**
	 * @param arr
	 * @return �Ż����
	 */
	public static int[] ���ı�(int[] arr) {
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

	/**
	 * @param arr
	 * @return
	 * ��װ����
	 */
	public static int[] �����(int[] arr) {
		int minPos;
		for (int i = 0; i < arr.length - 1; i++) {
			minPos = i;
			for (int j = i + 1; j < arr.length; j++) {
				minPos = arr[j] < arr[minPos] ? j : minPos;
				swaparr(arr, i, minPos);
			}
		}
		return arr;
	}
	/**
	 * @param arr
	 * ��������Ϳ��Զ���ӡ����
	 */
	public static void print(int[] arr){
		for (int i = 0; i < arr.length; i++) {
			System.out.println(arr[i]);
		}
	}
	public static void swaparr(int[] arr,int i, int j){
		int t = arr[j];
		arr[j] = arr[i];
		arr[i] = t;
	}
}
