package tpm.myfriend.model;

public class MyFriendDTO {
	
	private int member_idx;
	private int friend_idx;
	
	public MyFriendDTO() {
		super();
	}

	public MyFriendDTO(int member_idx, int friend_idx) {
		super();
		this.member_idx = member_idx;
		this.friend_idx = friend_idx;
	}

	public int getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}

	public int getFriend_idx() {
		return friend_idx;
	}

	public void setFriend_idx(int friend_idx) {
		this.friend_idx = friend_idx;
	}
	
	
}
