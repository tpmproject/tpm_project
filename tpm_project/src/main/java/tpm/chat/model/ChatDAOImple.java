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
	public List<Object> getChatProjectList(Object dto) {
		return sqlMap.selectList("chatProjectList", dto);
	}

	// 채팅 화면에서 뿌려줄 채널 리스트 정보 가져오기
	public List<Object> getChatChannelList(Object dto) {
		// TODO Auto-generated method stub
		return sqlMap.selectList("chatChannelList", dto);
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
