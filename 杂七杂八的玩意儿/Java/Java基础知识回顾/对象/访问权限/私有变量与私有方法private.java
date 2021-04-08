package Java基础知识回顾.对象.访问权限;

public class 私有变量与私有方法private {
	private int a;

	private int sum(int m, int n) {
		return m - n;
	}
}
/*
public class b {
	public static void main(String[] args) {
		私有变量与私有方法private a = new 私有变量与私有方法private();
		// a.a; //编译错误，无法访问private创建的变量a
	}
}
*/