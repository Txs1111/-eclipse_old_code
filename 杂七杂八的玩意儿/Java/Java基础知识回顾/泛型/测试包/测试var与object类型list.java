package Java����֪ʶ�ع�.����.���԰�;

import java.util.ArrayList;

public class ����var��object����list {
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
