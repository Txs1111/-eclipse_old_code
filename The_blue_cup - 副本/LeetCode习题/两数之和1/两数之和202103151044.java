package 两数之和1;


class 两数之和202103151044 {
	public static void main(String[] args) {
		int litternum[] = new int[] { 9, 8, 11, 6, 5, 4, 3, 2, 1 };
		System.out.println(twoSum(litternum,20)); 
	}
	
	public static String twoSum(int[] nums, int target) {
		int[] arr = litter(nums, target);
		return allsum(arr, target,arr);
	}

	// 筛选出数组中小于等于target的数
	public static int[] litter(int[] nums, int target) {
		int[] litternum = new int[nums.length];
		int a = 0;
		for (int i = 0; i < nums.length; i++) {
			if (target >= nums[i]) {
				litternum[a] = nums[i];
				a++;
			}
		}
		return litternum;
	}

	public static String allsum(int[] arr, int target, int[] all) {
		String aaaa = "";
		int sum;
		for (int i = 0; i < arr.length; i++) {
			for (int j = i; j < arr.length; j++) {
				sum = arr[i] + arr[j];
				if (sum == target) {
					 aaaa = "["+index(arr[i],all)+","+index(arr[j],all)+"]";
					return aaaa;
				}
			}
		}
		return aaaa;
	}
	
	public static int index(int number,int[] arr){
		for(int i= 0;i<arr.length;i++){
			if(arr[i] == number){
				return i;
			}
		}
		return -1;
	}
	
}