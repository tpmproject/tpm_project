package tpm.notice.model;

import java.sql.*;

public class NoticeDTO {
	private int notice_idx;
	private int member_idx;
	private int work_idx;
	private Date notice_date;
	private int notice_type;
	private int notice_state;
	
	final public static int NOTICE_UNREAD=1; //알림을 안읽었을때 상태
	final public static int NOTICE_READ=2; //알림을 읽었을때 상태

	final public static int NOTICE_NEWWORK=100; //업무 배정받았을때
	final public static int NOTICE_WORK_ENDDATE=200; //업무 마감일되었을때
	final public static int NOTICE_WORK_NEED_CONFIRM=300; // 업무 결재 요청 받았을때
	final public static int NOTICE_PROJECT_JOIN=400; //프로젝트에 초대 되었을때
	
	public NoticeDTO() {
		super();
	}

	public NoticeDTO(int notice_idx, int member_idx, int work_idx, Date notice_date, int notice_type,
			int notice_state) {
		super();
		this.notice_idx = notice_idx;
		this.member_idx = member_idx;
		this.work_idx = work_idx;
		this.notice_date = notice_date;
		this.notice_type = notice_type;
		this.notice_state = notice_state;
	}

	public int getNotice_idx() {
		return notice_idx;
	}

	public void setNotice_idx(int notice_idx) {
		this.notice_idx = notice_idx;
	}

	public int getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}

	public int getWork_idx() {
		return work_idx;
	}

	public void setWork_idx(int work_idx) {
		this.work_idx = work_idx;
	}

	public Date getNotice_date() {
		return notice_date;
	}

	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}

	public int getNotice_type() {
		return notice_type;
	}

	public void setNotice_type(int notice_type) {
		this.notice_type = notice_type;
	}

	public int getNotice_state() {
		return notice_state;
	}

	public void setNotice_state(int notice_state) {
		this.notice_state = notice_state;
	}

	public static int getNoticeUnread() {
		return NOTICE_UNREAD;
	}

	public static int getNoticeRead() {
		return NOTICE_READ;
	}

	public static int getNoticeNewwork() {
		return NOTICE_NEWWORK;
	}

	public static int getNoticeWorkEnddate() {
		return NOTICE_WORK_ENDDATE;
	}

	public static int getNoticeWorkNeedConfirm() {
		return NOTICE_WORK_NEED_CONFIRM;
	}

	public static int getNoticeProjectJoin() {
		return NOTICE_PROJECT_JOIN;
	}
	
	
	
	
}
