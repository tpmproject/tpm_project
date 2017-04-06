package tpm.sample.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import tpm.sample.model.SampleWorkDAO;

@Controller
public class SampleController {

	@Autowired
	SampleWorkDAO sampleWorkDAO;
	
	/** 팝오버테스트 이동 */
	@RequestMapping(value="popover.do", method=RequestMethod.GET)
	public String popover(){
		return "popover";
	}
	
	/** DTO 안 DTO 테스트 */
	@RequestMapping(value="dtotest.do", method=RequestMethod.GET)
	public ModelAndView dtoTest(){
		
		List<Object> arry_dto = sampleWorkDAO.getSampleWorkList();
		System.out.println(arry_dto);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("dto");
		
		return mav;
	}
}
