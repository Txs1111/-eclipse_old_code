package dao;


public class Message {
	public String head_photo;// ͷ���ַ
	public String ID = null;// ������
	public String nickiname = null;// ������
	public String title = null;// ����
	public String content = null;// ����
	public String content_photourl = null;// ����ͼƬ��ַ
	public String psotdate = null;// ʱ��
	public String like = null;// ������
	public Message next;// ������һ�ڵ�

	public Message() {
	}

	public Message(String head_photo, String ID, String nickiname, String title, String content,
			String content_photourl, String psotdate, String like) {
		super();
		this.head_photo = head_photo;
		this.ID = ID;
		this.nickiname = nickiname;
		this.title = title;
		this.content = content;
		this.content_photourl = content_photourl;
		this.psotdate = psotdate;
		this.like = like;
	}

	// ###################################################################3
	public String gethead_photo() {
		return head_photo;
	}

	public String getLike() {
		return like;
	}

	public String getnickiname() {
		return nickiname;
	}

	public void setnickiname(String nickiname) {
		this.nickiname = nickiname;
	}

	public String getPsotdate() {
		return psotdate;
	}

	public void setPsotdate(String psotdate) {
		this.psotdate = psotdate;
	}

	public void setLike(String like) {
		this.like = like;
	}

	public void sethead_photo(String head_photo) {
		this.head_photo = head_photo;
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

	public String getContent_photourl() {
		return content_photourl;
	}

	public void setContent_photourl(String content_photourl) {
		this.content_photourl = content_photourl;
	}

}
