package tpm.project.model;

import java.sql.Date;

public class TotalDTO {
	
	private int project_idx;
	private String project_name;
	private int project_state;
	private String project_content;
	
	private int category_idx;
	private String category_name;
	
	private int work_idx;
	private String work_title;
	
	private Date work_start;
	private Date work_end;
	private Date work_complete;
	
	private int work_confirm; //결재 요청여부
	private int work_state; //결재 상태
	
	private int checklist_idx;
	private String checklit_content;
	private int checklist_state;
	
	public TotalDTO() {
		super();
	}

	public TotalDTO(int project_idx, String project_name, int project_state, String project_content, int category_idx,
			String category_name, int work_idx, String work_title, Date work_start, Date work_end, Date work_complete,
			int work_confirm, int work_state, int checklist_idx, String checklit_content, int checklist_state) {
		super();
		this.project_idx = project_idx;
		this.project_name = project_name;
		this.project_state = project_state;
		this.project_content = project_content;
		this.category_idx = category_idx;
		this.category_name = category_name;
		this.work_idx = work_idx;
		this.work_title = work_title;
		this.work_start = work_start;
		this.work_end = work_end;
		this.work_complete = work_complete;
		this.work_confirm = work_confirm;
		this.work_state = work_state;
		this.checklist_idx = checklist_idx;
		this.checklit_content = checklit_content;
		this.checklist_state = checklist_state;
	}

	public int getProject_idx() {
		return project_idx;
	}

	public void setProject_idx(int project_idx) {
		this.project_idx = project_idx;
	}

	public String getProject_name() {
		return project_name;
	}

	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}

	public int getProject_state() {
		return project_state;
	}

	public void setProject_state(int project_state) {
		this.project_state = project_state;
	}

	public String getProject_content() {
		return project_content;
	}

	public void setProject_content(String project_content) {
		this.project_content = project_content;
	}

	public int getCategory_idx() {
		return category_idx;
	}

	public void setCategory_idx(int category_idx) {
		this.category_idx = category_idx;
	}

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}

	public int getWork_idx() {
		return work_idx;
	}

	public void setWork_idx(int work_idx) {
		this.work_idx = work_idx;
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

	public int getChecklist_idx() {
		return checklist_idx;
	}

	public void setChecklist_idx(int checklist_idx) {
		this.checklist_idx = checklist_idx;
	}

	public String getChecklit_content() {
		return checklit_content;
	}

	public void setChecklit_content(String checklit_content) {
		this.checklit_content = checklit_content;
	}

	public int getChecklist_state() {
		return checklist_state;
	}

	public void setChecklist_state(int checklist_state) {
		this.checklist_state = checklist_state;
	}
	
	
}
