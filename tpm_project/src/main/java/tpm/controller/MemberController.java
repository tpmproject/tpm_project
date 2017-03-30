package tpm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {

	//// 회원 ////
	// 로그인 및 로그아웃
	
	/** 로그인 페이지 이동 */
	@RequestMapping(value="memberLogin.do", method=RequestMethod.GET)
	public String memberLoginForm(){
		return "member/memberLoginForm";
	}
	
	/** 로그인 처리 */
	@RequestMapping(value="memberLogin.do", method=RequestMethod.POST)
	public ModelAndView memberLogin(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/memberLogin_ok");
		return mav;
	}
	
	/** 로그아웃 */
	@RequestMapping(value="memberLogOut.do", method=RequestMethod.GET)
	public String memberLogOut(){
		return "member/memberLogOut_ok";
	}
	
	// 회원가입
	
	/** 회원 가입 - 정보입력 페이지 이동 */
	@RequestMapping(value="memberAdd.do", method=RequestMethod.GET)
	public String memberAddForm(){
		return "member/memberAddForm_info";
	}
	
	/** 회원 가입 - 정보입력 - 아이디 중복 체크 처리 */
	@RequestMapping(value="memberIdCheck.do", method=RequestMethod.GET)
	public ModelAndView memberIdCheck(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/memberAdd_info_idCheck_d");
		return mav;
	}
	
	/** 회원 가입 - 성향입력 페이지 이동 */
	@RequestMapping(value="memberAddTendency.do", method=RequestMethod.GET)
	public String memberAddTendencyForm(){
		return "member/memberAddForm_tendency";
	}
	
	/** 회원 가입 - 회원 등록 */
	@RequestMapping(value="memberAdd.do", method=RequestMethod.POST)
	public ModelAndView memberAdd(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/memberAdd_ok");
		return mav;
	}
	
	/** 회원 가입 - 이메일 인증 */
	@RequestMapping(value="memberEmailCheck.do", method=RequestMethod.GET)
	public ModelAndView memberEmailCheck(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/memberEmail");
		return mav;
	}
}
