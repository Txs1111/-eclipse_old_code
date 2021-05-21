package bean;

public class code_sort_out {
	public String sort(String a) {
		a = a.replaceAll("\r|\n", "");
		System.out.println(a);
		a = "a" + a;
		a = a.replace("\n", "");
		a = a.replace("\t", "");
		a = a.replace(">\n", "");
		a = a.replace("\n<", "");
		a = a.replace("\t<", "");
		a = a.replace("<", "\n$<");
		a = a.replace(">", ">$\n");
		a = a.replace("$\n\n", "$\n");
		a = a.replace(">$", ">");
		a = a.replace("$<", "<");
		a = a.replace("a\n", "");
		return a;
	}

	public String check_code(String a) {
		a=a.replace("<body", "");
		a=a.replace("</body", "");
		a=a.replace("<html", "");
		a=a.replace("</html", "");
		return a;
	}
	public static void main(String[] args) {
		}
}
