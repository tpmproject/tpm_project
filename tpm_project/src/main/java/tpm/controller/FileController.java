package tpm.controller;

import java.io.*;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Base64.Decoder;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import tpm.file.model.FileDAO;
import tpm.file.model.FileDTO;
import tpm.file.model.FileSortDTO;
import tpm.member.model.MemberDTO;
import tpm.project.model.ProjectDTO;
import com.groupdocs.ui.Document;
import com.groupdocs.ui.Utils;
import com.groupdocs.viewer.config.ViewerConfig;
import com.sun.mail.util.BASE64DecoderStream;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
@Controller
public class FileController {
	
    @Autowired
    private FileDAO fdao;
    
   
    
	//// 파일 ////
	/** 파일 - 파일 리스트 페이지 이동 (프로젝트 리스트 보여주기) */
    @RequestMapping("scrollbar.do")
	public String scroll(){

		return "file/test1";
	}
    
	@RequestMapping(value="fileList.do",  method=RequestMethod.GET)
	public ModelAndView fileListForm( HttpServletRequest req){
		
		HttpSession session=req.getSession();
		int member_idx=(Integer)session.getAttribute("s_member_idx");
		ArrayList<ProjectDTO> pdto=fdao.projectAllList(member_idx); //프로젝트 리스트 project_idx 리스트 가져와 dto에 저장
		
		if(session.getAttribute("project_idx")==null){
			//System.out.println("get방식 fileList.do 쪽 session등록");
			session.setAttribute("project_idx", pdto.get(1).getProject_idx());
		}
		//System.out.println("첫 접속시 프로젝트 idx="+pdto.get(1).getProject_idx());
		//session.setAttribute("project_idx", 16); //파일리스트에 들어오자마자 project_idx 16번으로 세션에 올림 -> 첫화면으로 16번 리스트 보여줌
		
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("pdto",pdto);
		mav.setViewName("file/fileListForm");
		return mav;
	}
	
	/** 파일 - 파일 리스트 데이터 반환 (프로젝트 별 파일들) */
	@RequestMapping(value="fileList.do",  method=RequestMethod.POST)
	public ModelAndView fileList(@RequestParam("project_idx")int project_idx,
								 @RequestParam(value="line_name",required=false)String line_name,
								 @RequestParam(value="sort",defaultValue="")String sort,
								 @RequestParam(value="search_text",required=false)String search_text,
								 @RequestParam(value="type",defaultValue="file_idx")String type, HttpServletRequest req){
		
		HttpSession session=req.getSession();
		if((Integer)session.getAttribute("project_idx")!=project_idx){
			session.removeAttribute("project_idx");
			session.setAttribute("project_idx", project_idx);  //새로 받아온 project_idx가 세션에 올라간 project_idx와 다르면 새로운 세션값 으로 바꿔줌
		}
		//session.setAttribute("project_idx", project_idx);  //프로젝트 선택시 해당 project_idx 세션에 올리기
		
		if(project_idx!=(Integer)session.getAttribute("project_idx")||line_name==null){
			session.setAttribute("search_text","");
		}
	
	
		
		if(search_text!=null &&search_text!=""){
		session.setAttribute("search_text", search_text);
		};
		search_text=(String) session.getAttribute("search_text");
			//System.out.println("세션에 올라간 idx :"+session.getAttribute("project_idx"));
		if(sort=="" && sort=="null"){
			sort="asc";
		}else if(sort=="desc"){
			sort="desc";
		}
		
		
		FileSortDTO fsdto =new FileSortDTO(project_idx, line_name,sort);
		
/*		System.out.println("---------------------------------------------");
		System.out.println("컨트롤러에서 세션으로 올라간 project_idx:"+(Integer)session.getAttribute("project_idx"));
		System.out.println("컨트롤러에서의 project_idx:"+project_idx);
		System.out.println("컨트롤러에서의 sort:"+sort);
		System.out.println("컨트롤러에서의 line_name:"+line_name);
		System.out.println("컨트롤러에서의 세션으로 올라간 검색어:"+session.getAttribute("search_text"));*/
		ArrayList<FileDTO> fileList=fdao.getFileList(fsdto,search_text);
		
		
		ModelAndView mav = new ModelAndView();
	    
		mav.addObject("fileList", fileList);
		mav.setViewName("file/fileList_d");
		return mav;
	}
	

