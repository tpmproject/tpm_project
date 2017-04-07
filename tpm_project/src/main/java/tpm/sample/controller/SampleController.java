package tpm.sample.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import tpm.member.model.MemberDAO;
import tpm.sample.model.SampleWorkDAO;

@Controller
public class SampleController {

	@Autowired
	SampleWorkDAO sampleWorkDAO;
	
	@Autowired 
	private MemberDAO mdao;
	
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
		System.out.println("11");
		for (Object object : arry_dto) {
			System.out.println(object.toString());
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("dto");
		
		return mav;
	}
	
	//// 제이슨 ////
	/** 결과 페이지에서 수작업을 통하여 JSON 형식의 데이터를 구축하기 */
	@RequestMapping(value="jsontest1.do", method=RequestMethod.GET)
	public ModelAndView jsonTest1(){
		mdao.
	}
	
}
