package tpm.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import tpm.calendar.model.CalendarDAO;
import tpm.calendar.model.CalendarDTO;
import tpm.calendar.model.CalendarWorkDTO;
import tpm.checklist.model.ChecklistDTO;
import tpm.member.model.MemberDTO;
import tpm.work.model.MyWorkDTO;

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

	
}
