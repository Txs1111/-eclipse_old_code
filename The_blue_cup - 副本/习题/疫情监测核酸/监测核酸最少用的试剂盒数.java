package ���������;

import Tool.Print;
import Tool.Swap;

public class �����������õ��Լ����� {
	/*
	 * �¹��������¹ڲ������������ A �����ӣ�Ϊ�˾���������飬A ��׼ �����������ڽ����������⡣Ȼ�������ڼ����Լ��н�ȱ��
	 * Ϊ�˽����һ���ѣ���ѧ������һ���취���ϲ���⡣�����Ӷ���ˣ�k �����ɼ��ı걾�ŵ�ͬһ���Լ����н��м�⡣ ������Ϊ���ԣ���˵����
	 * k���˶������ԣ���һ���Լ�������� k ���˵ļ�⡣ ������Ϊ���ԣ���˵�� ������һ����Ϊ���ԣ���Ҫ���� k���˵�����ȫ�����¶������
	 * ���������Ͽ��� ������ǰ k - 1 ���˶������Կ����ƶϳ��� k ���������ԣ�������ʵ�ʲ����в������ô��ƶϣ����ǽ� k ���˶�����⣩��
	 * �����ʼ�ĺϲ���⣬һ��ʹ�� �� k + 1 ���Լ�������� k ���˵ļ�⡣ A�����Ʊ�������ڵĸ�Ⱦ�ʴ���� 1%���ʾ��ȷֲ������� k
	 * ȡ������ ���ʡ�Լ���
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
