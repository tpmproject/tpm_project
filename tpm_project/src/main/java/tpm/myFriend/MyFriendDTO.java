package tpm.myFriend;

import java.util.ArrayList;

public class MyFriendDTO {
	private int member_idx;
	private int myfriend_idx;
	
	private ArrayList<MyFriendDTO> myfriends;

	public MyFriendDTO() {
		super();
	}

	public MyFriendDTO(int member_idx, int myfriend_idx, ArrayList<MyFriendDTO> myfriends) {
		super();
		this.member_idx = member_idx;
		this.myfriend_idx = myfriend_idx;
		this.myfriends = myfriends;
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

	public ArrayList<MyFriendDTO> getMyfriends() {
		return myfriends;
	}

	public void setMyfriends(ArrayList<MyFriendDTO> myfriends) {
		this.myfriends = myfriends;
	}

}
