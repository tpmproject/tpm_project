package tpm.calendar.model;

public class CalendarDTO {
	private String id;
	private String title;
	private String allDay;
	private String start;
	private String end;
	private String url;
	private String className;
	private String editable;
	private String color;
	private String backgroundColor;
	private String borderColor;
	private String textColor;

	public CalendarDTO() {
		super();
	}

	public CalendarDTO(String id, String title, String allDay, String start, String end, String url, String className,
			String editable, String color, String backgroundColor, String borderColor, String textColor) {
		super();
		this.id = id;
		this.title = title;
		this.allDay = allDay;
		this.start = start;
		this.end = end;
		this.url = url;
		this.className = className;
		this.editable = editable;
		this.color = color;
		this.backgroundColor = backgroundColor;
		this.borderColor = borderColor;
		this.textColor = textColor;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAllDay() {
		return allDay;
	}

	public void setAllDay(String allDay) {
		this.allDay = allDay;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getEditable() {
		return editable;
	}

	public void setEditable(String editable) {
		this.editable = editable;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getBackgroundColor() {
		return backgroundColor;
	}

	public void setBackgroundColor(String backgroundColor) {
		this.backgroundColor = backgroundColor;
	}

	public String getBorderColor() {
		return borderColor;
	}

	public void setBorderColor(String borderColor) {
		this.borderColor = borderColor;
	}

	public String getTextColor() {
		return textColor;
	}

	public void setTextColor(String textColor) {
		this.textColor = textColor;
	}

	@Override
	public String toString() {
		return "CalendarDTO [id=" + id + ", title=" + title + ", allDay=" + allDay + ", start=" + start + ", end=" + end
				+ ", url=" + url + ", className=" + className + ", editable=" + editable + ", color=" + color
				+ ", backgroundColor=" + backgroundColor + ", borderColor=" + borderColor + ", textColor=" + textColor
				+ "]";
	}

}
