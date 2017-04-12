package tpm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import tpm.category.model.CategoryDAO;
import tpm.category.model.CategoryDTO;

@Controller
public class CategoryController {
	
	@Autowired
	CategoryDAO categoryDAO;
	
	//// 카테고리 ////
	/** 카테고리 - 카테고리 추가 */
	@RequestMapping(value="categoryAdd.do",  method=RequestMethod.POST)
	public ModelAndView categoryAdd(CategoryDTO dto){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("category/categoryResult_d");
		
		int result=categoryDAO.categoryInsert(dto);
		
		String msg=dto.getCategory_name();
		if(result<=0){
			msg="error";
		}else{
			dto.setCategory_idx(result);
		}
		
		mav.addObject("categoryDTO", dto);
		mav.addObject("msg", msg);
		return mav;
	}
	/** 카테고리 - 카테고리 수정 */
	@RequestMapping(value="categoryUpdate.do",  method=RequestMethod.POST)
	public ModelAndView categoryUpdate(CategoryDTO dto){
		int result=categoryDAO.categoryUpdate(dto);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("category/categoryResult_d");
		
		if(result>0){
			mav.addObject("upd", result);
		}
		
		return mav;
	}
	/** 카테고리 - 카테고리 삭제 */
	@RequestMapping(value="categoryDel.do",  method=RequestMethod.POST)
	public ModelAndView categoryDel(int category_idx){
		
		int result=categoryDAO.categoryDelete(category_idx);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("category/categoryResult_d");
		
		if(result>0){
			mav.addObject("upd", result);
		}
		
		return mav;
	}
}
