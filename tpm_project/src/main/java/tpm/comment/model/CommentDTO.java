package tpm.comment.model;

import java.sql.*;
		
public class CommentDTO {

	private int comment_idx;
	private int work_idx;
	private int member_idx;
	private String comment_content;
	private Timestamp comment_date;
	
	private String member_id;
	private String member_name;
	private String member_img;
	
	public CommentDTO() {
		super();
	}

	public CommentDTO(int comment_idx, int work_idx, int member_idx, String comment_content, Timestamp comment_date) {
		super();
		this.comment_idx = comment_idx;
		this.work_idx = work_idx;
		this.member_idx = member_idx;
		this.comment_content = comment_content;
		this.comment_date = comment_date;
	}
	
	public CommentDTO(int comment_idx, int work_idx, int member_idx, String comment_content, Timestamp comment_date,
			String member_id, String member_name, String member_img) {
		super();
		this.comment_idx = comment_idx;
		this.work_idx = work_idx;
		this.member_idx = member_idx;
		this.comment_content = comment_content;
		this.comment_date = comment_date;
		this.member_id = member_id;
		this.member_name = member_name;
		this.member_img = member_img;
	}

	public int getComment_idx() {
		return comment_idx;
	}

	public void setComment_idx(int comment_idx) {
		this.comment_idx = comment_idx;
	}

	public int getWork_idx() {
		return work_idx;
	}

	public void setWork_idx(int work_idx) {
		this.work_idx = work_idx;
	}

	public int getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}

	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}

	public Timestamp getComment_date() {
		return comment_date;
	}

	public void setComment_date(Timestamp comment_date) {
		this.comment_date = comment_date;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_img() {
		return member_img;
	}

	public void setMember_img(String member_img) {
		this.member_img = member_img;
	}

	@Override
	public String toString() {
		return "CommentDTO [comment_idx=" + comment_idx + ", work_idx=" + work_idx + ", member_idx=" + member_idx
				+ ", comment_content=" + comment_content + ", comment_date=" + comment_date + "]";
	}
}
