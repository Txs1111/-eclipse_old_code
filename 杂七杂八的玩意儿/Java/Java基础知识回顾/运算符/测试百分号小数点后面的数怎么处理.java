package Java基础知识回顾.运算符;

public class 测试百分号小数点后面的数怎么处理 {
	public static void main(String[] args) {
		double a = 2.33;// 除数
		int b = 2;// 被除数
		/**
		 * 测试小数用%号，会余啥。 2021-2-5 11:27:57
		 */
		double result;

		result = a % b;
		System.out.println(result);
		/**
		 * 测试结果
		 * 
		 * 0.33000000000000007
		 * 
		 * 所以小数也可以被余
		 */
	}
}
