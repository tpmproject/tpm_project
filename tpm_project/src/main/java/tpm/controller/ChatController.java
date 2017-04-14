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
import tpm.chat.model.ChatDTO;
import tpm.member.model.MemberDTO;
import tpm.project.model.ProjectDAO;
import tpm.project.model.ProjectDTO;

@Controller
public class ChatController {
	
	@Autowired
	private ChatDAO chatDAO;
	
	//// 채팅 ////
	/** 채팅 - 채팅 리스트 페이지 이동 */
	@RequestMapping(value="chatList.do",  method=RequestMethod.GET)
	public ModelAndView chatListForm(ModelAndView mav, HttpSession session){
		
		List<Object> arry_pdto = chatDAO.getChatProjectList(session.getAttribute("s_member_idx"));
		List<Object> arry_chdto = chatDAO.getChatChannelList(session.getAttribute("s_member_idx"));
		List<Object> arry_ctdto = chatDAO.getChatContentList(new ChatDTO("P", ((ProjectDTO) arry_pdto.get(0)).getProject_idx()));
		System.out.println(arry_ctdto.toString());
		for (Object object : arry_ctdto) {
			System.out.println(object.toString());
		}
		
		mav.addObject("arry_pdto", arry_pdto);
		mav.addObject("arry_chdto", arry_chdto);
		mav.setViewName("chat/chatForm");
		return mav;
	}
	
	/** 채팅 - 채팅 데이터 반환 */
	@RequestMapping(value="chatList.do",  method=RequestMethod.POST)
	public ModelAndView chatList(ChatDTO ctdto){
		System.out.println(ctdto.getChat_cp_code());
		System.out.println(ctdto.getChat_cp_value());
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
