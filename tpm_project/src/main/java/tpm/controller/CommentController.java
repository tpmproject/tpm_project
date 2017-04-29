package tpm.controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import tpm.comment.model.CommentDAO;
import tpm.comment.model.CommentDTO;

@Controller
public class CommentController {
	
	@Autowired
	private CommentDAO commentDAO;

	//// 코멘트 ////
	/** 코멘트 - 코멘트 데이터 반환 */
	/*@RequestMapping(value="commentList.do",  method=RequestMethod.POST)
	public ModelAndView commentList(int work_idx){
		
		ModelAndView mav = new ModelAndView();
		
		ArrayList<CommentDTO> dto = commentDAO.CommentList(work_idx);
		
		mav.addObject("arr", dto);
		mav.setViewName("comment/comment");
		
		return mav;
	}*/
	
	/** 코멘트 - 코멘트 데이터 반환*/
	@RequestMapping(value="commentList.do",  method=RequestMethod.GET)
	public @ResponseBody List<Object> commentList(CommentDTO cdto){
		/*List<Object> arr_cdto = commentDAO.getCommentList(cdto);
		
		for(Object object: arr_cdto){
			System.out.println(object);
		}
		
		return arr_cdto;*/
		return commentDAO.getCommentList(cdto);
	}
	
	/** 코멘트 - 코멘트 입력 */
	/*@RequestMapping(value="commentAdd.do",  method=RequestMethod.POST)
	public ModelAndView commentAdd(CommentDTO dto){
		
		ModelAndView mav = new ModelAndView();
		
		int result = commentDAO.commentAdd(dto);
		System.out.println(result);
		
		mav.addObject("result", result);
		mav.setViewName("comment/commentAdd_d");
		return mav;
	}*/
	
	/** 코멘트 - 코멘트 입력(jSON1)*/
	/*@RequestMapping(value="commentAdd.do",  method=RequestMethod.POST)
	public ModelAndView commentAdd(CommentDTO dto){
		
		ModelAndView mav = new ModelAndView();
		
		dto = commentDAO.addComment(dto);
		System.out.println(dto.getComment_idx());
		System.out.println(dto.getComment_date());
		
		if(dto!=null){
			mav.addObject("comment", dto);
		}
		
		mav.setViewName("comment/commentAdd_d");
		return mav;
	}*/
	
	/** 코멘트 - 코멘트 입력 JSON 테스트*/
	@RequestMapping(value="addComment.do", method=RequestMethod.POST)
	public @ResponseBody Object addComment(CommentDTO cdto, HttpSession session){
		
		cdto.setMember_idx((Integer)session.getAttribute("s_member_idx"));
		
		int result = commentDAO.addComment(cdto);
		
		if(result > 0){
			return commentDAO.getCommentContent(cdto);
		} else{
			return "false";
		}
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
