package tpm.chat.model;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

public class ChatDAOImple implements ChatDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public ChatDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap=sqlMap;
	}
	
	public ArrayList<ChatDTO> getChatList() {
		// TODO Auto-generated method stub
		return null;
	}

	public int addChat() {
		// TODO Auto-generated method stub
		return 0;
	}

	public int updateChat() {
		// TODO Auto-generated method stub
		return 0;
	}

	public int delChat() {
		// TODO Auto-generated method stub
		return 0;
	}

}
