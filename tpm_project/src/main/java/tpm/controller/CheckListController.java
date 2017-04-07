package tpm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import tpm.checklist.model.ChecklistDAO;
import tpm.checklist.model.ChecklistDTO;

@Controller
public class CheckListController {
	
	@Autowired
	ChecklistDAO checklistDAO;
	
	//// 체크리스트 ////
	
	/** 체크리스트 - 체크리스트 추가 */
	@RequestMapping(value="checkAdd.do",  method=RequestMethod.POST)
	public ModelAndView checkAdd(ChecklistDTO dto){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("checklist/checkAdd_d");
		dto=checklistDAO.addChecklist(dto);
		if(dto!=null){
			mav.addObject("checklist", dto);
		}
		
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
	public ModelAndView checkDelete(int checklist_idx){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("checklist/checkUpdate_d");
		
		int result=checklistDAO.delChecklist(checklist_idx);
		if(result>0){
			mav.addObject("checklist_idx", checklist_idx);
		}
		return mav;
	}
}
