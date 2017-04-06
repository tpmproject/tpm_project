package tpm.sample.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SampleController {

	/** 팝오버테스트 이동 */
	@RequestMapping(value="popover.do", method=RequestMethod.GET)
	public String popover(){
		return "popover";
	}
	
	/** DTO 안 DTO 테스트 */
	@RequestMapping(value="dtotest.do", method=RequestMethod.GET)
	public ModelAndView dtoTest(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("dto");
		
		return mav;
	}
}
