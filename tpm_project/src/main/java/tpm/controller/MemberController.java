package tpm.controller;

import static org.junit.Assert.fail;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import tpm.member.model.MemberDAO;
import tpm.member.model.MemberDAOImple;
import tpm.member.model.MemberDTO;
import tpm.member.model.SMTPAuthenticatior;
import tpm.project.model.ProjectDTO;
import tpm.project.model.ProjectMemberDTO;
import tpm.tendency.model.TendencyDAO;
import tpm.tendency.model.TendencyDTO;


@Controller
public class MemberController {

	@Autowired 
	private MemberDAO mdao;
	
	@Autowired
	private TendencyDAO tdao;
	
	//// 회원 ////
	// 로그인 및 로그아웃
	/** 친구 상태가아닌 회원 아이디, 이름 검색 */
	@RequestMapping(value="memberIdAndNameSearch.do", method=RequestMethod.POST)
	public ModelAndView memberIdAndNameSearch(@RequestParam(value="fkey") String fkey, 
			HttpServletRequest req){
		
		HttpSession session = req.getSession();
		
		MemberDTO mdto = new MemberDTO();
		mdto.setMember_idx((Integer) session.getAttribute("s_member_idx"));
		mdto.setMember_id(fkey);
		
		ArrayList<MemberDTO> arry_mdto = mdao.getMemberIdAndNameSearch(mdto);
		System.out.println(arry_mdto.toString());
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/memberIdAndNameSearchList_d");
		mav.addObject("arry_mdto", arry_mdto);
		return mav;
	}
	
	/** 로그인 페이지 이동 */
	@RequestMapping(value="memberLogin.do", method=RequestMethod.GET)
	public String memberLoginForm(){
		return "member/memberLoginForm";
	}
	
	/** 로그인 처리 */
	@RequestMapping(value="memberLogin.do", method=RequestMethod.POST)
	public ModelAndView memberLogin(@RequestParam(value="cb_saveid",defaultValue="1")String cb_saveid,
									@RequestParam("member_id")String userid,
									@RequestParam("member_pwd")String userpwd,
									MemberDTO mdto,
									HttpServletRequest req,HttpServletResponse resp){
		
		int result=mdao.login(userid, userpwd);
		List<MemberDTO> list=mdao.userInfo(userid);
		
		ModelAndView mav=new ModelAndView();
		String msg="";
		
		HttpSession session=req.getSession();
		
		//member_name   member_img    member_idx
	
		if(result==((MemberDAOImple)mdao).LOGIN_OK){
			msg="로그인 성공";
		
			if(cb_saveid==null||cb_saveid.equals("1")){
				Cookie ck=new Cookie("ck_saveid", mdto.getMember_id());
				ck.setMaxAge(0);
				resp.addCookie(ck);
			}else{
				Cookie ck=new Cookie("ck_saveid", mdto.getMember_id());
				ck.setMaxAge(60*60*24*30);
				resp.addCookie(ck);
			}
			
			session.setAttribute("s_member_id", mdto.getMember_id());
			session.setAttribute("s_member_idx", list.get(0).getMember_idx());
			session.setAttribute("s_member_name", list.get(0).getMember_name());
			session.setAttribute("s_member_img", list.get(0).getMember_img());
			mav.addObject("msg", msg);
			mav.setViewName("member/memberLogin_ok");
		}
		else if(result==((MemberDAOImple)mdao).ID_NO){
			msg="없는 아이디 입니다.";
			mav.addObject("msg",msg);
			mav.setViewName("member/memberMsg");
		}
		else if(result==((MemberDAOImple)mdao).PASSWORD_NO){
			msg="비밀번호가 다릅니다.";
			mav.addObject("msg",msg);
			mav.setViewName("member/memberMsg");
		}
		else{
			msg="고객샌터 연락바람니다.";
			mav.addObject("msg",msg);
		}
		return mav;
		
	}
	
