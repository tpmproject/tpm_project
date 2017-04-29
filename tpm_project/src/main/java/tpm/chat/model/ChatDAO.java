package tpm.chat.model;

import java.util.ArrayList;
import java.util.List;

public interface ChatDAO {
	
	public List<Object> getChatProjectList(Object obj);
	public List<Object> getChatChannelList(Object obj);
	public List<Object> getChatContentList(Object obj);
	public Object getChatContent(Object obj);
	public List<Object> getChatMemberList(Object obj);
	public int addChat(Object obj);
	public int updateChat();
	public int delChat();

}
