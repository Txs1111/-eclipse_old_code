package bean;

public class ranknode {
	public ranknode next = null;
	public int num = 1;// �±���,��ӽڵ�ʱ�Զ�����
	public boolean searchresult = true;
	// ================================�Զ�������
	public String name = "";// �û���
	public String ID = "";// �û�ID
	public int point = 0;// �û�����999999999999
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
	// System.out.println("δ�ҵ����");
	// } else {
	// System.out.println("�������");
	// System.out.println("���:" + search.data);
	// }
	// }

	public ranknode addbody(ranknode head, ranknode body) {
		if (head.name.equals("") || head.name == null) {
			head = body;// ��ͷ�ڵ�û������ʱ��ֱ�Ӱ���ӵĽڵ㸳ֵ��ͷ��Ȼ��������
//			System.out.println("���ͷ");
		} else {
//			System.out.println("�������");
			ranknode temp = new ranknode();
			temp = head;
			while (temp.next != null) {
				temp = temp.next;// ��ָ��ڵ��ƽ�������ĩβ
			}
			body.num = temp.num + 1;// ĩβ�ڵ���±��Զ���һ
			temp.next = body;
		}
		return head;// ������ӽڵ���ͷ�ڵ�
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