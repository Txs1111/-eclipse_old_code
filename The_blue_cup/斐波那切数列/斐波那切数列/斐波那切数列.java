package 쳲���������;

public class 쳲��������� {
	public static void main(String[] args) {
System.out.println(쳲���������(46));
	}

	public static int 쳲���������(int n) {
		if (n == 1) {
			return 1;
		}
		if (n == 2) {
			return 1;
		} else {
			return 쳲���������(n - 1) + 쳲���������(n - 2);
		}
	}
}
