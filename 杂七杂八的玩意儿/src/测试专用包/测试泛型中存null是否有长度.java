package ����ר�ð�;

import java.util.ArrayList;

public class ���Է����д�null�Ƿ��г��� {
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
