package tpm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import tpm.comment.model.CommentDTO;

@Controller
public class CommentController {

	//// 코멘트 ////
	/** 코멘트 - 코멘트 데이터 반환 */
	@RequestMapping(value="commentList.do",  method=RequestMethod.POST)
	public ModelAndView commentList(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("comment/commentList_d");
		return mav;
	}
	
	/** 코멘트 - 코멘트 입력 */
	@RequestMapping(value="commentAdd.do",  method=RequestMethod.POST)
	public ModelAndView commentAdd(CommentDTO dto){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("comment/commentResult_d");
		return mav;
	}
	
	/** 코멘트 - 코멘트 수정 */
	@RequestMapping(value="commentUpdate.do",  method=RequestMethod.POST)
	public ModelAndView commentUpdate(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("comment/commentResult_d");
		return mav;
	}
	
	/** 코멘트 - 코멘트 삭제 */
	@RequestMapping(value="commentDel.do",  method=RequestMethod.POST)
	public ModelAndView commentDel(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("comment/commentResult_d");
		return mav;
	}
}
