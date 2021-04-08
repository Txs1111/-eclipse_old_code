package SpringGroup.dynamicproxy;

public class Client {
	public static void main(String[] args) {
		Host host = new Host();
		ProxyInovocationHandler pio = new ProxyInovocationHandler();
		pio.setRent(host);
		Rent proxy = (Rent)pio.getProxy();
		proxy.rent();
	}
}
