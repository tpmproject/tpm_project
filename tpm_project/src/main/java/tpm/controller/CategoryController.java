package tpm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CategoryController {

	//// 카테고리 ////
	/** 카테고리 - 카테고리 추가 */
	@RequestMapping(value="categoryAdd.do",  method=RequestMethod.POST)
	public ModelAndView categoryAdd(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("category/categoryResult_d");
		return mav;
	}
	/** 카테고리 - 카테고리 수정 */
	@RequestMapping(value="categoryUpdate.do",  method=RequestMethod.POST)
	public ModelAndView categoryUpdate(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("category/categoryResult_d");
		return mav;
	}
	/** 카테고리 - 카테고리 삭제 */
	@RequestMapping(value="categoryDel.do",  method=RequestMethod.POST)
	public ModelAndView categoryDel(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("category/categoryResult_d");
		return mav;
	}
}
