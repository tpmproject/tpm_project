package tpm.category.model;

import java.util.ArrayList;

public class CategoryDTO {
	 
	private int category_idx;
	private int project_idx;
	private String category_name;
	
	private ArrayList<CategoryDTO> category_dtos;

	public CategoryDTO() {
		super();
	}

	public CategoryDTO(int category_idx, int project_idx, String category_name, ArrayList<CategoryDTO> category_dtos) {
		super();
		this.category_idx = category_idx;
		this.project_idx = project_idx;
		this.category_name = category_name;
		this.category_dtos = category_dtos;
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

	public ArrayList<CategoryDTO> getCategory_dtos() {
		return category_dtos;
	}

	public void setCategory_dtos(ArrayList<CategoryDTO> category_dtos) {
		this.category_dtos = category_dtos;
	}
	
}
