package ����ר�ð�;

import java.util.ArrayList;

public class ����list�е�get�±� {
	public static void main(String[] args) {
		ArrayList<Integer> a = new ArrayList<>();
		a.add(1);
		a.add(2);
		a.set(0, a.get(0) + 1);
		System.out.println(a.get(0));
	}
}
