package 两数之和1;

import org.junit.Test;

public class 使用return写的两数之和 {
	@Test
	public void aaa() {
		int a = (int) Math.random() * 123456 + 1;
		int b;
		int[] nums = new int[a];
		for (int i = 0; i < a; i++) {
			b = (int) Math.random() * 10;
			nums[i] = b;
		}
		for (int j = 0; j < 10000; j++) {
			for (int jj = 0; jj < 1; jj++){}
//				System.out.println(twoSum(nums, nums[(int) Math.random() * 123456] + nums[(int) Math.random() * 123456]));
		}
	}

	public int[] twoSum(int[] nums, int target) {
		return litter(nums, target);
	}

	public int[] litter(int[] nums, int target) {

		for (int i = 0; i < nums.length; i++) {
			for (int j = i + 1; j < nums.length; j++) {
				if ((nums[i] + nums[j]) == target) {
					nums = new int[2];
					nums[0] = i;
					nums[1] = j;
					return nums;
				}
			}
		}
		return nums;
	}
}