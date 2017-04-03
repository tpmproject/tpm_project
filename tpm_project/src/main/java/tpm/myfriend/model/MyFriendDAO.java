package tpm.myfriend.model;

import java.util.ArrayList;

public interface MyFriendDAO {
	
	public ArrayList<MyFriendDTO> getFriendAllList();
	public ArrayList<MyFriendDTO> getFriendList(MyFriendDTO dto);
	public int addFriend();
	public int searchFriend();
	public int delFriend();

}
