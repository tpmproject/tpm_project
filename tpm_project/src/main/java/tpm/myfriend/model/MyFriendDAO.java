package tpm.myfriend.model;

import java.util.ArrayList;

import tpm.member.model.MemberDTO;

public interface MyFriendDAO {
	
	public ArrayList<MyFriendDTO> getFriendAllList();
	public ArrayList<MyFriendDTO> getFriendList(MyFriendDTO dto);
	public ArrayList<MemberDTO> getFriendMemberInfoList(MyFriendDTO dto);
	public int addFriend(MyFriendDTO dto);
	public int searchFriend();
	public int delFriend(MyFriendDTO dto);

}
