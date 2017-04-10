package tpm.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import tpm.member.model.MemberDTO;
import tpm.myfriend.model.MyFriendDAO;
import tpm.myfriend.model.MyFriendDTO;

@Controller
public class MyFriendController {
	
	@Autowired
	MyFriendDAO myFriendDAO;
	
	//// 친구 ////
	/** 친구 - 친구 리스트 페이지 이동 */
	@RequestMapping(value="myFriendList.do", method=RequestMethod.GET)
	public ModelAndView myFriendListForm(HttpServletRequest req){
		
		HttpSession session = req.getSession();
		int member_idx = (Integer) session.getAttribute("s_member_idx");
		
		MyFriendDTO dto = new MyFriendDTO();
		dto.setMember_idx(member_idx);
		//ArrayList<MyFriendDTO> arry_dto = myFriendDAO.getFriendList(dto);
		ArrayList<MemberDTO> arry_mdto = myFriendDAO.getFriendMemberInfoList(dto);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("myfriend/myFriendListForm");
		mav.addObject("arry_mdto", arry_mdto);
		return mav;
	}
	
	/** 친구 - 친구 리스트 데이터 반환 */
	@RequestMapping(value="myFriendList.do", method=RequestMethod.POST)
	public ModelAndView myFriendList(HttpServletRequest req){
		
		HttpSession session = req.getSession();
		int member_idx = (Integer) session.getAttribute("s_member_idx");
		
		MyFriendDTO dto = new MyFriendDTO();
		dto.setMember_idx(member_idx);
		//ArrayList<MyFriendDTO> arry_dto = myFriendDAO.getFriendList(dto);
		ArrayList<MemberDTO> arry_mdto = myFriendDAO.getFriendMemberInfoList(dto);
				
		/*ModelAndView mav = new ModelAndView();
		mav.setViewName("myfriend/myFriendList_d");
		mav.addObject("arry_mdto", arry_mdto);
		return mav;*/
		
		ModelAndView mav = new ModelAndView();
		JSONArray jsonArray = new JSONArray();
		JSONObject json = new JSONObject();

		json.put("members", jsonArray.fromObject(arry_mdto));
		
		mav.setViewName("myfriend/myFriendList_d");
		mav.addObject("jsonArray", json);
		return mav;
	}
	
	/** 친구 - 친구 등록 */
	@RequestMapping(value="myFriendAdd.do", method=RequestMethod.GET)
	public ModelAndView myFriendAdd(MyFriendDTO dto){
		
		int count = myFriendDAO.addFriend(dto);
		String result = count > 0 ? "true" : "false";
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("myfriend/myFriendResult_d");
		mav.addObject("result", result);
		return mav;
	}
	
	/** 친구 - 친구 등록 */
	@RequestMapping(value="myFriendAdd.do", method=RequestMethod.POST)
	public ModelAndView myFriendAdd_ajax(MyFriendDTO dto){
		
		//MyFriendDTO dto = new MyFriendDTO(7, 3);
		int count = myFriendDAO.addFriend(dto);
		String result = count > 0 ? "true" : "false";
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("myfriend/myFriendResult_d");
		mav.addObject("result", result);
		return mav;
	}
	
	
	/** 친구 - 친구 검색 */
	@RequestMapping(value="myFriendSearch.do", method=RequestMethod.GET)
	public ModelAndView myFriendSearch(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("myfriend/myFriendList_d");
		return mav;
	}
	
	/** 친구 - 친구 삭제 */
	@RequestMapping(value="myFriendDel.do", method=RequestMethod.GET)
	public ModelAndView myFriendDel(MyFriendDTO dto){
		
		//MyFriendDTO dto = new MyFriendDTO(7, 3);
		//System.out.println(dto.toString());
		int count = myFriendDAO.delFriend(dto);
		//String result = count > 0 ? "true" : "false";
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/myFriendList.do");
		//mav.addObject("result", result);
		return mav;
	}
	
	/** 친구 - 친구 삭제 */
	@RequestMapping(value="myFriendDel.do", method=RequestMethod.POST)
	public ModelAndView myFriendDel_ajax(MyFriendDTO dto){
		
		//MyFriendDTO dto = new MyFriendDTO(7, 3);
		//System.out.println(dto.toString());
		int count = myFriendDAO.delFriend(dto);
		String result = count > 0 ? "true" : "false";
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("myfriend/myFriendResult_d");
		mav.addObject("result", result);
		return mav;
	}
}
