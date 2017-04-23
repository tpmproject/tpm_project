package tpm.channelmember.model;

import java.util.List;

public interface ChannelMemberDAO {
	
	public int insertChannelMember(Object obj);
	public int inviteChannel();
	public int exitChannel();

}
