package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.StringTokenizer;

/**
 * @author Lyon ��ȡѧϰ��Դ��
 */

public class get_resource {

	/**
	 * @param nu
	 */
	public get_resource(int nu) {
		super();
		this.nu = nu;
	}

	/**
	 * 
	 */
	public get_resource() {
		super();
	}

	int nu = 0;
	/**
	 * �洢���ݿ��������ݵĶ���ͷ
	 */
	resource_entity allhead;
	/**
	 * �洢���ݿ����������ݵĶ�������
	 */
	resource_entity allnode;
	/**
	 * ��ȡ���ݿ����������Կ�ܵ�����
	 */
	public ArrayList<String> alltype = new ArrayList<>();
	/**
	 * ��ȡ���ݿ��ж�Ӧ���Կ�ܵ����͵Ĵ���
	 * ʹ�÷�����alltype.get(0)==>java��������Ϊtype_daihao.get(0)==>java����Դ����
	 */
	ArrayList<String> type_daihao = new ArrayList<>();
	/**
	 * ��ȡ���ݿ��ж�Ӧ���Կ�ܵ����͵�����
	 * ʹ�÷�����alltype.get(0)==>java��������Ϊtype_number.get(0)==>java����Դ����
	 */
	public ArrayList<Integer> type_number = new ArrayList<>();
	/**
	 * ��ȡ���ݿ��ж�Ӧ���Կ�ܵ����͵�ͼƬ��ַ
	 * ʹ�÷�����alltype.get(0)==>java��������Ϊtype_url.get(0)==>java����ԴͼƬ��ַ
	 */
	public ArrayList<String> type_url = new ArrayList<>();
	/**
	 * ��ȡ���ݿ���������Դ;�������ͣ�eg���ٶ����̣�����������
	 */
	public ArrayList<String> allpath = new ArrayList<>();
	/**
	 * ��ȡ���ݿ��ж�Ӧ��Դ;�������ͣ�eg���ٶ����̣������������Ĵ���
	 * ʹ�÷�����allpath.get(0)==>�ٶ����̣�������Ϊpath_daihao.get(0)==>�ٶ����̵���Դ����
	 */
	ArrayList<String> path_daihao = new ArrayList<>();
	/**
	 * ��ȡ�����ж�Ӧ��Դ;�������ͣ�eg���ٶ����̣�����������������
	 * ʹ�÷�����allpath.get(0)==>�ٶ����̣�������Ϊpath_number.get(0)==>�ٶ����̵���Դ����
	 */
	public ArrayList<Integer> path_number = new ArrayList<>();
	/**
	 * ��ȡ�����ж�Ӧ��Դ;�������ͣ�eg���ٶ����̣�������������ͼƬ��ַ
	 * ʹ�÷�����allpath.get(0)==>�ٶ����̣�������Ϊpath_url.get(0)==>�ٶ����̵���ԴͼƬ��ַ
	 */
	public ArrayList<String> path_url = new ArrayList<>();

