package bean;

import dao.*;
import java.util.*;

public class notice_bean {
	noticedao not = new noticedao();

	public String[] content() {// ����֪ͨ��������Ϣ���������У�������
		String[] field = new String[4];
		try {
			String[] temp = not.selectid(9);
			for (int id = 0; id < temp.length; id++) {
				int y = 0;
				if (temp[id] == null) {
					temp[id] = temp[id];
				} else {
					StringTokenizer st = new StringTokenizer(temp[id], "]");
					while (st.hasMoreElements()) {// �ж��Ƿ��зָ���
						field[y] = st.nextToken();// ����һ���ָ���
						y++;
					}
					temp[id] = field[1];
				}
			}
			return temp;

		} catch (Exception e) {
			return null;
		}

	}

	public String[] sid() {
		String[] field = new String[4];
		try {
			String[] temp = not.selectid(9);
			for (int id = 0; id < temp.length; id++) {
				int y = 0;
				if (temp[id] == null) {
					temp[id] = temp[id];
				} else {
					StringTokenizer st = new StringTokenizer(temp[id], "]");
					while (st.hasMoreElements()) {
						field[y] = st.nextToken();
						y++;
					}
					temp[id] = field[0];
				}
			}
			return temp;

		} catch (Exception e) {
			return null;
		}

	}

	public static void main(String[] args) {
		notice_bean x = new notice_bean();
		String[] n = x.sid();
		for (int i = 0; i < 9; i++) {
			System.out.println(n[i]);
		}
	}

}
