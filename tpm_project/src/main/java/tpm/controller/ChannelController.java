package tpm.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import tpm.channel.model.ChannelDAO;
import tpm.channel.model.ChannelDTO;
import tpm.channelmember.model.ChannelMemberDAO;
import tpm.channelmember.model.ChannelMemberDTO;
import tpm.chat.model.ChatDAO;

@Controller
public class ChannelController {

	//// 채널 ////
	@Autowired
	private ChannelDAO channelDAO;
	
	@Autowired
	private ChannelMemberDAO channelMemberDAO;
	
	// 채널
	/** 채팅 - 채널 개설 */
	@RequestMapping(value="channelAdd.do",  method=RequestMethod.GET)
	public ModelAndView channelAdd(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("chat/chatListForm");
		return mav;
	}
	/** 채팅 - 채널 개설 */
	@RequestMapping(value="channelAdd.do",  method=RequestMethod.POST)
	public @ResponseBody Object channelAdd_ajax(ChannelDTO chdto,
			@RequestParam(value="selected_member_idxs[]") List<String> selected_member_idxs,
			HttpSession session){
		
		System.out.println("channel_name :"+chdto.getChannel_name());
		for (String string : selected_member_idxs) {
			System.out.println(string);
		}
		
		String msg = "";
		int result = channelDAO.createChannel(chdto);
		if(result > 0){ // insert 성공시 해당 channel_idx를 다시 가져와진다.
			channelMemberDAO.insertChannelMember(new ChannelMemberDTO(chdto.getChannel_idx(), (Integer) session.getAttribute("s_member_idx")));
			for (String member_idx : selected_member_idxs) {
				ChannelMemberDTO chmdto = new ChannelMemberDTO(chdto.getChannel_idx(), Integer.parseInt(member_idx));
				channelMemberDAO.insertChannelMember(chmdto);
			}
			
			msg = "true";
		}else{
			msg = "false";
		}
		
		return msg;
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
