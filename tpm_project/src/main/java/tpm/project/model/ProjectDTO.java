package tpm.project.model;

import java.util.ArrayList;

import tpm.category.model.CategoryDTO;

public class ProjectDTO {
	
	private int project_idx;
	private String project_name;
	private int project_state;
	private String project_content;
	
	private int project_level;
	
	private ArrayList<CategoryDTO> category_dtos;
	
	private int category_num;
	private int work_num;
	private int checklist_num;
	
	//project_state에 들어갈 상수
	final public static int PROJECT_ING=1; //진행중
	final public static int PROJECT_TENDENCY_WAIT=2; //평가 대기
	final public static int PROJECT_FIN=3; //완료
	
	public ProjectDTO() {
		super();
	}

	public ProjectDTO(int project_idx, String project_name, int project_state, String project_content) {
		super();
		this.project_idx = project_idx;
		this.project_name = project_name;
		this.project_state = project_state;
		this.project_content = project_content;
	}

	public ProjectDTO(int project_idx, String project_name, int project_state, String project_content,
			ArrayList<CategoryDTO> category_dtos, int category_num, int work_num, int checklist_num) {
		super();
		this.project_idx = project_idx;
		this.project_name = project_name;
		this.project_state = project_state;
		this.project_content = project_content;
		this.category_dtos = category_dtos;
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
	
	public String getProject_content() {
		return project_content;
	}

	public void setProject_content(String project_content) {
		this.project_content = project_content;
	}

	public int getProject_state() {
		return project_state;
	}

	public void setProject_state(int project_state) {
		this.project_state = project_state;
	}

	public ArrayList<CategoryDTO> getCategory_dtos() {
		return category_dtos;
	}

	public void setCategory_dtos(ArrayList<CategoryDTO> category_dtos) {
		this.category_dtos = category_dtos;
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

	public int getProject_level() {
		return project_level;
	}

	public void setProject_level(int project_level) {
		this.project_level = project_level;
	}
	
}
