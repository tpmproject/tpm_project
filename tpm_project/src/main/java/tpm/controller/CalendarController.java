package tpm.controller;

import java.sql.Timestamp;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tpm.calendar.model.CalendarDAO;
import tpm.calendar.model.CalendarDTO;
import tpm.calendar.model.CalendarWorkDTO;
import tpm.checklist.model.ChecklistDTO;
import tpm.member.model.MemberDTO;
import tpm.project.model.ProjectDTO;
import tpm.work.model.MyWorkDTO;
import tpm.work.model.WorkDTO;

@Controller
public class CalendarController {

	@Autowired
	private CalendarDAO calendarDAO;
	
	/** 켈린더 - 켈린더 정보 반환 (프로젝트 - 카테고리 - 업무 - 체크리스트)*/
	@RequestMapping(value="calendarJsonList.do",  method=RequestMethod.POST)
	public @ResponseBody List<Object> calendarListForm_ajax_json(MemberDTO mdto, HttpSession session){
		mdto.setMember_idx((Integer) session.getAttribute("s_member_idx"));
		List<Object> arry_obj = calendarDAO.getCalendarList(mdto);
		for (Object object : arry_obj) {
			System.out.println(object);
		}
		return arry_obj;
	}
	
	/** 켈린더 - 프로젝트 리스트 반환 ( 자신이 해당된 프로젝트 정보 ) */
	@RequestMapping(value="calendarMyProjectList.do",  method=RequestMethod.POST)
	public @ResponseBody List<Object> calendarMyProjectList(MemberDTO mdto, HttpSession session){
		mdto.setMember_idx((Integer) session.getAttribute("s_member_idx"));
		List<Object> arry_obj = calendarDAO.getCalendarMyProjectList(mdto);
		return arry_obj;
	}
	
	/** 켈린더 - 체크리스트 수정 */
	@RequestMapping(value="calendarUpdateCheckList.do",  method=RequestMethod.POST)
	public @ResponseBody Object calendarUpdateCheckList(ChecklistDTO ckdto){
		return calendarDAO.updateCalendarCheckList(ckdto) > 0 ? "true" : "false";
	}

	/** 켈린더 - 업무 수정 
	 * @throws ParseException */
	@RequestMapping(value="calendarWorkUpdate.do",  method=RequestMethod.POST)
	public @ResponseBody Object calendarWorkUpdate(@RequestParam(value="work_idx") String work_idx,
			@RequestParam(value="work_start") String work_start_str) throws ParseException{
	
		CalendarWorkDTO cwdto = new CalendarWorkDTO();
		
		//java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("MM dd YYYY HH:mm:ss", Locale.US); 
		System.out.println(work_start_str);
		work_start_str = work_start_str.substring(4, work_start_str.length()-9);
		System.out.println(work_start_str);
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("MMM dd yyyy HH:mm:ss", Locale.US); 
		 
		
		Date ts = sdf.parse(work_start_str);
		
		Timestamp work_start = new Timestamp(ts.getTime());
		
		cwdto.setWork_idx(Integer.parseInt(work_idx));
		cwdto.setWork_start(work_start);

		return calendarDAO.updateCalendarWorkTime(cwdto) > 0 ? "true" : "false";
	}
	
	
	
}
