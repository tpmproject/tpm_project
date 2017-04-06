package tpm.sample.model;

public class ItemDTO {
	private String title;
	private int num;
	private String bigo;
	public ItemDTO() {
		super();
	}
	public ItemDTO(String title, int num, String bigo) {
		super();
		this.title = title;
		this.num = num;
		this.bigo = bigo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getBigo() {
		return bigo;
	}
	public void setBigo(String bigo) {
		this.bigo = bigo;
	}
}