	/**
	 * ��ȡ���ݿ�������ѧϰ��Դ
	 * 
	 * @throws Exception
	 */
	public resource_entity allResource() throws Exception {
		MySQL_connect con = new MySQL_connect();
		String sql = "select * from learning_resource learning_resource_dictionaries";
		/**
		 * ���ݿ�����������Դ��
		 */
		int allnumber = 0;
		try {
			ResultSet rs = con.usercommend.executeQuery(sql);
			boolean a = true;
			while (rs.next()) {
				allnumber = allnumber + 1;
				if (a) {
					allnode = new resource_entity(rs.getString("uid"), rs.getString("ID"), rs.getString("title"),
							rs.getString("content"), rs.getString("verification"), rs.getString("time"),
							rs.getString("type"), rs.getString("path"), rs.getString("ifcheck"));
					allhead = allnode;
					a = false;
				} else {
					allnode.next = new resource_entity(rs.getString("uid"), rs.getString("ID"), rs.getString("title"),
							rs.getString("content"), rs.getString("verification"), rs.getString("time"),
							rs.getString("type"), rs.getString("path"), rs.getString("ifcheck"));
					allnode = allnode.next;
				}
			}
			allhead.setNumber(allnumber);
			/**
			 * ��ȡ���ݿ��е�������Դ����
			 */
			String sqltype = "select type_name,type,type_url from learning_resource_dictionaries where type_name!='null'";
			rs = con.usercommend.executeQuery(sqltype);
			// �����������
			for (int i = 0; i < alltype.size(); i++) {
				alltype.set(i, null);
				type_number.set(i, 0);
				type_daihao.set(i, null);
				type_url.set(i, null);
			}
			while (rs.next()) {
				alltype.add(rs.getString("type_name"));
				type_number.add(0);
				type_daihao.add(rs.getString("type"));
				type_url.add(rs.getString("type_url"));
			}
			/**
			 * ��ȡ���ݿ��е�������Դ��ʽ
			 */
			String sqlpath = "select path_name,path,path_url from learning_resource_dictionaries where path_name!='null'";
			rs = con.usercommend.executeQuery(sqlpath);
			// �����������
			for (int i = 0; i < allpath.size(); i++) {
				allpath.set(i, null);
				path_number.set(i, 0);
				path_daihao.set(i, null);
				path_url.set(i, null);
			}
			while (rs.next()) {
				allpath.add(rs.getString("path_name"));
				path_number.add(0);
				path_daihao.add(rs.getString("path"));
				path_url.add(rs.getString("path_url"));
			}
			rs.close();
			con.usermysql.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		/**
		 * ��ȡ������µ���Դ��
		 */
		if (allhead == null || allhead.equals(null))
			allhead = new resource_entity(0);
		return allhead;
	}

	/**
	 * @return ��ȡ�Ѻϸ��ѧϰ��Դ
	 */
	public resource_entity resource() {
		// �����������
		for (int j = 0; j < alltype.size(); j++) {
			type_number.set(j, 0);
		}
		// �����������
		for (int j = 0; j < allpath.size(); j++) {
			path_number.set(j, 0);
		}
		resource_entity node = allhead;
		resource_entity date = allhead;
		resource_entity head = node;
		/**
		 * �ϸ������Դ��
		 */
		int number = 0;
		boolean a = true;
		for (int i = 0; i < allhead.number; i++) {
			if (date.getIfcheck().equals("1")) {
				number = number + 1;
				if (a) {
					node = new resource_entity(date.getUid(), date.getID(), date.getTitle(), date.getContent(),
							date.getVerification(), date.getTime(), date.getType(), date.getPath(), date.getIfcheck());
					head = node;
					a = false;
				} else {
					node.next = new resource_entity(date.getUid(), date.getID(), date.getTitle(), date.getContent(),
							date.getVerification(), date.getTime(), date.getType(), date.getPath(), date.getIfcheck());
					node = node.next;
				}
				/**
				 * ��ȡ���ݿ����������Կ�ܵ����͵���������
				 */
				for (int j = 0; j < alltype.size(); j++) {
					if (date.getType().equals(type_daihao.get(j))) {
						type_number.set(j, type_number.get(j) + 1);
						break;
					}
				}
				/**
				 * ��ȡ���ݿ�����������;����eg���ٶ����̣���������������������
				 */
				for (int j = 0; j < allpath.size(); j++) {
					if (date.getPath().equals(path_daihao.get(j))) {
						path_number.set(j, path_number.get(j) + 1);
						break;
					}
				}
			}
			date = date.next;
		}
		head.setNumber(number);
		if (head == null || head.equals(null))
			head = new resource_entity(0);
		return head;
	}

	/**
	 * @return ��ȡ������Ƿ�ϸ�ĵ�ѧϰ��Դ
	 */
	public resource_entity checkSubmitResource() {
		resource_entity node = null;
		resource_entity date = allhead;
		resource_entity head = node;
		/**
		 * �ύ�ĸ�����Դ����
		 */
		int check_submit_number = 0;
		boolean a = true;
		for (int i = 0; i < allhead.number; i++) {
			if (date.getIfcheck().equals("3")) {
				check_submit_number = check_submit_number + 1;
				if (a) {
					node = new resource_entity(date.getUid(), date.getID(), date.getTitle(), date.getContent(),
							date.getVerification(), date.getTime(), date.getType(), date.getPath(), date.getIfcheck());
					head = node;
					a = false;
				} else {
					node.next = new resource_entity(date.getUid(), date.getID(), date.getTitle(), date.getContent(),
							date.getVerification(), date.getTime(), date.getType(), date.getPath(), date.getIfcheck());
					node = node.next;
				}
			}
			date = date.next;
		}
		head.setNumber(check_submit_number);
		if (head == null || head.equals(null))
			head = new resource_entity(0);
		return head;
	}

	/**
	 * @return ��ȡ���ǵ���Ĺ���ѧϰ��Դ
	 */
	public resource_entity checkDieResource() {
		resource_entity node = null;
		resource_entity date = allhead;
		resource_entity head = node;
		boolean a = true;
		/**
		 * �ύ��ʧЧ��Դ����
		 */
		int check_die_number = 0;
		for (int i = 0; i < allhead.number; i++) {
			if (date.getIfcheck().equals("2")) {
				check_die_number = check_die_number + 1;
				if (a) {
					node = new resource_entity(date.getUid(), date.getID(), date.getTitle(), date.getContent(),
							date.getVerification(), date.getTime(), date.getType(), date.getPath(), date.getIfcheck());
					head = node;
					a = false;
				} else {
					node.next = new resource_entity(date.getUid(), date.getID(), date.getTitle(), date.getContent(),
							date.getVerification(), date.getTime(), date.getType(), date.getPath(), date.getIfcheck());
					node = node.next;
				}
			}
			date = date.next;
		}
		head.setNumber(check_die_number);
		if (head == null || head.equals(null))
			head = new resource_entity(0);
		return head;
	}

	/**
	 * @return ��ȡ���еĹ���ѧϰ��Դ
	 */
	public resource_entity DieResource() {
		resource_entity node = null;
		resource_entity date = allhead;
		resource_entity head = node;
		boolean a = true;
		/**
		 * ���е�ʧЧ��Դ����
		 */
		int die_number = 0;
		for (int i = 0; i < allhead.number; i++) {
			if (date.getIfcheck().equals("-1")) {
				die_number = die_number + 1;
				if (a) {
					node = new resource_entity(date.getUid(), date.getID(), date.getTitle(), date.getContent(),
							date.getVerification(), date.getTime(), date.getType(), date.getPath(), date.getIfcheck());
					head = node;
					a = false;
				} else {
					node.next = new resource_entity(date.getUid(), date.getID(), date.getTitle(), date.getContent(),
							date.getVerification(), date.getTime(), date.getType(), date.getPath(), date.getIfcheck());
					node = node.next;
				}
			}
			date = date.next;
		}
		head.setNumber(die_number);
		if (head == null || head.equals(null))
			head = new resource_entity(0);
		return head;
	}

	/**
	 * @return ��ȡ���еĲ��ϸ�ѧϰ��Դ
	 */
	public resource_entity errorResource() {
		resource_entity node = null;
		resource_entity date = allhead;
		resource_entity head = node;
		boolean a = true;
		/**
		 * ���еĲ��ϸ���Դ����
		 */
		int error_number = 0;
		for (int i = 0; i < allhead.number; i++) {
			if (date.getIfcheck().equals("0")) {
				error_number = error_number + 1;
				if (a) {
					node = new resource_entity(date.getUid(), date.getID(), date.getTitle(), date.getContent(),
							date.getVerification(), date.getTime(), date.getType(), date.getPath(), date.getIfcheck());
					head = node;
					a = false;
				} else {
					node.next = new resource_entity(date.getUid(), date.getID(), date.getTitle(), date.getContent(),
							date.getVerification(), date.getTime(), date.getType(), date.getPath(), date.getIfcheck());
					node = node.next;
				}
			}
			date = date.next;
		}
		head.setNumber(error_number);
		if (head == null || head.equals(null))
			head = new resource_entity(0);
		return head;
	}

	/**
	 * ��ȡ������µ���Դ��
	 * 
	 * @throws Exception
	 */
	public int newTodayNumber() throws Exception {
		/**
		 * ������µ���Դ��
		 */
		int today_new_number = 0;
		resource_entity head = resource();
		int number = head.number;
		for (int i = 0; i < number; i++) {
			if (compare_time(head.time, 1)) {
				today_new_number = today_new_number + 1;
			}
			if (number - i != 1)
				head = head.next;
		}
		return today_new_number;
	}

	public int dieTodayNumber() throws Exception {
		/**
		 * ����ʧЧ����Դ��
		 */
		int today_die_number = 0;
		resource_entity head = DieResource();
		int number = head.number;
		for (int i = 0; i < number; i++) {
			if (compare_time(head.time, 1)) {
				today_die_number = today_die_number + 1;
			}
			if (number - i != 1)
				head = head.next;
		}
		return today_die_number;
	}

	/**
	 * @param tableTime
	 * @param time
	 * @return
	 * @throws Exception
	 *             ��ʱ��С���ϴ���timeʱ��ʱ������true
	 */
	public boolean compare_time(String tableTime, int time) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-d HH:mm:ss");
		Date start;
		try {
			start = sdf.parse(tableTime);
			Date end = new Date();
			long cha = end.getTime() - start.getTime();
			if (cha < 0) {
				return false;
			}
			double result = cha / (1000 * 60 * 60 * 24);
			if (result < time) {
				return true;
			} else {
				return false;
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * @param ID
	 * @return ��ȡ�û����ǳ�
	 */
	public String getName(String ID) {
		String name = null;
		String sql = "select nickiname from user_data where user_data.ID=" + ID;
		MySQL_connect con = new MySQL_connect();
		try {
			ResultSet rs = con.usercommend.executeQuery(sql);
			rs.next();
			name = rs.getString("nickiname");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return name;
	}

	/**
	 * �ύ��Դ
	 */
	public void uploading(String ID, String title, String content, int type, int path) {
		MySQL_connect con = new MySQL_connect();
		String verification = null;
		String Content = content;
		verification = split(content, path);
		String sql = "insert into learning_resource (ID,title,content,verification,time,type,path,ifcheck) values(" + ID
				+ "," + title + "," + Content + "," + verification + ",localtime()," + type + "," + path + ",3);";
		try {
			con.usercommend.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @param content
	 *            �������з�Ϊ
	 */
	public String split(String content, int path) {
		// TODO Auto-generated method stub
		String verification = null;
		if (path == 1) {
			StringTokenizer chart = new StringTokenizer(content, "��ȡ��:");
			chart.nextToken();
			verification = chart.nextToken();
		} else if (path == 2) {
			verification = "";
		}
		return verification;
	}

	/**
	 * @param uid
	 *            �޸�Ϊ��Դ�ϸ񷽷�
	 */
	public void yes(String uid) {
		MySQL_connect con = new MySQL_connect();
		String sql = "update learning_resource set ifcheck=1 where uid=" + uid;
		try {
			con.usercommend.executeUpdate(sql);
			con.usercommend.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @param uid
	 *            �޸�Ϊ��Դ���ϸ񷽷�
	 */
	public void no(String uid) {
		MySQL_connect con = new MySQL_connect();
		String sql = "update learning_resource set ifcheck=0 where uid=" + uid;
		try {
			con.usercommend.executeUpdate(sql);
			con.usercommend.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @param uid
	 *            �޸�Ϊ��Դ���ڷ���
	 */
	public void die(String uid) {
		MySQL_connect con = new MySQL_connect();
		String sql = "update learning_resource set ifcheck=-1 where uid=" + uid;
		try {
			con.usercommend.executeUpdate(sql);
			con.usercommend.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @param uid
	 *            �û��ύ��Դ
	 */
	public void chick_submit(String uid) {
		MySQL_connect con = new MySQL_connect();
		String sql = "update learning_resource set ifcheck=3 where uid=" + uid;
		try {
			con.usercommend.executeUpdate(sql);
			con.usercommend.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @param uid
	 *            �û�˵��Դ������
	 */
	public void check_die(String uid) {
		MySQL_connect con = new MySQL_connect();
		String sql = "update learning_resource set ifcheck=2 where uid=" + uid;
		try {
			con.usercommend.executeUpdate(sql);
			con.usercommend.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @param pathdaihao
	 * @return ��ȡͬ������������Դ
	 */
	public resource_entity same_path(int pathdaihao) {
		resource_entity node = null;
		resource_entity date = allhead;
		resource_entity head = node;
		boolean a = true;
		for (int i = 0; i < allhead.number; i++) {
			if (date.getPath().equals(pathdaihao)) {
				if (a) {
					node = new resource_entity(date.getUid(), date.getID(), date.getTitle(), date.getContent(),
							date.getVerification(), date.getType(), date.getType(), date.getPath(), date.getIfcheck());
					head = node;
					a = false;
				} else {
					node.next = new resource_entity(date.getUid(), date.getID(), date.getTitle(), date.getContent(),
							date.getVerification(), date.getTime(), date.getType(), date.getPath(), date.getIfcheck());
					node = node.next;
				}
			}
			date = date.next;
		}
		if (head == null || head.equals(null))
			head = new resource_entity(0);
		return head;
	}

}