	/** 파일 - 파일 리스트 데이터 반환 (프로젝트 별 파일들) */
	@RequestMapping(value="workFileList.do",  method=RequestMethod.POST)
	public ModelAndView fileList(@RequestParam("project_idx")int project_idx,
								 @RequestParam("work_idx")int work_idx){
		
		System.out.println("project_idx:"+project_idx);
		System.out.println("work_idx:"+work_idx);
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		map.put("project_idx", project_idx);
		map.put("work_idx", work_idx);
		
		
		
		ModelAndView mav = new ModelAndView();
	    
		
	
		return mav;
	}
	
	/** 파일 - 파일 내용 반환 (뷰어) 
	 * @throws IOException */
	@RequestMapping(value="fileContent.do",  method=RequestMethod.POST)
	public ModelAndView fileContent(@RequestParam("file_name")String file_name,
								
									HttpServletRequest request) throws IOException{
		
		ModelAndView mav = new ModelAndView();
		System.out.println("fileContent에 들어온 file_name값= "+file_name);
	   
		
	    String filename =file_name;  //getAttribute는 객채로 들어옴 , requestParamter는 문자로만

	    ViewerConfig config = new ViewerConfig();
	    config.setStoragePath(Utils.getProjectProperty("storage.path"));	
	    	
	    System.out.println("if문 안쪽 들어옴");
		System.out.println("fileContent_d쪽에 들어온 값= "+filename);
		
		int pageNumber = 1;
	   	if (filename.substring(filename.indexOf(".")).equals(".java")) {
			FileInputStream fis = null;
			FileOutputStream fos = null;

			try {
				
				fis = new FileInputStream(config.getStoragePath()+"/"+filename);
				String file1 = filename.substring(0, filename.indexOf("."));
				fos = new FileOutputStream(config.getStoragePath()+"/"+file1+".txt");
				
				byte[] buffer = new byte[1024];
				int readcount = 0;

				while ((readcount = fis.read(buffer)) != -1) {

					fos.write(buffer, 0, readcount); 

				}
				filename=file1+".txt";
			} catch (Exception e) {

				e.printStackTrace();

			} finally {

				fis.close();
				fos.close();

			}
		
		}
		
		if (request.getParameterMap().containsKey("page")) {
			pageNumber = Integer.valueOf(request.getParameter("page"));
		}
		if (request.getParameterMap().containsKey("filename")) {
			filename = request.getParameter("filename");
		}

		Document doc = new Document();

		
		
		
		doc.setFilename(filename);
		doc.setPageNumber(pageNumber);
		
	//	String a = new String("한글".getBytes("EUC-KR"),"UTF-8");
	//	System.out.println(doc.getHtmlContent());
	//	
		//Decoder dd = Base64.getDecoder();
		
		//byte[] resultbyte = dd.decode(doc.getHtmlContent());
		
		
		
		mav.addObject("doc_html",doc.getHtmlContent());
		mav.addObject("filename2",file_name);
		mav.setViewName("file/fileContent_d");
		return mav;
		
	}
	
	

	/** 파일 - 파일 등록 페이지 이동 */
	@RequestMapping(value="fileUploadForm.do",  method=RequestMethod.GET)
	public ModelAndView fileUpLoadForm(@RequestParam("work_idx")int work_idx,
									   @RequestParam("project_idx")int project_idx){
		//System.out.println("프로젝트 컨텐트 폼에서 넘어온 idx="+project_idx);
		//System.out.println("업무 idx:"+work_idx);
		ModelAndView mav = new ModelAndView();
		
		
		
		mav.addObject("project_idx",project_idx);
		mav.addObject("work_idx",work_idx);
		mav.setViewName("file/fileUploadForm");
		return mav;
	}

