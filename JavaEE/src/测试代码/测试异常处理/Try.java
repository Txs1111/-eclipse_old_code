package ���Դ���.�����쳣����;

public class Try {
	public static void main(String[] args) {
		System.out.println(demo());
	}

	public static int demo() {
		GirlHome gh = new GirlHome("С�³�", '��', 28);
		try {
			gh.intoHome();
			System.out.println("������Ů������");
			return 0;
		} catch (SexOutException e) {
			e.printStackTrace();
		} catch (AgeOutException e) {
			e.printStackTrace();
		} finally {
			System.out.println("�ұ��뱻ִ��");
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

	// ������ֽ��������е�,��ô�׳��Ա��쳣
	public void intoHome() throws SexOutException, AgeOutException {
		if (sex != 'Ů') {
			SexOutException se = new SexOutException(name + "�㲻��Ů��,��!!!");
			throw se;
		}
		if (age > 25) {
			throw new AgeOutException(name + "�������̫����,��!!!!");
		}
		System.out.println(name + "���ĵĽ���������");
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
