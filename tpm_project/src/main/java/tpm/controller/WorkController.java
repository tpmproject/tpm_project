package tpm.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import tpm.category.model.CategoryDTO;
import tpm.project.model.ProjectMemberDTO;
import tpm.work.model.WorkDAO;
import tpm.work.model.WorkDTO;

@Controller
public class WorkController {
	
	@Autowired
	WorkDAO workDAO;

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
	
	@RequestMapping(value="workAdd.do", method=RequestMethod.GET)
	public ModelAndView workAddForm(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("work/workResult_form");
		return mav;
	}
	
	/** 업무 - 업무 추가 */
	@RequestMapping(value="workAdd.do",  method=RequestMethod.POST)
	public ModelAndView workAdd(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("work/workResult_d");
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
	@RequestMapping(value="workDel.do",  method=RequestMethod.POST)
	public ModelAndView workDel(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("work/workResult_d");
		return mav;
	}
	
	//// 스케쥴러 ////
	
	// 캘린더
	/** 캘린더 - 캘린더 페이지로 이동 */
	@RequestMapping(value="calendarList.do",  method=RequestMethod.GET)
	public ModelAndView calendarListForm(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("calendar/calendarListForm");
		return mav;
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
