package bean;

public class countpage {

	public String getpage(String act, String topage, String allpage, String nowpage) {
		String page = nowpage;
		if ("3".equals(act) && Integer.parseInt(page) + 1 <= Integer.parseInt(allpage)) {
			page = (Integer.parseInt(page) + 1)+"";
		} else if ("2".equals(act)) {
			page = topage;
		} else if ("1".equals(act) && Integer.parseInt(page) > 1) {
			page = "" + (Integer.parseInt(page) - 1);
		}
		return page;
	}

}
