package 测试专用包;

public class 实体类 {
	实体类 next;
	int a;
	String b;

	public 实体类() {
		super();
	}

	/**
	 * @param a
	 * @param b
	 */
	public 实体类(int a, String b) {
		super();
		this.a = a;
		this.b = b;
	}

	@Override
	public String toString() {
		return "实体类 [next=" + next + ", a=" + a + ", b=" + b + "]";
	}

	public int getA() {
		return a;
	}

	public void setA(int a) {
		this.a = a;
	}

	public String getB() {
		return b;
	}

	public void setB(String b) {
		this.b = b;
	}

}
