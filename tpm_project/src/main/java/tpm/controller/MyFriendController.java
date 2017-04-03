package tpm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import tpm.myfriend.model.MyFriendDAO;

@Controller
public class MyFriendController {
	
	@Autowired
	MyFriendDAO myFriendDAO;
	
	//// 친구 ////

	/** 친구 - 친구 리스트 페이지 이동 */
	@RequestMapping(value="myFriendList.do", method=RequestMethod.GET)
	public ModelAndView myFriendListForm(){
		
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("myfriend/myFriendListForm");
		return mav;
	}
	
	/** 친구 - 친구 리스트 데이터 반환 */
	@RequestMapping(value="myFriendList.do", method=RequestMethod.POST)
	public ModelAndView myFriendList(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("myfriend/myFriendList_d");
		return mav;
	}
	
	/** 친구 - 친구 등록 */
	@RequestMapping(value="myFriendAdd.do", method=RequestMethod.GET)
	public ModelAndView myFriendAdd(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("myfriend/myFriendListForm");
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
	public ModelAndView myFriendDel(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("myfriend/myFriendListForm");
		return mav;
	}
}
