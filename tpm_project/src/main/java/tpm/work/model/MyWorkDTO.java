package tpm.work.model;

import java.sql.Date;

public class MyWorkDTO {
	private int project_idx;
	private String project_name;
	private String project_content;
	private int project_state;
	
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
	private String checklist_content;
	private int checklist_state;
}
