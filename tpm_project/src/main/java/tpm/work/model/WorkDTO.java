package tpm.work.model;

import java.sql.*;
import java.util.ArrayList;

import tpm.checklist.model.ChecklistDTO;
import tpm.member.model.MemberDTO;

public class WorkDTO {
	
	private int work_idx;
	private int category_idx;
	private String work_title;
	
	//업무 기한
	private Timestamp work_start;
	private Timestamp work_end;
	private Timestamp work_complete;
	
	private int work_confirm; //결재 요청여부
	private int work_state; //결재 상태
	
	private String project_name;
	private String category_name;
	private ArrayList<ChecklistDTO> checklist_dtos;
	private ArrayList<WorkMemberDTO> workmember_dtos;
	private ArrayList<MemberDTO> workmember_wdto;
	
	final public static int WORK_NEED_CONFIRM=10; //결재 필요 업무
	final public static int WORK_NO_CONFIRM=20; //결재 불필요 업무
	
	final public static int WORK_ING=1; //업무 진행중, 업무 결재 요청 전
	final public static int WORK_CONFIRM_WAIT=2; //업무 결재 요청 후
	final public static int WORK_CONFIRM_FIN=3; //업무 완료, 결재 승인
	
		
	
	public WorkDTO() {
		
		super();
	}
	
	

	public WorkDTO(int work_idx, int category_idx, String work_title, Timestamp work_start, Timestamp work_end,
			Timestamp work_complete, int work_confirm, int work_state, String project_name, String category_name,
			ArrayList<ChecklistDTO> checklist_dtos) {
		super();
		this.work_idx = work_idx;
		this.category_idx = category_idx;
		this.work_title = work_title;
		
		this.work_start = work_start;
		this.work_end = work_end;
		this.work_complete = work_complete;
		
		this.work_confirm = work_confirm;
		this.work_state = work_state;
		
		this.project_name = project_name;
		this.category_name = category_name;
		this.checklist_dtos = checklist_dtos;
	}
	
	


	public WorkDTO(int work_idx, int category_idx, String work_title, Timestamp work_start, Timestamp work_end,
			Timestamp work_complete, int work_confirm, int work_state, String project_name, String category_name,
			ArrayList<ChecklistDTO> checklist_dtos, ArrayList<WorkMemberDTO> workmember_dtos) {
		super();
		this.work_idx = work_idx;
		this.category_idx = category_idx;
		this.work_title = work_title;
		this.work_start = work_start;
		this.work_end = work_end;
		this.work_complete = work_complete;
		this.work_confirm = work_confirm;
		this.work_state = work_state;
		this.project_name = project_name;
		this.category_name = category_name;
		this.checklist_dtos = checklist_dtos;
		this.workmember_dtos = workmember_dtos;
	}



	public WorkDTO(int work_idx, int category_idx, String work_title, Timestamp work_start, Timestamp work_end,
			Timestamp work_complete, int work_confirm, int work_state, String project_name, String category_name,
			ArrayList<ChecklistDTO> checklist_dtos, ArrayList<WorkMemberDTO> workmember_dtos,
			ArrayList<MemberDTO> workmember_wdto) {
		super();
		this.work_idx = work_idx;
		this.category_idx = category_idx;
		this.work_title = work_title;
		this.work_start = work_start;
		this.work_end = work_end;
		this.work_complete = work_complete;
		this.work_confirm = work_confirm;
		this.work_state = work_state;
		this.project_name = project_name;
		this.category_name = category_name;
		this.checklist_dtos = checklist_dtos;
		this.workmember_dtos = workmember_dtos;
		this.workmember_wdto = workmember_wdto;
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



	public String getCategory_name() {
		return category_name;
	}



	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}


	
	public String getProject_name() {
		return project_name;
	}



	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}



	public ArrayList<ChecklistDTO> getChecklist_dtos() {
		return checklist_dtos;
	}



	public void setChecklist_dtos(ArrayList<ChecklistDTO> checklist_dtos) {
		this.checklist_dtos = checklist_dtos;
	}



	public ArrayList<WorkMemberDTO> getWorkmember_dtos() {
		return workmember_dtos;
	}



	public void setWorkmember_dtos(ArrayList<WorkMemberDTO> workmember_dtos) {
		this.workmember_dtos = workmember_dtos;
	}



	public ArrayList<MemberDTO> getWorkmember_wdto() {
		return workmember_wdto;
	}



	public void setWorkmember_wdto(ArrayList<MemberDTO> workmember_wdto) {
		this.workmember_wdto = workmember_wdto;
	}



	@Override
	public String toString() {
		return "WorkDTO [work_idx=" + work_idx + ", category_idx=" + category_idx + ", work_title=" + work_title
				+ ", work_start=" + work_start + ", work_end=" + work_end + ", work_complete=" + work_complete
				+ ", work_confirm=" + work_confirm + ", work_state=" + work_state + ", project_name=" + project_name
				+ ", category_name=" + category_name + ", checklist_dtos=" + checklist_dtos + ", workmember_dtos="
				+ workmember_dtos + ", workmember_wdto=" + workmember_wdto + "]";
	}
	
	
	
}
