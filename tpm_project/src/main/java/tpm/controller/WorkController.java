package tpm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WorkController {

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
	@RequestMapping(value="workList.do",  method=RequestMethod.POST)
	public ModelAndView workList(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("work/workList_d");
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
	/** 캘린더 - 캘린더 페이지로 이동 업무 데이터 반환 */
	/** 캘린더 - 캘린더 페이지로 이동 업무 데이터 반환 */
	/** 캘린더 - 캘린더 페이지로 이동 업무 데이터 반환 */
	// 타임라인
}
