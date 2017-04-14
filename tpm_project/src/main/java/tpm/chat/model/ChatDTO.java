package tpm.chat.model;

import java.sql.*;
import java.util.List;

import tpm.member.model.MemberDTO;

public class ChatDTO {

	private int chat_idx;
	private int member_idx;
	private String chat_cp_code;
	private int chat_cp_value;
	private String chat_content;
	private Date chat_date;

	private MemberDTO mdto;

	public ChatDTO() {
		super();
	}

	public ChatDTO(String chat_cp_code, int chat_cp_value) {
		super();
		this.chat_cp_code = chat_cp_code;
		this.chat_cp_value = chat_cp_value;
	}

	public ChatDTO(int chat_idx, int member_idx, String chat_cp_code, int chat_cp_value, String chat_content,
			Date chat_date) {
		super();
		this.chat_idx = chat_idx;
		this.member_idx = member_idx;
		this.chat_cp_code = chat_cp_code;
		this.chat_cp_value = chat_cp_value;
		this.chat_content = chat_content;
		this.chat_date = chat_date;
	}

	public ChatDTO(int chat_idx, int member_idx, String chat_cp_code, int chat_cp_value, String chat_content,
			Date chat_date, MemberDTO mdto) {
		super();
		this.chat_idx = chat_idx;
		this.member_idx = member_idx;
		this.chat_cp_code = chat_cp_code;
		this.chat_cp_value = chat_cp_value;
		this.chat_content = chat_content;
		this.chat_date = chat_date;
		this.mdto = mdto;
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

	public Date getChat_date() {
		return chat_date;
	}

	public void setChat_date(Date chat_date) {
		this.chat_date = chat_date;
	}

	public MemberDTO getMdto() {
		return mdto;
	}

	public void setMdto(MemberDTO mdto) {
		this.mdto = mdto;
	}

	@Override
	public String toString() {
		return "ChatDTO [chat_idx=" + chat_idx + ", member_idx=" + member_idx + ", chat_cp_code=" + chat_cp_code
				+ ", chat_cp_value=" + chat_cp_value + ", chat_content=" + chat_content + ", chat_date=" + chat_date
				+ ", mdto=" + mdto + "]";
	}

}
