package tpm.study.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import tpm.project.model.ProjectDAO;
import tpm.study.model.StudyDAOImple;

@Controller
public class StudyController {

	@Autowired
	private StudyDAOImple studyDAO;
	
	/** 스터디 리스트 페이지 이동 */
	@RequestMapping(value="studyList.do", method=RequestMethod.GET)
	public String studyListForm(){
		return "study/studyListForm";
	}
	
	/** Mybatis DTO 안 DTO 1:1 Select 하기 */
	@RequestMapping(value="dtoStudy1.do", method=RequestMethod.GET)
	public ModelAndView dtoStudy1(ModelAndView mav){
		
		List<Object> arry_dto = studyDAO.dtoStudy1Select();
		for (Object object : arry_dto) {
			System.out.println(object.toString());
		}
		
		mav.setViewName("study/studyListForm");
		return mav;
	}
	
	/** Mybatis DTO 안 DTO 1:N Select 하기 */
	@RequestMapping(value="dtoStudy2.do", method=RequestMethod.GET)
	public ModelAndView dtoStudy2(ModelAndView mav){
		
		List<Object> arry_dto = studyDAO.dtoStudy2Select();
		for (Object object : arry_dto) {
			System.out.println(object.toString());
		}
		
		mav.setViewName("study/studyListForm");
		return mav;
	}
	
}
