package SpringGroup.dynamicproxy;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

public class ProxyInovocationHandler implements InvocationHandler {
	private Rent rent;

	public void setRent(Rent rent) {
		this.rent = rent;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.reflect.InvocationHandler#invoke(java.lang.Object,
	 * java.lang.reflect.Method, java.lang.Object[])
	 * 
	 * proxy 是代理类
	 * 
	 * method 代理类的调用处理程序的方法
	 */
	public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
		seeHouse();
		Object result = method.invoke(rent, args);
		fare();
		// method.invoke(rent, args); rent是真实对象
		return null;
	}

	/**
	 * @return
	 * 
	 * 		代理类
	 * 
	 *         this.getClass().getClassLoader() 是将字节码加载到jvm中
	 * 
	 *         rent.getClass().getInterfaces() 是接口类型
	 * 
	 *         this 是InvocationHandler（动态代理）
	 */
	public Object getProxy() {
		return Proxy.newProxyInstance(this.getClass().getClassLoader(), rent.getClass().getInterfaces(), this);
	}

	/**
	 * 额外方法（看房）
	 */
	private void seeHouse() {
		System.out.println("带房客看房");
	}

	/**
	 * 额外方法（收中介费）
	 */
	private void fare() {
		System.out.println("收取中介费");
	}

}
