package tpm.myfriend.model;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

public class MyFriendDAOImple implements MyFriendDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public MyFriendDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap=sqlMap;
	}
	
	public ArrayList<MyFriendDTO> getFriendAllList() {
		// TODO Auto-generated method stub
		return null;
	}

	public ArrayList<MyFriendDTO> getFriendList(MyFriendDTO dto) {
		// TODO Auto-generated method stub
		ArrayList<MyFriendDTO> array_dto = (ArrayList) sqlMap.selectList("myfriendList", dto);
		return array_dto;
	}

	public int addFriend() {
		// TODO Auto-generated method stub
		return 0;
	}

	public int searchFriend() {
		// TODO Auto-generated method stub
		return 0;
	}

	public int delFriend() {
		// TODO Auto-generated method stub
		return 0;
	}

	
	
	

}
