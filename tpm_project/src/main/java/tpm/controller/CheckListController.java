package tpm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import tpm.checklist.model.ChecklistDAO;

@Controller
public class CheckListController {
	
	@Autowired
	ChecklistDAO checklistDAO;
	
	//// 체크리스트 ////
	
	/** 체크리스트 - 체크리스트 추가 */
	@RequestMapping(value="checkAdd.do",  method=RequestMethod.POST)
	public ModelAndView checkAdd(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("checklist/checkAdd_d");
		return mav;
	}
	
	/** 체크리스트 - 체크리스트 수정 ( 완료 포함 ) */
	@RequestMapping(value="checkUpdate.do",  method=RequestMethod.POST)
	public ModelAndView checkUpdate(int checklist_idx){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("checklist/checkUpdate_d");
		
		
		int result=checklistDAO.updateChecklist(checklist_idx);
		if(result>0){
			mav.addObject("checklist_idx", checklist_idx);
		}
		return mav;
	}
	
	/** 체크리스트 - 체크리스트 삭제 */
	@RequestMapping(value="checkDelete.do",  method=RequestMethod.POST)
	public ModelAndView checkDelete(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("checklist/checkDelete_d");
		return mav;
	}
}
