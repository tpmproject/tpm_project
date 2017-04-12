package tpm.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize.Inclusion;

import tpm.calendar.model.CalendarDTO;
import tpm.category.model.CategoryDTO;
import tpm.member.model.MemberDTO;
import tpm.project.model.ProjectMemberDTO;
import tpm.work.model.MyWorkDTO;
import tpm.work.model.WorkDAO;
import tpm.work.model.WorkDTO;

@Controller
public class WorkController {
	
	@Autowired
	private WorkDAO workDAO;

	//// 업무 ////

	// 나의 업무
	/** 나의 업무 - 나의 업무 페이지 이동 */
	@RequestMapping(value="myWorkList.do",  method=RequestMethod.GET)
	public ModelAndView myWorkListForm(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mywork/myWorkListForm");
		return mav;
	}
	
	// 업무
	/** 업무 - 업무 프로젝트 별 전체 조회 */
	@RequestMapping(value="workReload.do",  method=RequestMethod.POST)
	public ModelAndView workReload(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("work/workList_d");
		return mav;
	}
	
	/** 업무 - 업무 조회 */
	@RequestMapping(value="workList.do",  method=RequestMethod.GET)
	public ModelAndView workList(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("work/workList_d");
		return mav;
	}
	
	/** 업무 - 업무 추가 폼*/
	@RequestMapping(value="workAdd.do", method=RequestMethod.GET)
	public ModelAndView workAddForm(int project_idx) {
		
		ArrayList<MemberDTO> arr=workDAO.projectMember(project_idx);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("work/workResult_d");
		mav.addObject("arr",arr);
		return mav;
	}
	
	/** 업무 - 업무 추가 */
	@RequestMapping(value="workAdd.do",  method=RequestMethod.POST)
	public ModelAndView workAdd(WorkDTO dto){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("work/workAdd_d");
		
		mav.addObject("workDTO",dto);
		int result=workDAO.addWork(dto);
		
		String msg=dto.getWork_title();
		if(result<=0){
			msg="error";
		}
		mav.addObject("msg",msg);
		return mav;
	}
	
	/** 업무 - 업무 수정 폼*/
	@RequestMapping(value="workUpdate.do", method=RequestMethod.GET)
	public ModelAndView workUpdateForm(int work_idx) {
		
		ArrayList<WorkDTO> arr_w=workDAO.workList(work_idx);
		ArrayList<MemberDTO> arr_m=workDAO.workMember(work_idx);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("work/workResult_d");
		mav.addObject("arr_w",arr_w);
		mav.addObject("arr_m",arr_m);
		return mav;
	}
	
	/** 업무 - 업무 수정 */
	@RequestMapping(value="workUpdate.do",  method=RequestMethod.POST)
	public ModelAndView workUpdate(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("work/workResult_d");
		return mav;
	}
	
	/** 업무 - 업무 삭제 */
	@RequestMapping(value="workDelete.do",  method=RequestMethod.POST)
	public ModelAndView workDel(int work_idx){
		
		int result=workDAO.workDelete(work_idx);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("work/workResult_d");
		
		if(result>0){
			mav.addObject("widx",result);
		}
		return mav;
	}
	
	//// 스케쥴러 ////
	
	// 캘린더
	/** 캘린더 - 캘린더 페이지로 이동 */
	
	@RequestMapping(value="calendarList.do",  method=RequestMethod.GET)
	public ModelAndView calendarListForm(HttpServletRequest req){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("calendar/calendarListForm");
		return mav;
	}
	
	/** 캘린더 - 캘린더 데이터 반환 */
	@RequestMapping(value="calendarList.do",  method=RequestMethod.POST)
	public @ResponseBody ArrayList<CalendarDTO> calendarListForm_ajax(HttpServletRequest req){
		
		MemberDTO mdto = new MemberDTO();
		HttpSession session = req.getSession();
		mdto.setMember_idx((Integer) session.getAttribute("s_member_idx"));
		ArrayList<MyWorkDTO> arry_mwdto = workDAO.myWorkAllList(mdto);

		ArrayList<CalendarDTO> arry_cldto = new ArrayList<CalendarDTO>();
		for (MyWorkDTO myWorkDTO : arry_mwdto) {
			CalendarDTO temp_cldto = new CalendarDTO();
			temp_cldto.setId("work_" + myWorkDTO.getWork_idx());
			temp_cldto.setTitle(myWorkDTO.getWork_title());
			temp_cldto.setAllDay("false");
			temp_cldto.setStart(myWorkDTO.getWork_start().toString());
			temp_cldto.setEnd(myWorkDTO.getWork_end().toString());
			temp_cldto.setUrl("index.do");
			temp_cldto.setClassName("calendar_work_content");
			temp_cldto.setEditable("true");
			temp_cldto.setBackgroundColor("#f56954");
			temp_cldto.setBorderColor("#f56954");

			arry_cldto.add(temp_cldto);
		}
		
		return arry_cldto;
	}
	
	/** 캘린더 - 필터  업무 데이터 */
	@RequestMapping(value="calendarFilterList.do",  method=RequestMethod.POST)
	public ModelAndView calendarFilterList(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("calendar/calendarFilterList_d");
		return mav;
	}
	
	/** 캘린더 - 업무 상세보기 이동 (나의 업무 페이지로) */
	@RequestMapping(value="calendarMyWork.do",  method=RequestMethod.POST)
	public ModelAndView calendarMyWork(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("work/myWork");
		return mav;
	}
	
	// 타임라인
	/** 타임라인 - 타임라인 페이지로 이동 */
	@RequestMapping(value="timeLineList.do",  method=RequestMethod.GET)
	public ModelAndView timeLineListForm(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("timeLine/timeLineForm");
		return mav;
	}
	
	/** 타임라인 - 타임라인 프로젝트별 필터 체크 시 표시할 업무 목록들 */
	@RequestMapping(value="timeLineFilterList.do",  method=RequestMethod.POST)
	public ModelAndView timeLineFilterList(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("timeLine/timeLineFilterList_d");
		return mav;
	}
	
	/** 타임라인 - 타임라인 페이지로 이동 */
	@RequestMapping(value="timeLineMyWork.do",  method=RequestMethod.POST)
	public ModelAndView timeLineMyWork(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("work/myWork");
		return mav;
	}
}
