package tpm.myfriend.model;

public class MyFriendDTO {
	
	private int member_idx;
	private int myfriend_idx;
	public MyFriendDTO() {
		super();
	}
	public MyFriendDTO(int member_idx, int myfriend_idx) {
		super();
		this.member_idx = member_idx;
		this.myfriend_idx = myfriend_idx;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public int getMyfriend_idx() {
		return myfriend_idx;
	}
	public void setMyfriend_idx(int myfriend_idx) {
		this.myfriend_idx = myfriend_idx;
	}
	@Override
	public String toString() {
		return "MyFriendDTO [member_idx=" + member_idx + ", myfriend_idx=" + myfriend_idx + "]";
	}
	
}
