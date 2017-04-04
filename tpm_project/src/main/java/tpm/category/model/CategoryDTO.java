package tpm.category.model;

import java.util.ArrayList;

import tpm.work.model.WorkDTO;

public class CategoryDTO {
	 
	private int category_idx;
	private int project_idx;
	private String category_name;
	
	private ArrayList<WorkDTO> work_dtos;

	public CategoryDTO() {
		super();
	}

	public CategoryDTO(int category_idx, int project_idx, String category_name, ArrayList<WorkDTO> work_dtos) {
		super();
		this.category_idx = category_idx;
		this.project_idx = project_idx;
		this.category_name = category_name;
		this.work_dtos = work_dtos;
	}

	public int getCategory_idx() {
		return category_idx;
	}

	public void setCategory_idx(int category_idx) {
		this.category_idx = category_idx;
	}

	public int getProject_idx() {
		return project_idx;
	}

	public void setProject_idx(int project_idx) {
		this.project_idx = project_idx;
	}

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}

	public ArrayList<WorkDTO> getWork_dtos() {
		return work_dtos;
	}

	public void setWork_dtos(ArrayList<WorkDTO> work_dtos) {
		this.work_dtos = work_dtos;
	}
	
}
