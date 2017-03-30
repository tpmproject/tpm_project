package tpm.chat.model;

import java.util.ArrayList;

public interface ChatDAO {
	
	public ArrayList<ChatDTO> getChatList();
	public int addChat();
	public int updateChat();
	public int delChat();

}
