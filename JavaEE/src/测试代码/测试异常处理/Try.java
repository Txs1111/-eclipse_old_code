package 测试代码.测试异常处理;

public class Try {
	public static void main(String[] args) {
		System.out.println(demo());
	}

	public static int demo() {
		GirlHome gh = new GirlHome("小陈陈", '男', 28);
		try {
			gh.intoHome();
			System.out.println("进入了女生宿舍");
			return 0;
		} catch (SexOutException e) {
			e.printStackTrace();
		} catch (AgeOutException e) {
			e.printStackTrace();
		} finally {
			System.out.println("我必须被执行");
		}
		return 1;
	}
}

class GirlHome {
	public String name;
	public char sex;
	public int age;

	public GirlHome(String name, char sex, int age) {
		super();
		this.name = name;
		this.sex = sex;
		this.age = age;
	}

	// 如果发现进入者是男的,那么抛出性别异常
	public void intoHome() throws SexOutException, AgeOutException {
		if (sex != '女') {
			SexOutException se = new SexOutException(name + "你不是女的,滚!!!");
			throw se;
		}
		if (age > 25) {
			throw new AgeOutException(name + "你的年龄太大了,滚!!!!");
		}
		System.out.println(name + "开心的进入了宿舍");
	}

	public void demo() throws Exception {
	}
}

class AgeOutException extends Exception {
	public AgeOutException(String message) {
		super(message);
	}
}

class SexOutException extends Exception {
	public SexOutException(String message) {
		super(message);
	}
}

	class SmallGirlHome extends GirlHome {
		public SmallGirlHome(String name, char sex, int age) {
			super(name, sex, age);
			// TODO Auto-generated constructor stub
		}

		@Override
		public void intoHome() throws SexOutException, AgeOutException {

		}

		public void demo() {

		}
	
}
