package tpm.calendar.model;

public class CalendarCheckListDTO {
	private int checklist_idx;
	private int work_idx;
	private String checklist_content;
	private int checklist_state;

	public CalendarCheckListDTO() {
		super();
	}

	public CalendarCheckListDTO(int checklist_idx, int work_idx, String checklist_content, int checklist_state) {
		super();
		this.checklist_idx = checklist_idx;
		this.work_idx = work_idx;
		this.checklist_content = checklist_content;
		this.checklist_state = checklist_state;
	}

	public int getChecklist_idx() {
		return checklist_idx;
	}

	public void setChecklist_idx(int checklist_idx) {
		this.checklist_idx = checklist_idx;
	}

	public int getWork_idx() {
		return work_idx;
	}

	public void setWork_idx(int work_idx) {
		this.work_idx = work_idx;
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

	@Override
	public String toString() {
		return "CalendarCheckListDTO [checklist_idx=" + checklist_idx + ", work_idx=" + work_idx
				+ ", checklist_content=" + checklist_content + ", checklist_state=" + checklist_state + "]";
	}

}
