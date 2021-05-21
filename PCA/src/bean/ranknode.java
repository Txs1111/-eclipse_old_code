package bean;

public class ranknode {
	public ranknode next = null;
	public int num = 1;// 下标数,添加节点时自动增加
	public boolean searchresult = true;
	// ================================自定义数据
	public String name = "";// 用户名
	public String ID = "";// 用户ID
	public int point = 0;// 用户积分999999999999
	// ================================
	// public static void main(String[] args) {
	// shuanglianbiao zhu = new shuanglianbiao();
	// node head = new node();
	// node body = null;
	// for (int a = 0; a < 10; a++) {
	// body = new node();
	// body.data = a + 5;
	// head = zhu.addbody(head, body);
	// }
	// zhu.show(head);
	// node search = zhu.search(15, head);
	// if (search == null) {
	// System.out.println("未找到结果");
	// } else {
	// System.out.println("搜索完毕");
	// System.out.println("结果:" + search.data);
	// }
	// }

	public ranknode addbody(ranknode head, ranknode body) {
		if (head.name.equals("") || head.name == null) {
			head = body;// 当头节点没有数据时，直接把添加的节点赋值给头，然后结束添加
//			System.out.println("添加头");
		} else {
//			System.out.println("添加身体");
			ranknode temp = new ranknode();
			temp = head;
			while (temp.next != null) {
				temp = temp.next;// 将指针节点推进到链表末尾
			}
			body.num = temp.num + 1;// 末尾节点的下标自动加一
			temp.next = body;
		}
		return head;// 返回添加节点后的头节点
	}
	public int userrank(String ID, ranknode head) {
		ranknode node=new ranknode();
		node=head;
		int result=0;
		while(node!=null){
			if(node.ID.equals(ID)){
				result=node.num;
			}
			node=node.next;
		}
		return result;
	}
	
	public ranknode searchID(int num, ranknode head) {
		ranknode search = new ranknode();
		search = head;
		while (search != null) {
			if (search.num == num) {
				search.next = null;
				break;
			}
			search = search.next;
		}
		if (search == null) {
			search = new ranknode();
			search.searchresult = false;
		}
		return search;
	}

	public int getcount(ranknode head) {
		ranknode temp = new ranknode();
		temp=head;
		int num = 0;
		while (temp.next != null) {
			num = num + 1;
			temp = temp.next;
		}
		return num;
	}
}