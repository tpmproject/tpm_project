package tpm.chat.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class ChatDAOImple implements ChatDAO {

	private SqlSessionTemplate sqlMap;

	public ChatDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	// 채팅 화면에서 뿌려줄 프로젝트 리스트 정보 가져오기
	public List<Object> getChatProjectList(Object obj) {
		return sqlMap.selectList("chatProjectList", obj);
	}

	// 채팅 화면에서 뿌려줄 채널 리스트 정보 가져오기
	public List<Object> getChatChannelList(Object obj) {
		// TODO Auto-generated method stub
		return sqlMap.selectList("chatChannelList", obj);
	}

	public int addChat(Object obj) {
		// TODO Auto-generated method stub
		return sqlMap.insert("chatContentInsert", obj);
	}

	public int updateChat() {
		// TODO Auto-generated method stub
		return 0;
	}

	public int delChat() {
		// TODO Auto-generated method stub
		return 0;
	}
	// 채팅 화면에 뿌려줄 해당 채널이나 프로젝트의 채팅 내용 가져오기
	public List<Object> getChatContentList(Object obj) {
		// TODO Auto-generated method stub
		return sqlMap.selectList("chatContentList", obj);
		
	}

	@Override
	public Object getChatContent(Object obj) {
		// TODO Auto-generated method stub
		
		return sqlMap.selectOne("chatContent", obj);
	}

}
