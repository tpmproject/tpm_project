package tpm.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;

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
		/*List<Object> arry_ctdto = chatDAO.getChatContentList(new ChatDTO("P", ((ProjectDTO) arry_pdto.get(0)).getProject_idx()));
		System.out.println(arry_ctdto.toString());
		for (Object object : arry_ctdto) {
			System.out.println(object.toString());
		}*/
		
		mav.addObject("arry_pdto", arry_pdto);
		mav.addObject("arry_chdto", arry_chdto);
		/*mav.addObject("arry_ctdto", arry_ctdto);*/
		mav.setViewName("chat/chatForm");
		return mav;
	}
	
	/** 채팅 - 채널 리스트 데이터 반환 */
	@RequestMapping(value="chatChannelList.do",  method=RequestMethod.POST)
	public @ResponseBody List<Object> chatList_ajax(ModelAndView mav, HttpSession session){
		return chatDAO.getChatChannelList(session.getAttribute("s_member_idx"));
	}
	
	/** 채팅 - 채팅 리스트 페이지 이동(테스트) */
	@RequestMapping(value="chatListTest.do",  method=RequestMethod.GET)
	public ModelAndView chatListTest(ModelAndView mav, HttpSession session){
		List<Object> arry_pdto = chatDAO.getChatProjectList(session.getAttribute("s_member_idx"));
		List<Object> arry_chdto = chatDAO.getChatChannelList(session.getAttribute("s_member_idx"));

		mav.addObject("arry_pdto", arry_pdto);
		mav.addObject("arry_chdto", arry_chdto);
		mav.setViewName("chat/chatListForm");
		return mav;
	}
	
	
	
	/** 채팅 - 채팅 리스트 페이지2 이동(테스트) */
	@RequestMapping(value="chatListTest2.do",  method=RequestMethod.GET)
	public ModelAndView chatListTest2(ModelAndView mav){
		mav.setViewName("chat/chatTestff");
		return mav;
	}
	
	/** 채팅 - 채팅 데이터 반환 */
	@RequestMapping(value="chatList.do",  method=RequestMethod.POST)
	public @ResponseBody List<Object> chatList(ChatDTO ctdto){
		List<Object> arry_ctdto = chatDAO.getChatContentList(ctdto);
		for (Object object : arry_ctdto) {
			System.out.println(object);
		}
		return arry_ctdto;
	}
	
	
	/** 채팅 - 채팅 입력 */
	@RequestMapping(value="chatAdd.do",  method=RequestMethod.POST)
	public @ResponseBody Object chatAdd(ChatDTO ctdto, HttpSession session){
		ctdto.setMember_idx((Integer) session.getAttribute("s_member_idx"));
		int result = chatDAO.addChat(ctdto);
		if(result > 0){ // insert 성공시 해당 데이터를 다시 가져온다.
			return chatDAO.getChatContent(ctdto);
		} else {
			return "false";
		}
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
