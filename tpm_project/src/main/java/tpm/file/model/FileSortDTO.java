package tpm.file.model;

public class FileSortDTO {
	private int project_idx;
	private String line_name;
	private String sort;
	public FileSortDTO() {
		super();
	}
	public FileSortDTO(int project_idx, String line_name, String sort) {
		super();
		this.project_idx = project_idx;
		this.line_name = line_name;
		this.sort = sort;
	}
	public int getProject_idx() {
		return project_idx;
	}
	public void setProject_idx(int project_idx) {
		this.project_idx = project_idx;
	}
	public String getLine_name() {
		return line_name;
	}
	public void setLine_name(String line_name) {
		this.line_name = line_name;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}

	
}
