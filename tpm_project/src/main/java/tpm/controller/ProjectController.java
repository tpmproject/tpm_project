package tpm.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired	;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import tpm.project.model.ProjectDAO;
import tpm.project.model.ProjectDTO;
import tpm.work.model.WorkDTO;
import tpm.category.model.CategoryDTO;
import tpm.checklist.model.ChecklistDTO;
import tpm.member.model.*;

@Controller
public class ProjectController {

	
	@Autowired
	private ProjectDAO projectDAO;
	
	@Autowired
	private MemberDAO memberDAO;
	//// 프로젝트 ////
	
	// 프로젝트
	/** 프로젝트 - 프로젝트 리스트 페이지 이동 */
	@RequestMapping(value="projectList.do",  method=RequestMethod.GET)
	public ModelAndView projectListForm(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("project/projectListForm");
		return mav;
	}
	
	/** 프로젝트 - 해당 프로젝트 내용 페이지 이동 ( 업무들이 보여지는 페이지 ) */
	@RequestMapping(value="projectContent.do",  method=RequestMethod.GET)
	public ModelAndView projectContentForm(ProjectDTO dto){
		
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	
	/** 프로젝트 - 프로젝트 생성 (권한 부여 포함) */
	@RequestMapping(value="projectAdd.do", method=RequestMethod.GET)
	public ModelAndView projectAdd(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("project/projectAdd");
		return mav;
	}
	/** 프로젝트-프로젝트생성 데이터*/
	@RequestMapping(value="projectAdd.do", method=RequestMethod.POST)
	public ModelAndView projectInsert(ProjectDTO dto){
		System.out.println(dto.getProject_name());
		System.out.println(dto.getProject_content());
		int result= projectDAO.projectInsert(dto);
		
		System.out.println(result);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("project/projectListForm");
		return mav;
	}
	
	/**프로젝트-프로젝트 생성-멤버추가*/
	@RequestMapping(value="projectMemberAdd.do", method=RequestMethod.POST)
	public ModelAndView projectMemberAdd(MemberDTO dto){
		
		ArrayList<MemberDTO> arr=memberDAO.getMemberIdAndNameSearch(dto);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("arr", arr);
		mav.setViewName("project/projectMemberAdd_d");
		return mav;
	}
	/** 프로젝트 - 프로젝트 수정 */
	@RequestMapping(value="projectUpdate.do",  method=RequestMethod.POST)
	public ModelAndView projectUpdate(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("project/projectListForm");
		return mav;
	}
	
	/** 프로젝트 - 프로젝트 삭제 */
	@RequestMapping(value="projectDel.do",  method=RequestMethod.GET)
	public ModelAndView projectDel(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("project/projectListForm");
		return mav;
	}
	
	/** 프로젝트 - 프로젝트 평가 페이지 이동 */
	@RequestMapping(value="projectEvaluation.do",  method=RequestMethod.GET)
	public ModelAndView projectEvaluationForm(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("project/projectEvaluationForm");
		return mav;
	}
	
	// 멤버
	/** 멤버 -  프로젝트 멤버 리스트 데이터 반환 */
	@RequestMapping(value="projectMemberList.do",  method=RequestMethod.GET)
	public ModelAndView projectMemberList(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("project/projectMemberList_d");
		return mav;
	}
	
}
