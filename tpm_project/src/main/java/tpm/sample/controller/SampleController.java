package tpm.sample.controller;



import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import tpm.member.model.MemberDAO;
import tpm.member.model.MemberDTO;
import tpm.sample.model.SampleWorkDAO;

@Controller
public class SampleController {

	@Autowired
	SampleWorkDAO sampleWorkDAO;
	
	@Autowired 
	private MemberDAO mdao;
	
	@RequestMapping(value="mappingtest.c", method=RequestMethod.GET)
	public String mappingTest(){
		System.out.println("성공");
		return "index";
	}
	
	
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
	/** 제이슨 테스트 페이지 이동 */
	@RequestMapping(value="jsontest.do", method=RequestMethod.GET)
	public String jsonTest(){
		return "sample/json/jsonTest";
	}
	
	/** 결과 페이지에서 수작업을 통하여 JSON 형식의 데이터를 구축하기 */
	@RequestMapping(value="jsontest1.do", method=RequestMethod.GET)
	public ModelAndView jsonTest1(){
		ModelAndView mav = new ModelAndView();
		
		ArrayList<MemberDTO> arry_mdto = mdao.getMemberAllList();
		mav.addObject("arry_mdto", arry_mdto);
		
		mav.setViewName("sample/json/jsonResult1");
		return mav;
	}
	
	/** JSON-SIMPLE 사용하여 결과 페이지에서 JSON 데이터를 만들기 */
	@RequestMapping(value="jsontest2.do", method=RequestMethod.GET)
	public ModelAndView jsonTest2(){
		ModelAndView mav = new ModelAndView();
		
		ArrayList<MemberDTO> arry_mdto = mdao.getMemberAllList();
		mav.addObject("arry_mdto", arry_mdto);
		
		mav.setViewName("sample/json/jsonResult2");
		return mav;
	}
	
	/** net.sf.json-lib 의 JSONArray, JSONObject의 fromObject 를 이용하여 리스트를 JSON 데이터로 변환후 결과 페이지로 보내기 */
	@RequestMapping(value="jsontest3.do", method=RequestMethod.GET)
	public ModelAndView jsonTest3(){
		ModelAndView mav = new ModelAndView();
		
		ArrayList<MemberDTO> arry_mdto = mdao.getMemberAllList();

		JSONArray jsonArray = new JSONArray();
		JSONObject json = new JSONObject();

		json.put("members", jsonArray.fromObject(arry_mdto));
		
		mav.setViewName("sample/json/jsonResult3");
		mav.addObject("json", json);
		return mav;
	}
	
	
	/** SPRING 어노테이션을 이용하여 컨트롤러에서 LIST를 자동으로 JSON으로 변환하여 결과 페이지로 보내기 */
	@RequestMapping(value="jsontest4.do", method=RequestMethod.GET)
	public @ResponseBody ArrayList<MemberDTO> jsonTest4(){
		return mdao.getMemberAllList();
	}
	
	
	/** jsonView를 이용하여 자동으로 임의의 결과 페이지로 List를 json 데이터 변환하여 보내기 */
	@RequestMapping(value="jsontest5.do", method=RequestMethod.GET)
	public ModelAndView jsonTest5(){

		ArrayList<MemberDTO> arry_mdto = mdao.getMemberAllList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("members_test", arry_mdto);
		mav.addObject("members_test2", arry_mdto);
		mav.setViewName("jsonView");
		return mav;
	}
	
	//// ajax ////
	/** ajaxTestList 페이지 이동 */
	@RequestMapping(value="ajaxtest.do", method=RequestMethod.GET)
	public String ajaxtest(){
		return "sample/ajax/ajaxTestList";
	}
	
	/** Javascript Ajax 페이지 이동 */
	@RequestMapping(value="ajaxtest1.do", method=RequestMethod.GET)
	public String ajaxtest1Form(){
		return "sample/ajax/ajaxTest1";
	}
	/** Javascript Ajax 처리 */
	@RequestMapping(value="ajaxtest1.do", method=RequestMethod.POST)
	public @ResponseBody ArrayList<MemberDTO> ajaxtest1(MemberDTO mdto){
		return mdao.getMemberIdAndNameSearch(mdto);
	}
	/** Jquery Ajax 페이지 이동 */
	@RequestMapping(value="ajaxtest2.do", method=RequestMethod.GET)
	public String ajaxtest2Form(){
		return "sample/ajax/ajaxTest2";
	}
	/** Jquery Ajax 처리 */
	@RequestMapping(value="ajaxtest2.do", method=RequestMethod.POST)
	public @ResponseBody ArrayList<MemberDTO> ajaxtest2(MemberDTO mdto){
		return mdao.getMemberIdAndNameSearch(mdto);
	}
	/** Jquery Ajax(File) 페이지 이동 */
	@RequestMapping(value="ajaxtest2file.do", method=RequestMethod.GET)
	public String ajaxtest2fileForm(MemberDTO mdto){
		return "sample/ajax/ajaxTest2File";
	}
	
	//// socket ////
	/** socketlist 페이지 이동 */
	@RequestMapping(value="sockettest.do", method=RequestMethod.GET)
	public String socketListForm(){
		return "sample/socket/socketList";
	}
	/** echo_wsTest 페이지 이동 */
	@RequestMapping(value="echo_wsTest.do", method=RequestMethod.GET)
	public String echo_wsTestForm(){
		return "sample/socket/echo_wsTest";
	}
	/** chat_wsTest 페이지 이동 */
	@RequestMapping(value="chat_wsTest.do", method=RequestMethod.GET)
	public String chat_wsTestForm(){
		return "sample/socket/chat_wsTest";
	}
	/** echo_sockjsTest 페이지 이동 */
	@RequestMapping(value="echo_sockjsTest.do", method=RequestMethod.GET)
	public String echo_sockjsTestForm(){
		return "sample/socket/echo_sockjsTest";
	}
	/** chat_sockjsTest 페이지 이동 */
	@RequestMapping(value="chat_sockjsTest.do", method=RequestMethod.GET)
	public String chat_sockjsTestForm(){
		return "sample/socket/chat_sockjsTest";
	}
	
}