	/** 로그아웃 */
	@RequestMapping(value="memberLogOut.do", method=RequestMethod.GET)
	public ModelAndView memberLogOut(HttpServletRequest req){
		HttpSession session=req.getSession();
		
		session.invalidate();
		String msg="로그아웃 완료";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg",msg);
		mav.setViewName("member/memberLogOut_ok");
		return mav;
	}
	
	// 회원가입
	/** 회원 가입 - 정보입력 페이지 이동 */
	@RequestMapping(value="memberAdd.do", method=RequestMethod.GET)
	public String memberAddForm(){
		return "member/memberAddForm_info";
	}
	
	/** 회원 가입 - 정보입력 - 아이디 중복 체크 처리 */
	@RequestMapping(value="memberIdCheck.do", method=RequestMethod.POST)
	public ModelAndView memberIdCheck(@RequestParam("email") String email){
		
		String db_id = mdao.idCheck(email);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("result", db_id);
		mav.setViewName("member/memberIdCheckResult");
		
		return mav;
	}
	
	/** 회원 가입 - 성향입력 페이지 이동 */
	@RequestMapping(value="memberAddTendency.do", method=RequestMethod.GET)
	public ModelAndView memberAddTendencyForm(MemberDTO mdto, HttpServletRequest req){
		HttpSession session = req.getSession();
		session.setAttribute("mdto", mdto);
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("member/memberAddForm_tendency");
		return mav;
	}
	 //*************************************회원 정보입력-> 회원성향 -> 회원등록 할떄 mdto정보 전달 하기
	/** 회원 가입 - 회원 등록 */
	@RequestMapping(value="memberAdd.do", method=RequestMethod.POST)
	public ModelAndView memberAdd(TendencyDTO tdto, HttpServletRequest req){
		HttpSession session = req.getSession();
		MemberDTO mdto=(MemberDTO) req.getAttribute("mdto");
		
		System.out.println(mdto.getMember_name());
		int result=mdao.addMember(mdto);
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("member/memberAdd_ok");
		return mav;
	}
	
	/** 회원가입 - 이메일 보내기*/
	@RequestMapping(value="memberSendEmail.do", method=RequestMethod.GET)
	public ModelAndView memberSendEmail(@RequestParam("email") String to){
		
		ModelAndView mav = new ModelAndView();
		String result = "";
		
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
		
		mav.addObject("email", to);
		mav.addObject("random", random);
		mav.addObject("result", result);
		mav.setViewName("member/memberEmail");
		
		return mav;
		
	}
	
	/** 회원가입 - 이메일 인증 */
	@RequestMapping(value="memberEmailCheck.do", method=RequestMethod.POST)
	public ModelAndView memberEmailCheck(@RequestParam("random_number") int random, @RequestParam("user_number") int user,
										@RequestParam("email") String email, HttpSession Session){
		
		ModelAndView mav = new ModelAndView();

		String result = "";
		
		if(random==user){
			result = "인증에 성공하였습니다";
			
			Session.setAttribute("email", email);
			mav.addObject("success", result);
			mav.setViewName("member/memberEmailSuccess");
		} else{
			result = "인증번호를 확인해주세요";
			
			mav.addObject("failed", result);
			mav.setViewName("member/memberEmailFailed");
		}
		
		return mav;
	}
	
	// 탈퇴
	/** 탈퇴 - 회원탈퇴 */
	@RequestMapping(value="memberDel.do", method=RequestMethod.GET)
	public ModelAndView memberDel(@RequestParam("id") String user_id, HttpSession session){
		
		ModelAndView mav = new ModelAndView();
		
		System.out.println(user_id);
		
		int count = mdao.delMember(user_id);
		
		String result = "";
		
		if(count>0){
			result = "탈퇴되었습니다";
			
			session.invalidate();
			
			mav.addObject("result", result);
			mav.setViewName("member/memberDel_ok");
		} else{
			result = "탈퇴 실패. 관리자에게 문의해주세요";
			
			mav.addObject("result", result);
			mav.setViewName("member/memberDel_ok");
		}
		return mav;
	}
	
