package dao;

public class Notice {
	private String id;
	private String tittle;
	private String content;
	private String postdate;
	public Notice() {
		
	}
	public Notice(String id, String content) {
		super();
		this.id = id;
		this.content = content;
	}
	public Notice(String id, String tittle, String content, String postdate) {
		super();
		this.id = id;
		this.tittle = tittle;
		this.content = content;
		this.postdate = postdate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTittle() {
		return tittle;
	}
	public void setTitle(String tittle) {
		this.tittle = tittle;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPostdate() {
		return postdate;
	}
	public void setPostdate(String postdate) {
		this.postdate = postdate;
	}
	//

}
