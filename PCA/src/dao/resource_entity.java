package dao;

/**
 * @author Lyon ��ȡѧϰ��Դ��ʵ����
 */

public class resource_entity {
	public resource_entity next;
	public String uid = null;
	/**
	 * �ϴ���ԴID
	 */
	public String ID = null;
	/**
	 * ��Դ����
	 */
	public String title = null;
	/**
	 * ��Դ����
	 */
	public String content = null;
	/**
	 * ��Դ��ȡ��
	 */
	public String verification = null;
	/**
	 * ��Դ�ύʱ��
	 */
	public String time = null;
	/**
	 * ��Դ���ʹ���
	 */
	public String type = null;
	/**
	 * ��Դ������
	 */
	public String type_name = null;
	/**
	 * ��Դ����ͼƬ��ַ
	 */
	String type_url = null;
	/**
	 * ��Դ���ࣨeg���ٶ�����,��������������
	 */
	public String path = null;
	/**
	 * ��Դ���ࣨeg���ٶ�����,������������
	 */
	public String path_name = null;
	/**
	 * ��Դ���ࣨeg���ٶ�����,����������ͼƬ��ַ
	 */
	String path_url = null;
	/**
	 * ��ԴĿǰ״��
	 */
	String ifcheck = null;
	/**
	 * ������Դ������
	 */
	public int number = 0;

	// ***********************************************************************************//

	/**
	 * @param iD
	 * @param title
	 * @param content
	 * @param verification
	 * @param time
	 * @param type
	 * @param path
	 * @param ifcheck
	 */
	public resource_entity(String uid, String iD, String title, String content, String verification, String time,
			String type, String path, String ifcheck) {
		super();
		this.uid = uid;
		this.ID = iD;
		this.title = title;
		this.content = content;
		this.verification = verification;
		this.time = time;
		this.type = type;
		this.path = path;
		this.ifcheck = ifcheck;
	}

	/**
	 * @param number
	 */
	public resource_entity(int number) {
		super();
		this.number = number;
	}

	@Override
	public String toString() {
		return "resource_entity [next=" + next + ", uid=" + uid + ", ID=" + ID + ", title=" + title + ", content="
				+ content + ", verification=" + verification + ", time=" + time + ", type=" + type + ", type_name="
				+ type_name + ", type_url=" + type_url + ", path=" + path + ", path_name=" + path_name + ", path_url="
				+ path_url + ", ifcheck=" + ifcheck + ", number=" + number + "]";
	}

	/**
	 * �޲ι��췽��
	 */
	public resource_entity() {
		super();
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getVerification() {
		return verification;
	}

	public void setVerification(String verification) {
		this.verification = verification;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getType_name() {
		return type_name;
	}

	public void setType_name(String type_name) {
		this.type_name = type_name;
	}

	public String getType_url() {
		return type_url;
	}

	public void setType_url(String type_url) {
		this.type_url = type_url;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getPath_name() {
		return path_name;
	}

	public void setPath_name(String path_name) {
		this.path_name = path_name;
	}

	public String getPath_url() {
		return path_url;
	}

	public void setPath_url(String path_url) {
		this.path_url = path_url;
	}

	public String getIfcheck() {
		return ifcheck;
	}

	public void setIfcheck(String ifcheck) {
		this.ifcheck = ifcheck;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

}
