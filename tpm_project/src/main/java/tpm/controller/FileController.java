package tpm.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import tpm.file.model.FileDAO;
import tpm.file.model.FileDTO;
import tpm.project.model.ProjectDTO;

@Controller
public class FileController {
	
    @Autowired
    private FileDAO fdao;
	//// 파일 ////
	/** 파일 - 파일 리스트 페이지 이동 (프로젝트 리스트 보여주기) */
	@RequestMapping(value="fileList.do",  method=RequestMethod.GET)
	public ModelAndView fileListForm(HttpServletRequest req){
		
		HttpSession session=req.getSession();
		ArrayList<ProjectDTO> pdto=fdao.projectAllList();
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("pdto",pdto);
		mav.setViewName("file/fileListForm");
		return mav;
	}
	
	/** 파일 - 파일 리스트 데이터 반환 (프로젝트 별 파일들) */
	@RequestMapping(value="fileList.do",  method=RequestMethod.POST)
	public ModelAndView fileList(@RequestParam("project_idx")int project_idx){
		
		ArrayList<FileDTO> fileList=fdao.getFileList(project_idx);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("fileList", fileList);
		mav.setViewName("file/fileList_d");
		return mav;
	}
	
	/** 파일 - 파일 내용 반환 (뷰어) */
	@RequestMapping(value="fileContent.do",  method=RequestMethod.POST)
	public ModelAndView fileContent(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("file/fileContent_d");
		return mav;
	}
	
	/** 파일 - 파일 등록 */
	@RequestMapping(value="fileAdd.do",  method=RequestMethod.POST)
	public ModelAndView fileAdd(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("file/fileResult_d");
		return mav;
	}
	
	/** 파일 - 파일 수정 */
	@RequestMapping(value="fileUpdate.do",  method=RequestMethod.POST)
	public ModelAndView fileUpdate(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("file/fileResult_d");
		return mav;
	}
	
	/** 파일 - 파일 삭제 */
	@RequestMapping(value="fileDel.do",  method=RequestMethod.POST)
	public ModelAndView fileDel(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("file/fileResult_d");
		return mav;
	}
}
