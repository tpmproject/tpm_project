package tpm.chat.model;

import java.util.ArrayList;
import java.util.List;

public interface ChatDAO {
	
	public List<Object> getChatProjectList(Object dto);
	public List<Object> getChatChannelList(Object dto);
	public int addChat();
	public int updateChat();
	public int delChat();

}
