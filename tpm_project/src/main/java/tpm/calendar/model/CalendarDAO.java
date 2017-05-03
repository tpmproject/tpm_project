package tpm.calendar.model;

import java.util.List;

public interface CalendarDAO {
	public List<Object> getCalendarList(Object obj);
	public List<Object> getCalendarMyProjectList(Object obj);
	public int updateCalendarCheckList(Object obj);
}
