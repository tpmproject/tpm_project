package tpm.sample.model;

import java.sql.Date;
import java.sql.Timestamp;

public class SampleWork2DTO {
	private int work_idx;
	private int category_idx;
	private String work_title;

	// 업무 기한
	private Date work_start;
	private Date work_end;
	private Date work_complete;

	private int work_confirm; // 결재 요청여부
	private int work_state; // 결재 상태

	private SampleCheckListDTO sampleCheckList;

	public SampleWork2DTO() {
		super();
	}

	public SampleWork2DTO(int work_idx, int category_idx, String work_title, Date work_start, Date work_end,
			Date work_complete, int work_confirm, int work_state, SampleCheckListDTO sampleCheckList) {
		super();
		this.work_idx = work_idx;
		this.category_idx = category_idx;
		this.work_title = work_title;
		this.work_start = work_start;
		this.work_end = work_end;
		this.work_complete = work_complete;
		this.work_confirm = work_confirm;
		this.work_state = work_state;
		this.sampleCheckList = sampleCheckList;
	}

	public int getWork_idx() {
		return work_idx;
	}

	public void setWork_idx(int work_idx) {
		this.work_idx = work_idx;
	}

	public int getCategory_idx() {
		return category_idx;
	}

	public void setCategory_idx(int category_idx) {
		this.category_idx = category_idx;
	}

	public String getWork_title() {
		return work_title;
	}

	public void setWork_title(String work_title) {
		this.work_title = work_title;
	}

	public Date getWork_start() {
		return work_start;
	}

	public void setWork_start(Date work_start) {
		this.work_start = work_start;
	}

	public Date getWork_end() {
		return work_end;
	}

	public void setWork_end(Date work_end) {
		this.work_end = work_end;
	}

	public Date getWork_complete() {
		return work_complete;
	}

	public void setWork_complete(Date work_complete) {
		this.work_complete = work_complete;
	}

	public int getWork_confirm() {
		return work_confirm;
	}

	public void setWork_confirm(int work_confirm) {
		this.work_confirm = work_confirm;
	}

	public int getWork_state() {
		return work_state;
	}

	public void setWork_state(int work_state) {
		this.work_state = work_state;
	}

	public SampleCheckListDTO getSampleCheckList() {
		return sampleCheckList;
	}

	public void setSampleCheckList(SampleCheckListDTO sampleCheckList) {
		this.sampleCheckList = sampleCheckList;
	}

	@Override
	public String toString() {
		return "SampleWork2DTO [work_idx=" + work_idx + ", category_idx=" + category_idx + ", work_title=" + work_title
				+ ", work_start=" + work_start + ", work_end=" + work_end + ", work_complete=" + work_complete
				+ ", work_confirm=" + work_confirm + ", work_state=" + work_state + ", sampleCheckList="
				+ sampleCheckList + "]";
	}

}
