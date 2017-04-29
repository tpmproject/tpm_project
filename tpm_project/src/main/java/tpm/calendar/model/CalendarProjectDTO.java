package tpm.calendar.model;

import java.util.List;

public class CalendarProjectDTO {
	private int project_idx;
	private String project_name;
	private String project_content;
	private int project_state;

	private List<CalendarCategoryDTO> arry_cdto;

	public CalendarProjectDTO() {
		super();
	}

	public CalendarProjectDTO(int project_idx, String project_name, String project_content, int project_state,
			List<CalendarCategoryDTO> arry_cdto) {
		super();
		this.project_idx = project_idx;
		this.project_name = project_name;
		this.project_content = project_content;
		this.project_state = project_state;
		this.arry_cdto = arry_cdto;
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

	public List<CalendarCategoryDTO> getArry_cdto() {
		return arry_cdto;
	}

	public void setArry_cdto(List<CalendarCategoryDTO> arry_cdto) {
		this.arry_cdto = arry_cdto;
	}

	@Override
	public String toString() {
		return "CalendarProjectDTO [project_idx=" + project_idx + ", project_name=" + project_name
				+ ", project_content=" + project_content + ", project_state=" + project_state + ", arry_cdto="
				+ arry_cdto + "]";
	}

}
