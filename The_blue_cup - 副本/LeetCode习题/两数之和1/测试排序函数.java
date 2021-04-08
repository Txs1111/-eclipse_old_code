package 两数之和1;

public class 测试排序函数 {
	public static void main(String[] args) {
		int litternum[] = new int[] { 9, 8, 11, 6, 5, 4, 3, 2, 1 };
		int add;
		int m = 0;
		for (; m < litternum.length; m++) {
			int n = m;
			int minindex = m;
			add = litternum[m];
			for (; n < litternum.length; n++) {
				if (add > litternum[n]) {
					minindex = n;
					add = litternum[n];
				}
			}
				add = litternum[m];
				litternum[m] = litternum[minindex];
				litternum[minindex] = add;
		}

		for (int i = 0; i < litternum.length; i++) {
			System.out.println(litternum[i]);
		}
	}

}
