package 选择排序;

public class 选择排序 {

	public static void main(String[] args) {
		int[] arr = new int[] { 4, 6, 9, 5, 0, 7, 8 };
		int[] result = 自己的第一遍选择排序(arr);
		for (int i = 0; i < result.length; i++) {
			System.out.println("arr[" + i + "]=" + result[i]);
		}
	}

	public static int[] 自己的第一遍选择排序(int[] arr) {
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
	 * 总结： 数组不用传值，只用传坐标就行了
	 */
	/**
	 * @param arr
	 * @return 使用数组的下标写
	 */
	public static int[] 第二遍(int[] arr) {
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
	 * @return 精细化边界
	 */
	public static int[] 第三遍(int[] arr) {
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
	 * @return 优化语句
	 */
	public static int[] 第四遍(int[] arr) {
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
	 * 封装方法
	 */
	public static int[] 第五遍(int[] arr) {
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
	 * 传入数组就可以都打印出来
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
