package tpm.controller;

import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import tpm.member.model.MemberDAO;
import tpm.member.model.MemberDTO;
import tpm.member.model.SMTPAuthenticatior;

@Controller
public class MemberController {

	@Autowired 
	private MemberDAO mdao;
	//// 회원 ////
	// 로그인 및 로그아웃
	
	/** 로그인 페이지 이동 */
	@RequestMapping(value="memberLogin.do", method=RequestMethod.GET)
	public String memberLoginForm(){
		return "member/memberLoginForm";
	}
	
	/** 로그인 처리 */
	@RequestMapping(value="memberLogin.do", method=RequestMethod.POST)
	public ModelAndView memberLogin(@RequestParam("member_id")String userid, @RequestParam("member_pwd")String userpwd){
		int result=mdao.login(userid, userpwd);
		
		ModelAndView mav = new ModelAndView();
		
		if(result==1){
		mav.setViewName("member/memberLogin_ok");
		}else{
		mav.setViewName("member/memberMsg");
		}
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
	public ModelAndView memberAdd(MemberDTO mdto){
		
		int result=mdao.addMember(mdto);
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("member/memberAdd_ok");
		return mav;
	}
	
	/** 회원 가입 - 이메일 보내기 */
	@RequestMapping(value="memberSendEmail.do", method=RequestMethod.GET)
	public ModelAndView memberSendEmail(@RequestParam("email") String to){
		
		String from = "tpmproject";
		String subject = "tpm project에 오신 것을 환영합니다";
		int random = (int)(Math.random()*899999)+100000;
		String content = "인증번호: "+random;
		
		Properties p = new Properties();
		 
		p.put("mail.smtp.host","smtp.naver.com");
		 
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
		 
		ModelAndView mav = new ModelAndView();
		String result = "";
		
		try{
		    Authenticator auth = new SMTPAuthenticatior();
		    Session ses = Session.getInstance(p, auth);
		     
		    ses.setDebug(true);
		     
		    MimeMessage msg = new MimeMessage(ses);
		    msg.setSubject(subject);
		     
		    Address fromAddr = new InternetAddress(from);
		    msg.setFrom(fromAddr);
		     
		    Address toAddr = new InternetAddress(to);
		    msg.addRecipient(Message.RecipientType.TO, toAddr);
		     
		    msg.setContent(content, "text/html;charset=UTF-8");
		     
		    Transport.send(msg);
		} catch(Exception e){
		    e.printStackTrace();
		    result = "Send Mail Failed..";
		}
		 
		result = "인증번호가 발송되었습니다";
		
		mav.addObject("result", result);
		mav.addObject("random", random);
		mav.setViewName("member/memberEmail");
		
		return mav;
	}
	
	/** 회원가입 - 이메일 인증 */
	@RequestMapping(value="memberEmailCheck.do", method=RequestMethod.POST)
	public ModelAndView memberEmailCheck(@RequestParam("random_number") int random, @RequestParam("user_number") int user){
		
		ModelAndView mav = new ModelAndView();

		//System.out.println(random);
		//System.out.println(user);
		
		String result = "";
		
		if(random==user){
			result = "인증에 성공하였습니다";
			
			mav.addObject("result", result);
			mav.setViewName("member/memberEmailSuccess");
		} else{
			result = "인증번호를 확인해주세요";
			
			mav.addObject("result", result);
			mav.setViewName("member/memberEmailFailed");
		}
		
		return mav;
	}
	
	// 탈퇴
	/** 탈퇴 - 회원탈퇴 */
	@RequestMapping(value="memberDel.do", method=RequestMethod.GET)
	public ModelAndView memberDel(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/memberDel_ok");
		return mav;
	}
	
	// 개인정보
	/** 개인정보 - 개인정보 페이지 이동 */
	@RequestMapping(value="memberInfo.do", method=RequestMethod.GET)
	public String memberInfoForm(){
		return "member/memberInfoForm";
	}
	
	/** 개인정보 - 개인 정보 수정 */
	@RequestMapping(value="memberUpdate.do", method=RequestMethod.GET)
	public ModelAndView memberUpdate(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/memberInfoForm");
		return mav;
	}
	
	/** 개인정보 - 개인 성향 수정 ( 평가 ) */
	@RequestMapping(value="memberUpdate.do", method=RequestMethod.POST)
	public ModelAndView memberUpdate_ajax(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("memeber/memberResult_d");
		return mav;
	}
	
}