	// 개인정보
	/** 개인정보 - 개인정보 페이지 이동 */
	@RequestMapping(value="memberInfo.do", method=RequestMethod.GET)
	public ModelAndView memberInfoForm(HttpServletRequest req){
		
		HttpSession session = req.getSession();
		
		String userid = (String)session.getAttribute("s_member_id");
		
		int member_idx = (Integer)session.getAttribute("s_member_idx");
		
		ModelAndView mav = new ModelAndView();
		
		List<MemberDTO> list = mdao.userInfo(userid);
		
		List<TendencyDTO> self_tendencyList = tdao.getSelfTendency(member_idx);
		
		List<TendencyDTO> team_tendencyList = tdao.getTeamTendency(member_idx);
		
		String myworkcount = mdao.myWorkCount(member_idx);
		
		String myworkcomplete = mdao.myWorkComplete(member_idx);
		
		List<ProjectDTO> myproject = mdao.myproject(member_idx);
		
		mav.addObject("myprojectlist", myproject);
		mav.addObject("myworkcount", myworkcount);
		mav.addObject("myworkcomplete", myworkcomplete);
		mav.addObject("team_tendency", team_tendencyList);
		mav.addObject("self_tendency", self_tendencyList);
		mav.addObject("userInfo", list);
		mav.setViewName("member/memberInfoForm");
		
		return mav;
	}
	
	/** 개인정보 - 프로필 사진 저장*/
	@RequestMapping(value="updateProfile.do", method=RequestMethod.GET)
	public ModelAndView updateProfile(MemberDTO dto,HttpServletRequest req, @RequestParam("fileNm") String fileNm){
		
		HttpSession session = req.getSession();
		
		String userid = (String)session.getAttribute("s_member_id");
		
		String filename = fileNm;
		String savepath = req.getServletContext().getRealPath("img/member/profile/"+userid+"");
		System.out.println("save: "+savepath);
		
		File uploadDirectory = new File(req.getServletContext().getRealPath("img/member/profile/"+userid+""));
		System.out.println(uploadDirectory);
		
		if(!uploadDirectory.exists()){
			uploadDirectory.mkdirs();
		}
		
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	/** 개인정보 - 업무 정보 */
	@RequestMapping(value="getWork.do", method=RequestMethod.GET)
	public ModelAndView getWorkState(ProjectMemberDTO dto){
		
		ModelAndView mav = new ModelAndView();
		
		String myworkING = mdao.myWorkIng(dto);
		
		String myworkTotal = mdao.myworkTotal(dto);
		
		mav.addObject("myworkTotal", myworkTotal);
		mav.addObject("myworkING", myworkING);
		mav.setViewName("member/memberWork_d");
		
		return mav;
	}
	
	/** 개인정보 - 개인 정보 수정 */
	@RequestMapping(value="memberUpdate.do", method=RequestMethod.POST)
	public ModelAndView memberUpdate(MemberDTO mdto, HttpSession session){
		
		ModelAndView mav = new ModelAndView();
		
		String s_member_id = (String)session.getAttribute("s_member_id");
		
		int count = mdao.updateMember(mdto);
		
		String result = "";
		if(count>0){
			result = "수정 완료";
			
			mav.addObject("result", result);
			mav.setViewName("member/memberUpdate_ok");			
		} else{
			result = "수정 실패. 관리자에게 문의바랍니다";
			
			mav.addObject("result", result);
			mav.setViewName("member/memberUpdate_ok");
		}
		
		return mav;
	}
	
	/** 개인정보 - 개인 성향 수정 (평가 ) */
	@RequestMapping(value="memberUpdate.do", method=RequestMethod.GET)
	public ModelAndView memberUpdate_ajax(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("memeber/memberResult_d");
		return mav;
	}
	
}
