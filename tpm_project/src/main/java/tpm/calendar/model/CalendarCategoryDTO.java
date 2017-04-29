package tpm.calendar.model;

import java.util.List;

public class CalendarCategoryDTO {
	private int category_idx;
	private int project_idx;
	private String category_name;

	private List<CalendarWorkDTO> arry_wdto;

	public CalendarCategoryDTO() {
		super();
	}

	public CalendarCategoryDTO(int category_idx, int project_idx, String category_name,
			List<CalendarWorkDTO> arry_wdto) {
		super();
		this.category_idx = category_idx;
		this.project_idx = project_idx;
		this.category_name = category_name;
		this.arry_wdto = arry_wdto;
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

	public List<CalendarWorkDTO> getArry_wdto() {
		return arry_wdto;
	}

	public void setArry_wdto(List<CalendarWorkDTO> arry_wdto) {
		this.arry_wdto = arry_wdto;
	}

	@Override
	public String toString() {
		return "CalendarCategoryDTO [category_idx=" + category_idx + ", project_idx=" + project_idx + ", category_name="
				+ category_name + ", arry_wdto=" + arry_wdto + "]";
	}

}
