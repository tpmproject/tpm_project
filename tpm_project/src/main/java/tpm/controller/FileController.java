package tpm.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.activation.CommandMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
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
		int project_idx=(Integer) session.getAttribute("project_idx");
		
		ArrayList<ProjectDTO> pdto=fdao.projectAllList();
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("pdto",pdto);
		mav.setViewName("file/fileListForm");
		return mav;
	}
	
	/** 파일 - 파일 리스트 데이터 반환 (프로젝트 별 파일들) */
	@RequestMapping(value="fileList.do",  method=RequestMethod.POST)
	public ModelAndView fileList(@RequestParam("project_idx")int project_idx, HttpServletRequest req){
		HttpSession session=req.getSession();
		session.setAttribute("project_idx", project_idx);  //프로젝트 선택시 해당 project_idx 세션에 올리기
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
	

	/** 파일 - 파일 등록 페이지 이동 */
	@RequestMapping(value="fileUploadForm.do",  method=RequestMethod.GET)
	public ModelAndView fileUpLoadForm(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("file/fileUploadForm");
		return mav;
	}

	/** 파일 - 파일 등록 */
	@RequestMapping(value="fileAdd.do",  method=RequestMethod.POST)
	public ModelAndView fileAdd(HttpServletRequest req,HttpServletResponse response){
		MultipartHttpServletRequest multipartRequest =  (MultipartHttpServletRequest)req;
		
		HttpSession session=req.getSession();
		int member_idx=(Integer) session.getAttribute("s_member_idx"); //멤버 idx
		int project_idx=2;   //프로젝트 idx 가져오기, 임시
		int work_idx=2;      //업무 idx 가져오기 , 임시
		
		
		
		List<MultipartFile> files = multipartRequest.getFiles("file_upload");

		//파일이름,파일사이즈,파일경로
		for(int i=0; i<files.size(); i++){
			String file_name=files.get(i).getOriginalFilename();
			String file_size=Long.toString(files.get(i).getSize());
			String file_path="C:/Users/abm79/git/tpm_project/tpm_project/src/main/webapp/WEB-INF/view/file/upload/"+file_name;
			FileDTO fdto=new FileDTO(project_idx, work_idx, member_idx, file_name, file_size, file_path);
			int result=fdao.addFile(fdto);
		}
		
		return new ModelAndView("file/fileResult_d");
		
	/*	HttpSession session=req.getSession();
		int project_idx=2;   //프로젝트 idx 가져오기, 임시
		int work_idx=2;      //업무 idx 가져오기 , 임시
		System.out.println(session.getAttribute("s_member_idx"));
		int member_idx=(Integer)session.getAttribute("s_member_idx"); //유저 idx
		*/
	  /*  String file_name=file_upload.getOriginalFilename(); //파일 이름
		String file_size=Long.toString(file_upload.getSize()); //파일 사이즈
		String file_path="C:/Users/abm79/git/tpm_project/tpm_project/src/main/webapp/WEB-INF/view/file/upload/"+file_upload.getOriginalFilename();
		
		FileDTO fdto=new FileDTO(project_idx, work_idx, member_idx, file_name, file_size, file_path);
		
		copyInto(member_idx, file_upload);  //파일 복사
		
		int result=fdao.addFile(fdto); //파일등록 메서드 
	*/
		//ModelAndView mav = new ModelAndView();
		
		/*mav.setViewName("file/fileResult_d");
		return mav;*/
	}
	
	/** 파일 - 파일 수정 */
	@RequestMapping(value="fileUpdate.do",  method=RequestMethod.POST)
	public ModelAndView fileUpdate(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("file/fileResult_d");
		return mav;
	}
	
	/** 파일 - 파일 삭제 */
	@RequestMapping(value="fileDel.do",  method=RequestMethod.GET)
	public ModelAndView fileDel(@RequestParam("file_idx")int file_idx){
		
		System.out.println("컨트롤러 쪽"+file_idx);
		int result=fdao.delFile(file_idx);
		String msg="";
		ModelAndView mav = new ModelAndView();
		if(result==1){
			msg="파일 삭제완료";
			mav.addObject("msg",msg);
			mav.setViewName("file/fileResult_d");
		}else{
			msg="파일 삭제 실패";
			mav.addObject("msg",msg);
			mav.setViewName("file/fileListForm");
		}
		
		
		return mav;
	}
	
	/**복사관련 사용자정의 메서드*/
	private void copyInto(int s_member_idx, MultipartFile file_upload){
		System.out.println("작성자:"+s_member_idx);
		System.out.println("파일명:"+file_upload.getOriginalFilename());		
		try {
			byte bytes[]=file_upload.getBytes();
			
			File outFile=new File("C:/Users/abm79/git/tpm_project/tpm_project/src/main/webapp/WEB-INF/view/file/upload/"+file_upload.getOriginalFilename());
			FileOutputStream fos=new FileOutputStream(outFile);
			//복사 
			fos.write(bytes);
			fos.close();
			
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
}
