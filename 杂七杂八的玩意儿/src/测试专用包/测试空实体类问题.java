package 测试专用包;

public class 测试空实体类问题 {
	public static void main(String[] args) {
		实体类 node = new 实体类();
		实体类 node2;
		实体类 head = new 实体类();
		node = new 实体类(1, "q");
		System.out.println(node);
		System.out.println(node.toString());
		node.next = new 实体类(11, "qq");
		head = node;
		node = node.next;
		System.out.println(head.next.toString());
		node2 = new 实体类(2, "b");
		System.out.println(node2.toString());

	}
}
