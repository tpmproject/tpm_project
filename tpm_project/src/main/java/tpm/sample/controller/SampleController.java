package tpm.sample.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SampleController {

	/** 팝오버테스트 이동 */
	@RequestMapping(value="popover.do", method=RequestMethod.GET)
	public String popover(){
		return "popover";
	}
}
