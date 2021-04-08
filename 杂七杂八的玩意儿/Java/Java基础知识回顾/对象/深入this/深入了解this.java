package Java基础知识回顾.对象.深入this;

/**
 * Static 不可以与 this 同时用
 * 
 * @author Lyon
 *
 */
public class 深入了解this {
	int i = 1;

	public static void main(String[] args) {
		// 测试this();
	}

	public 深入了解this 测试this() {// 创建一个返回值为“深入了解this”类型的的方法
		return this;
	}

}
