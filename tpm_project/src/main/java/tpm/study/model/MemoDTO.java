package tpm.study.model;

import java.util.List;

public class MemoDTO {
	private int memo_idx;
	private String memo_subject, memo_name, memo_email, memo_day, memo_memo;
	private List<CommentDTO> comments;

	public MemoDTO() {
		super();
	}

	public MemoDTO(int memo_idx, String memo_subject, String memo_name, String memo_email, String memo_day,
			String memo_memo, List<CommentDTO> comments) {
		super();
		this.memo_idx = memo_idx;
		this.memo_subject = memo_subject;
		this.memo_name = memo_name;
		this.memo_email = memo_email;
		this.memo_day = memo_day;
		this.memo_memo = memo_memo;
		this.comments = comments;
	}

	public int getMemo_idx() {
		return memo_idx;
	}

	public void setMemo_idx(int memo_idx) {
		this.memo_idx = memo_idx;
	}

	public String getMemo_subject() {
		return memo_subject;
	}

	public void setMemo_subject(String memo_subject) {
		this.memo_subject = memo_subject;
	}

	public String getMemo_name() {
		return memo_name;
	}

	public void setMemo_name(String memo_name) {
		this.memo_name = memo_name;
	}

	public String getMemo_email() {
		return memo_email;
	}

	public void setMemo_email(String memo_email) {
		this.memo_email = memo_email;
	}

	public String getMemo_day() {
		return memo_day;
	}

	public void setMemo_day(String memo_day) {
		this.memo_day = memo_day;
	}

	public String getMemo_memo() {
		return memo_memo;
	}

	public void setMemo_memo(String memo_memo) {
		this.memo_memo = memo_memo;
	}

	public List<CommentDTO> getComments() {
		return comments;
	}

	public void setComments(List<CommentDTO> comments) {
		this.comments = comments;
	}

	@Override
	public String toString() {
		return "MemoDTO [memo_idx=" + memo_idx + ", memo_subject=" + memo_subject + ", memo_name=" + memo_name
				+ ", memo_email=" + memo_email + ", memo_day=" + memo_day + ", memo_memo=" + memo_memo + ", comments="
				+ comments + "]";
	}

}
