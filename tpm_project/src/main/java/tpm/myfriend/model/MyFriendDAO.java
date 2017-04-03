package tpm.myfriend.model;

import java.util.ArrayList;

public interface MyFriendDAO {
	
	public ArrayList<MyFriendDTO> getFriendList();
	public int addFriend();
	public int searchFriend();
	public int delFriend();

}