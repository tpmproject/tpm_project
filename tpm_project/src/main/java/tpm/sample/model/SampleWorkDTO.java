package tpm.sample.model;

import java.sql.Timestamp;
import java.util.*;

public class SampleWorkDTO {
	private int work_idx;
	private int category_idx;
	private String work_title;

	// 업무 기한
	private Timestamp work_start;
	private Timestamp work_end;
	private Timestamp work_complete;

	private int work_confirm; // 결재 요청여부
	private int work_state; // 결재 상태
	
	private SampleCheckListDTO sampleCheckList;

	public SampleWorkDTO() {
		super();
	}

	public SampleWorkDTO(int work_idx, int category_idx, String work_title, Timestamp work_start, Timestamp work_end,
			Timestamp work_complete, int work_confirm, int work_state, SampleCheckListDTO sampleCheckList) {
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

	public Timestamp getWork_start() {
		return work_start;
	}

	public void setWork_start(Timestamp work_start) {
		this.work_start = work_start;
	}

	public Timestamp getWork_end() {
		return work_end;
	}

	public void setWork_end(Timestamp work_end) {
		this.work_end = work_end;
	}

	public Timestamp getWork_complete() {
		return work_complete;
	}

	public void setWork_complete(Timestamp work_complete) {
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

	
}
