package tpm.chat.model;

import java.sql.*;

public class ChatDTO {

	private int chat_idx;
	private int member_idx;
	private String chat_cp_code;
	private int chat_cp_value;
	private String chat_content;
	private Timestamp chat_date;

	public ChatDTO() {
		super();
	}

	public ChatDTO(String chat_cp_code, int chat_cp_value) {
		super();
		this.chat_cp_code = chat_cp_code;
		this.chat_cp_value = chat_cp_value;
	}

	public ChatDTO(int chat_idx, int member_idx, String chat_cp_code, int chat_cp_value, String chat_content,
			Timestamp chat_date) {
		super();
		this.chat_idx = chat_idx;
		this.member_idx = member_idx;
		this.chat_cp_code = chat_cp_code;
		this.chat_cp_value = chat_cp_value;
		this.chat_content = chat_content;
		this.chat_date = chat_date;
	}

	public int getChat_idx() {
		return chat_idx;
	}

	public void setChat_idx(int chat_idx) {
		this.chat_idx = chat_idx;
	}

	public int getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}

	public String getChat_cp_code() {
		return chat_cp_code;
	}

	public void setChat_cp_code(String chat_cp_code) {
		this.chat_cp_code = chat_cp_code;
	}

	public int getChat_cp_value() {
		return chat_cp_value;
	}

	public void setChat_cp_value(int chat_cp_value) {
		this.chat_cp_value = chat_cp_value;
	}

	public String getChat_content() {
		return chat_content;
	}

	public void setChat_content(String chat_content) {
		this.chat_content = chat_content;
	}

	public Timestamp getChat_date() {
		return chat_date;
	}

	public void setChat_date(Timestamp chat_date) {
		this.chat_date = chat_date;
	}

	@Override
	public String toString() {
		return "ChatDTO [chat_idx=" + chat_idx + ", member_idx=" + member_idx + ", chat_cp_code=" + chat_cp_code
				+ ", chat_cp_value=" + chat_cp_value + ", chat_content=" + chat_content + ", chat_date=" + chat_date
				+ "]";
	}

	

}
