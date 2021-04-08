package 测试语句调用时间;

import org.junit.Test;

/**
 * @author Lyon
 * 
 *         一个for循环1w,2w,3,1ww遍里面什么都没有用了都是用了0.015s左右
 *
 *         while 循环挺占用时间的，一个1w的while就要0.28s左右，1ww则要0.61s左右1www则更多时间1.8s
 */
public class Test测试多个while语句 {
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
