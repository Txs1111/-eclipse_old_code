package bean;

public class count_level {

	public int[] level = new int[16];// ��16��

	public count_level() {// ����ÿ���ȼ������
		for (int a = 0; a < 16; a++) {
			this.level[a] = 35 * (a * a) + 100 * a;
			
		}

	}
//	0
//	135
//	340
//	615
//	960
//	1375
//	1860
//	2415
//	3040
//	3735
//	4500
//	5335
//	6240
//	7215
//	8260
//	9375
	public int count(int experience) {// ����ȼ�
		int level = 0;
		for (int a = 0; a < 16; a++) {
			if (this.level[a] > experience) {
				level = a - 1;
				break;
			}
		}
		return level;
	}

}
