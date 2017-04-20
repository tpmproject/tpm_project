package tpm.study.controller;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.groupdocs.ui.Utils;
import com.groupdocs.viewer.config.ViewerConfig;

import tpm.project.model.ProjectDAO;
import tpm.study.model.DateTest3DTO;
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
	
	//// DTO 관련 ////
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
	////////////////
	
	//// Date 타입 관련 (날짜와 시간 가져오기) ////
	/** DTO(java.sql.Date 타입) - DB TABLE (DATE 타입) : 일반적인 경우 */
	@RequestMapping(value="dateStudy1.do", method=RequestMethod.GET)
	public ModelAndView dateStudy1(ModelAndView mav){
		
		List<Object> arry_dto = studyDAO.dateStudy1Select();
		for (Object object : arry_dto) {
			System.out.println(object.toString());
		}
		mav.setViewName("study/studyListForm");
		return mav;
	}
	
	/** DTO(java.util.Date 타입) - DB TABLE (DATE 타입) */
	@RequestMapping(value="dateStudy2.do", method=RequestMethod.GET)
	public ModelAndView dateStudy2(ModelAndView mav){
		
		List<Object> arry_dto = studyDAO.dateStudy2Select();
		for (Object object : arry_dto) {
			System.out.println(object.toString());
		}
		mav.setViewName("study/studyListForm");
		return mav;
	}
	
	/** DTO(java.sql.Timestamp 타입) - DB TABLE (DATE 타입) */
	@RequestMapping(value="dateStudy3.do", method=RequestMethod.GET)
	public ModelAndView dateStudy3(ModelAndView mav){
		
		List<Object> arry_dto = studyDAO.dateStudy3Select();
		for (Object object : arry_dto) {
			System.out.println(object.toString());
			/*Timestamp timestamp = ((DateTest3DTO) object).getT_date();
			Date dat = new Date(timestamp.getTime());
			System.out.println("dat : " + dat);*/
		}
		mav.setViewName("study/studyListForm");
		return mav;
	}
	///////////////////////
	
	//// datePicker 관련 ////
	/** Date range Picker */
	@RequestMapping(value="dateStudy4.do", method=RequestMethod.GET)
	public ModelAndView dateStudy4(ModelAndView mav){
		
		mav.setViewName("study/date/datePicker");
		return mav;
	}
	/** Date and time range Picker */
	@RequestMapping(value="dateStudy5.do", method=RequestMethod.GET)
	public ModelAndView dateStudy5(ModelAndView mav){
		
		mav.setViewName("study/date/datePicker2");
		return mav;
	}
	@RequestMapping(value="dateStudy5.do", method=RequestMethod.POST)
	public ModelAndView dateStudy5_datePicker2(ModelAndView mav, @RequestParam(value="t_date") String t_date) throws ParseException{
		
		System.out.println(t_date);
		String temp[] = t_date.split("-");
		for (String s : temp) {
			System.out.println(s.trim());
		}
		
		String str= temp[0].trim(); 
		
		/*String str= "04/13/2017 9:00 AM"; */
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("MM/dd/yyyy hh:mm aa", Locale.US); 
		java.util.Date t = sdf.parse(str); 
		System.out.println("t :" + t);
		java.sql.Date st = new java.sql.Date(t.getTime());
		java.sql.Timestamp sts = new java.sql.Timestamp(t.getTime());
		
		System.out.println(sts.toString());
		int result = studyDAO.dateStudy4Insert(new DateTest3DTO(sts));
		System.out.println(result);
		
		mav.setViewName("study/date/datePicker2");
		return mav;
	}
	///////////////////////
	
	//// 디자인 관련 ////
	/** Slimscroll */
	@RequestMapping(value="designStudy1.do", method=RequestMethod.GET)
	public ModelAndView designStudy1(ModelAndView mav){
		
		mav.setViewName("study/scroll/slimscroll");
		return mav;
	}
	
		
	@RequestMapping(value="pathStudy.do", method=RequestMethod.GET)
	public ModelAndView pathStudy(ModelAndView mav){
		
		   ViewerConfig config = new ViewerConfig();
	        config.setStoragePath(Utils.getProjectProperty("storage.path"));
		System.out.println(config.getStoragePath());  //project.properties에서 설정한 경로를 불러온다.
		
		 /*src/main/resources/project.properties 파일에서 경로 설정을 한다 
		project.properties 파일에서 설정한 경로-> storage.path=$(basedir)/src/main/webapp/WEB-INF/view/file/upload 
		불러와야 하는 경로 -> C:\Users\ user1\git\tpm_project\tpm_project/src/main/webapp/WEB-INF/view/file/upload
		project.propertes파일에서 ${basedir}가   C:\Users\ user1\git\tpm_project\tpm_project/ 까지의 경로를 자동으로 잡아준다.
		 */
		
		mav.setViewName("study/path");
		return mav;
	}
	
}
