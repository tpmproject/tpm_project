package tpm.calendar.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class CalendarDAOImple implements CalendarDAO {

	private SqlSessionTemplate sqlMap;
	
	public CalendarDAOImple(SqlSessionTemplate sqlMap){
		super();
		this.sqlMap=sqlMap;
	}

	@Override
	public List<Object> getCalendarList(Object obj) {
		return sqlMap.selectList("calendarContentList", obj);
	}

	@Override
	public List<Object> getCalendarMyProjectList(Object obj) {
		return sqlMap.selectList("calendarMyProjectList", obj);
	}
}
