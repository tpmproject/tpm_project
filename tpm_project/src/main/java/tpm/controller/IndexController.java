package tpm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {

	@RequestMapping("/index.do")
	public ModelAndView indexForm(){
		ModelAndView mav = new ModelAndView();
		System.out.println("1");
		mav.setViewName("index");
		return mav;
	}
}
	