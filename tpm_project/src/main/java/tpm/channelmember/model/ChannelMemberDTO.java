package tpm.channelmember.model;

public class ChannelMemberDTO {

	private int channel_idx;
	private int member_idx;
	
	public ChannelMemberDTO() {
		super();
	}

	public ChannelMemberDTO(int channel_idx, int member_idx) {
		super();
		this.channel_idx = channel_idx;
		this.member_idx = member_idx;
	}

	public int getChannel_idx() {
		return channel_idx;
	}

	public void setChannel_idx(int channel_idx) {
		this.channel_idx = channel_idx;
	}

	public int getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	
	
	
}
