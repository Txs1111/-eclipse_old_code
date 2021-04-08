package Java基础知识回顾.泛型.测试包;

import java.util.ArrayList;

public class 测试var与object类型list {
	public static void main(String[] args) {
		ArrayList<Object> list = new ArrayList<>(20);
		list.ensureCapacity(30);
		list.add(1);
		list.add(2);
		list.add("niasg3");
		System.out.println(list.size());
		list.trimToSize();
		System.out.println(list.size());
		System.out.println(list.get(2));
		System.out.println(list.get(0));
		System.out.println(list.get(1));
	}
}
