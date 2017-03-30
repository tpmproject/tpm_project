package tpm.channel.model;

public class ChannelDTO {
	
	private int channel_idx;
	private String channel_name;
	
	public ChannelDTO() {
		super();
	}

	public ChannelDTO(int channel_idx, String channel_name) {
		super();
		this.channel_idx = channel_idx;
		this.channel_name = channel_name;
	}

	public int getChannel_idx() {
		return channel_idx;
	}

	public void setChannel_idx(int channel_idx) {
		this.channel_idx = channel_idx;
	}

	public String getChannel_name() {
		return channel_name;
	}

	public void setChannel_name(String channel_name) {
		this.channel_name = channel_name;
	}
	
	
}
