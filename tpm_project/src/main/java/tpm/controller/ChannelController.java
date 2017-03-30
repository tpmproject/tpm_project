package tpm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ChannelController {

	//// 채널 ////
	
	// 채널
	/** 채팅 - 채널 개설 */
	@RequestMapping(value="channelAdd.do",  method=RequestMethod.GET)
	public ModelAndView channelAdd(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("chat/chatListForm");
		return mav;
	}
	
	// 멤버
	/** 멤버 - 채널 멤버 초대 */
	@RequestMapping(value="channelMemberAdd.do",  method=RequestMethod.POST)
	public ModelAndView channelMemberAdd(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("chat/channelMemberResult_d");
		return mav;
	}
	
	/** 멤버 - 채널 나가기 */
	@RequestMapping(value="channelMemberDel.do",  method=RequestMethod.POST)
	public ModelAndView channelMemberDel(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("chat/channelMemberResult_d");
		return mav;
	}
}
