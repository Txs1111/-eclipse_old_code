package ����������ʱ��;

import org.junit.Test;

/**
 * @author Lyon
 * 
 *         һ��forѭ��1w,2w,3,1ww������ʲô��û�����˶�������0.015s����
 *
 *         while ѭ��ͦռ��ʱ��ģ�һ��1w��while��Ҫ0.28s���ң�1ww��Ҫ0.61s����1www�����ʱ��1.8s
 */
public class Test���Զ��while��� {
	@Test
	public void ceshiforyuju() {
		long a = 1000000000;
		long b = 1000000000;
		long c = 1000000000;
		while (a > 0) {
			while (b > 0) {
				b--;
				while (c > 0) {
					c--;
				}
			}
			a--;
		}
		// *********************************************************
	}
}
