package tpm.project.model;

import java.sql.Date;
import java.sql.Timestamp;

public class TotalDTO {
	
	private int project_idx;
	private String project_name;
	private int project_state;
	private String project_content;
	private int project_level;
	
	private int category_idx;
	private String category_name;
	
	private int work_idx;
	private String work_title;
	
	private Timestamp work_start;
	private Timestamp work_end;
	private Timestamp work_complete;
	
	private int work_confirm; //결재 요청여부
	private int work_state; //결재 상태
	
	private int checklist_idx;
	private String checklist_content;
	private int checklist_state;
	
	private int category_num;
	private int work_num;
	private int checklist_num;
	
	public TotalDTO() {
		super();
	}

	public TotalDTO(int project_idx, String project_name, int project_state, String project_content, int category_idx,
			String category_name, int work_idx, String work_title, Timestamp work_start, Timestamp work_end, Timestamp work_complete,
			int work_confirm, int work_state, int checklist_idx, String checklist_content, int checklist_state,
			int category_num, int work_num, int checklist_num) {
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
		this.checklist_content = checklist_content;
		this.checklist_state = checklist_state;
		this.category_num = category_num;
		this.work_num = work_num;
		this.checklist_num = checklist_num;
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

	public int getProject_level() {
		return project_level;
	}

	public void setProject_level(int project_level) {
		this.project_level = project_level;
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

	public int getChecklist_idx() {
		return checklist_idx;
	}

	public void setChecklist_idx(int checklist_idx) {
		this.checklist_idx = checklist_idx;
	}

	public String getChecklist_content() {
		return checklist_content;
	}

	public void setChecklist_content(String checklist_content) {
		this.checklist_content = checklist_content;
	}

	public int getChecklist_state() {
		return checklist_state;
	}

	public void setChecklist_state(int checklist_state) {
		this.checklist_state = checklist_state;
	}

	public int getCategory_num() {
		return category_num;
	}

	public void setCategory_num(int category_num) {
		this.category_num = category_num;
	}

	public int getWork_num() {
		return work_num;
	}

	public void setWork_num(int work_num) {
		this.work_num = work_num;
	}

	public int getChecklist_num() {
		return checklist_num;
	}

	public void setChecklist_num(int checklist_num) {
		this.checklist_num = checklist_num;
	}

	@Override
	public String toString() {
		return "TotalDTO [project_idx=" + project_idx + ", project_name=" + project_name + ", project_state="
				+ project_state + ", project_content=" + project_content + ", category_idx=" + category_idx
				+ ", category_name=" + category_name + ", work_idx=" + work_idx + ", work_title=" + work_title
				+ ", work_start=" + work_start + ", work_end=" + work_end + ", work_complete=" + work_complete
				+ ", work_confirm=" + work_confirm + ", work_state=" + work_state + ", checklist_idx=" + checklist_idx
				+ ", checklist_content=" + checklist_content + ", checklist_state=" + checklist_state
				+ ", category_num=" + category_num + ", work_num=" + work_num + ", checklist_num=" + checklist_num
				+ "]";
	}
	
	
}
