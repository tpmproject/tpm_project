package tpm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ChatController {
	
	//// 채팅 ////
	/** 채팅 - 채팅 리스트 페이지 이동 */
	@RequestMapping(value="chatList.do",  method=RequestMethod.GET)
	public ModelAndView chatListForm(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("chat/chatListForm");
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
