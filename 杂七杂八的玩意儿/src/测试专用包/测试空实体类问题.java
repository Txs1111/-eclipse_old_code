package ����ר�ð�;

public class ���Կ�ʵ�������� {
	public static void main(String[] args) {
		ʵ���� node = new ʵ����();
		ʵ���� node2;
		ʵ���� head = new ʵ����();
		node = new ʵ����(1, "q");
		System.out.println(node);
		System.out.println(node.toString());
		node.next = new ʵ����(11, "qq");
		head = node;
		node = node.next;
		System.out.println(head.next.toString());
		node2 = new ʵ����(2, "b");
		System.out.println(node2.toString());

	}
}
