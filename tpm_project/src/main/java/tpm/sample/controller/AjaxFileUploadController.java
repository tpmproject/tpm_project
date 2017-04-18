package tpm.sample.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import tpm.sample.model.AjaxFileUploadService;

@Controller
public class AjaxFileUploadController {
	
	@Autowired
	private AjaxFileUploadService fileService;
	
	/* 파일 업로드 화면 이동 */
	@RequestMapping(value="fileUpload.do", method=RequestMethod.GET)
	public ModelAndView fileUploadForm() {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("sample/ajaxfile/fileUpload_submit");
		
		return mav;
	}
	
	/* 파일 업로드 처리 */
	@RequestMapping(value="fileUpload.do", method=RequestMethod.POST)
	public ModelAndView fileUpload(MultipartHttpServletRequest mRequest) {
		
		ModelAndView mav = new ModelAndView();
		
		if(fileService.fileUpload(mRequest)) {
			mav.addObject("result", "SUCCESS");
		} else {
			mav.addObject("result", "FAIL");
		}
		
		mav.setViewName("sample/ajaxfile/fileUpload_result");
		
		return mav;
	}
	
	/* 파일 업로드 화면 이동 */
	@RequestMapping(value="fileUploadAjax.do", method=RequestMethod.GET)
	public ModelAndView fileUploadAjaxForm() {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("sample/ajaxfile/fileUpload_ajax");
		
		return mav;
	}
	
	/* 파일 업로드 처리 */
	@RequestMapping(value="fileUploadAjax.do", method=RequestMethod.POST)
	public ModelAndView fileUploadAjax(MultipartHttpServletRequest mRequest) {
		
		ModelAndView mav = new ModelAndView();
		
		if(fileService.fileUpload(mRequest)) {
			mav.addObject("result", "SUCCESS");
		} else {
			mav.addObject("result", "FAIL");
		}
		
		mav.setViewName("jsonView");
		
		return mav;
	}
	
}






