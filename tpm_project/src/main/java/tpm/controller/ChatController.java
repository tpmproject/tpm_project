package tpm.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import tpm.chat.model.ChatDAO;
import tpm.member.model.MemberDTO;
import tpm.project.model.ProjectDAO;

@Controller
public class ChatController {
	
	@Autowired
	private ChatDAO chatDAO;
	
	//// 채팅 ////
	/** 채팅 - 채팅 리스트 페이지 이동 */
	@RequestMapping(value="chatList.do",  method=RequestMethod.GET)
	public ModelAndView chatListForm(HttpSession session){
		
		MemberDTO mdto = new MemberDTO();
		mdto.setMember_idx((Integer) session.getAttribute("s_member_idx")); 
		List<Object> arry_pdto = chatDAO.getChatProjectList(mdto);
		System.out.println(arry_pdto.toString());
		for (Object object : arry_pdto) {
			System.out.println(object.toString());
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("chat/chatForm");
		return mav;
	}
	
	/** 채팅 - 채팅 데이터 반환 */
	@RequestMapping(value="chatList.do",  method=RequestMethod.POST)
	public ModelAndView chatList(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("chat/chatList_d");
		return mav;
	}
	
	/** 채팅 - 채팅 입력 */
	@RequestMapping(value="chatAdd.do",  method=RequestMethod.POST)
	public ModelAndView chatAdd(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("chat/chatResult_d");
		return mav;
	}
	
	/** 채팅 - 채팅 수정 */
	@RequestMapping(value="chatUpdate.do",  method=RequestMethod.POST)
	public ModelAndView chatUpdate(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("chat/chatResult_d");
		return mav;
	}
	
	/** 채팅 - 채팅 삭제 */
	@RequestMapping(value="chatDel.do",  method=RequestMethod.POST)
	public ModelAndView chatDel(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("chat/chatResult_d");
		return mav;
	}
}
