package ����ר�ð�;

public class ʵ���� {
	ʵ���� next;
	int a;
	String b;

	public ʵ����() {
		super();
	}

	/**
	 * @param a
	 * @param b
	 */
	public ʵ����(int a, String b) {
		super();
		this.a = a;
		this.b = b;
	}

	@Override
	public String toString() {
		return "ʵ���� [next=" + next + ", a=" + a + ", b=" + b + "]";
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
