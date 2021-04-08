package 测试专用包;

import java.util.ArrayList;

public class 测试泛型中存null是否有长度 {
	public static void main(String[] args) {
		ArrayList<String> list = new ArrayList<>();
		list.add(null);
		list.add(null);
		list.add("1");
		list.set(3, "set");
		System.out.println(list.get(0));
		System.out.println(list.get(1));
		System.out.println(list.get(2));
		System.out.println(list.get(3));
		System.out.println(list.size());
	}
}
