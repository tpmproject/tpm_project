package tpm.study.model;

public class CommentDTO {
	private int comment_idx, memo_idx;
	private String comment_name, comment_email, comment_day, comment_comm;

	public CommentDTO() {
		super();
	}

	public CommentDTO(int comment_idx, int memo_idx, String comment_name, String comment_email, String comment_day,
			String comment_comm) {
		super();
		this.comment_idx = comment_idx;
		this.memo_idx = memo_idx;
		this.comment_name = comment_name;
		this.comment_email = comment_email;
		this.comment_day = comment_day;
		this.comment_comm = comment_comm;
	}

	public int getComment_idx() {
		return comment_idx;
	}

	public void setComment_idx(int comment_idx) {
		this.comment_idx = comment_idx;
	}

	public int getMemo_idx() {
		return memo_idx;
	}

	public void setMemo_idx(int memo_idx) {
		this.memo_idx = memo_idx;
	}

	public String getComment_name() {
		return comment_name;
	}

	public void setComment_name(String comment_name) {
		this.comment_name = comment_name;
	}

	public String getComment_email() {
		return comment_email;
	}

	public void setComment_email(String comment_email) {
		this.comment_email = comment_email;
	}

	public String getComment_day() {
		return comment_day;
	}

	public void setComment_day(String comment_day) {
		this.comment_day = comment_day;
	}

	public String getComment_comm() {
		return comment_comm;
	}

	public void setComment_comm(String comment_comm) {
		this.comment_comm = comment_comm;
	}

	@Override
	public String toString() {
		return "CommentDTO [comment_idx=" + comment_idx + ", memo_idx=" + memo_idx + ", comment_name=" + comment_name
				+ ", comment_email=" + comment_email + ", comment_day=" + comment_day + ", comment_comm=" + comment_comm
				+ "]";
	}

}
