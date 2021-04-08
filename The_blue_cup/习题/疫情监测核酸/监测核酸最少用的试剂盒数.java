package 疫情监测核酸;

import Tool.Print;
import Tool.Swap;

public class 监测核酸最少用的试剂盒数 {
	/*
	 * 新冠疫情由新冠病毒引起，最近在 A 国蔓延，为了尽快控制疫情，A 国准 备给大量民众进病毒核酸检测。然而，用于检测的试剂盒紧缺。
	 * 为了解决这一困难，科学家想了一个办法：合并检测。即将从多个人（k 个）采集的标本放到同一个试剂盒中进行检测。 如果结果为阴性，则说明这
	 * k个人都是阴性，用一个试剂盒完成了 k 个人的检测。 如果结果为阳性，则说明 至少有一个人为阳性，需要将这 k个人的样本全部重新独立检测
	 * （从理论上看， 如果检测前 k - 1 个人都是阴性可以推断出第 k 个人是阳性，但是在实际操作中不会利用此推断，而是将 k 个人独立检测），
	 * 加上最开始的合并检测，一共使用 了 k + 1 个试剂盒完成了 k 个人的检测。 A国估计被测的民众的感染率大概是 1%，呈均匀分布。请问 k
	 * 取多少能 最节省试剂盒
	 */
	public static void main(String[] args) {
		// System.out.println(sort(sum(1000))[0]);
		Print.print_result(sort(sum(100)));
	}

	public static double[] sum(int k) {
		double[] sum = new double[k];
		int n = 99999;
		for (int i = 0; i < k; i++) {
			sum[i] = n / k + n * 0.01 * k;
			if (sum[i] == 1000089.0) {
				System.out.println(sum[i]);
				System.out.println("ddddddddddd" + i);
			}
		}
		return sum;
	}

	public static double[] sort(double[] arr) {
		Print.print_start(arr);
		for (int i = 1; i < arr.length; i++) {
			for (int j = i; j > 0; j--) {
				if (arr[j] < arr[j - 1]) {
					Swap.swap_arr(arr, j, j - 1);
				}
				// Print.print_arr(arr);
			}

		}
		return arr;
	}
}
