package 斐波那切数列;

public class 斐波那切数列 {
	public static void main(String[] args) {
System.out.println(斐波那切数列(46));
	}

	public static int 斐波那切数列(int n) {
		if (n == 1) {
			return 1;
		}
		if (n == 2) {
			return 1;
		} else {
			return 斐波那切数列(n - 1) + 斐波那切数列(n - 2);
		}
	}
}