	/** 파일 - 파일 등록 
	 * @throws UnsupportedEncodingException */
	@RequestMapping(value="fileAdd.do",  method=RequestMethod.POST)
	public ModelAndView fileAdd(HttpServletRequest req,HttpServletResponse response,
								@RequestParam("work_idx")int work_idx,
								@RequestParam("project_idx")int project_idx) throws UnsupportedEncodingException{
		
		MultipartHttpServletRequest multipartRequest =  (MultipartHttpServletRequest)req;
		multipartRequest.setCharacterEncoding("utf-8");
		HttpSession session=req.getSession();
		int member_idx=(Integer) session.getAttribute("s_member_idx"); //멤버 idx
		//int project_idx=16;   //프로젝트 idx 가져오기, 임시
		session.setAttribute("project_idx", project_idx);
		//System.out.println("파일등록 부분에서 유저id:"+session.getAttribute("s_member_idx"));
		//System.out.println("fileController쪽으로 넘어온 project_idx="+project_idx);
		//System.out.println("work_idx:"+work_idx);
		
		   
	       
		    ViewerConfig config = new ViewerConfig();
		    config.setStoragePath(Utils.getProjectProperty("storage.path"));
	   //     System.out.println( config.getStoragePath());
		
		List<MultipartFile> files = multipartRequest.getFiles("file_upload");
		
		int result=0;
		String msg="";
		//파일이름,파일사이즈,파일경로
		for(int i=0; i<files.size(); i++){
			String file_name=files.get(i).getOriginalFilename();
			String file_size=Long.toString(files.get(i).getSize());
							  
			String file_path=config.getStoragePath()+"/"+file_name;
			FileDTO fdto=new FileDTO(project_idx, work_idx, member_idx, file_name, file_size, file_path);
			result=fdao.addFile(fdto);
			copyInto(member_idx, files.get(i));  //파일 복사
		}
		if(result>0){
			msg="파일 등록 완료";
		}else{
			msg="파일 등록 실패";
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
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
	@RequestMapping(value="fileDel.do",  method=RequestMethod.GET)
	public ModelAndView fileDel(@RequestParam("file_idx")int file_idx,
								@RequestParam("file_name")String file_name){
		//System.out.println("file_name="+file_name);
		//System.out.println("컨트롤러 쪽"+file_idx);
		int result=fdao.delFile(file_idx); //db 파일 정보 데이터 삭제
		
		 ViewerConfig config = new ViewerConfig();
		 config.setStoragePath(Utils.getProjectProperty("storage.path"));
		    // "C:/Users/abm79/git/tpm_project/tpm_project/src/main/webapp/WEB-INF/view/file/upload/"+file_name
		File f = new File(config.getStoragePath()+"/"+file_name);
		
		f.delete();  //파일경로에 있는 실제파일 삭제
	
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
	/** 파일리스트 다운로드*/
	
	@RequestMapping(value="fileDown.do", method=RequestMethod.GET)
	public ModelAndView fileDown(@RequestParam("file_name") String filename){
		//System.out.println("filename == " + filename);
		 ViewerConfig config = new ViewerConfig();
		 config.setStoragePath(Utils.getProjectProperty("storage.path"));
		File f = new File(config.getStoragePath()+"/"+filename);
		
		ModelAndView mav = new ModelAndView("tpmDown","downloadFile", f);
		
		return mav;
	}
	
	
	/**복사관련 사용자정의 메서드*/
	private void copyInto(int s_member_idx, MultipartFile file_upload){
		//System.out.println("작성자:"+s_member_idx);
		//System.out.println("파일명:"+file_upload.getOriginalFilename());		
		try {
			byte bytes[]=file_upload.getBytes();
			
			ViewerConfig config = new ViewerConfig();  //자동경로
			config.setStoragePath(Utils.getProjectProperty("storage.path"));
		
			
			String decoded_result = new String(file_upload.getBytes(), "UTF-8"); 

			System.out.println(decoded_result);
			File outFile=new File(config.getStoragePath()+"/"+file_upload.getOriginalFilename());
			
			FileOutputStream fos=new FileOutputStream(outFile);
			//복사 
			
			fos.write(bytes);
			fos.close();
			
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
}
