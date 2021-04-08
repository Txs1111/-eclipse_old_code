package 测试专用包;

import java.util.ArrayList;

public class 测试list中的get下标 {
	public static void main(String[] args) {
		ArrayList<Integer> a = new ArrayList<>();
		a.add(1);
		a.add(2);
		a.set(0, a.get(0) + 1);
		System.out.println(a.get(0));
	}
}
