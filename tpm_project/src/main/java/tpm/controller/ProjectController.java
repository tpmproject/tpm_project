package tpm.controller;

import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired	;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import tpm.project.model.ProjectDAO;
import tpm.project.model.ProjectDTO;
import tpm.tendency.model.TendencyDAO;
import tpm.tendency.model.TendencyDTO;
import tpm.work.model.WorkDAO;
import tpm.work.model.WorkDTO;
import tpm.category.model.CategoryDTO;
import tpm.checklist.model.ChecklistDTO;
import tpm.member.model.*;
import tpm.myfriend.model.*;
import tpm.project.model.*;

@Controller
public class ProjectController {

	
	@Autowired
	private ProjectDAO projectDAO;
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private MyFriendDAO myFriendDAO;
	//// 프로젝트 ////
	@Autowired
	private WorkDAO workDAO;
	
	@Autowired
	private TendencyDAO tendencyDAO;
	
	
	
	// 프로젝트
	/** 프로젝트 - 프로젝트 리스트 페이지 이동 */
	@RequestMapping(value="projectList.do",  method=RequestMethod.GET)
	public ModelAndView projectListForm(HttpServletRequest req){
		
		HttpSession session=req.getSession();
		int member_idx=(Integer)session.getAttribute("s_member_idx");
		
		ArrayList<ProjectDTO> plist= projectDAO.projectAllList(member_idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("plist",plist);
		
		mav.setViewName("project/projectListForm");
		return mav;
	}
	
	/** 프로젝트 - 해당 프로젝트 내용 페이지 이동 ( 업무들이 보여지는 페이지 ) */
	@RequestMapping(value="projectContent.do",  method=RequestMethod.GET)
	public ModelAndView projectContentForm(ProjectDTO dto){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("project/projectContentForm");
		ProjectDTO pdto=projectDAO.projectSearch(dto);
		ArrayList<MemberDTO> marr=projectDAO.projectWorkMember(dto);
		mav.addObject("pdto", pdto);
		mav.addObject("marr", marr);
		return mav;
	}
	
	/** 프로젝트 - 프로젝트 생성 (권한 부여 포함) */
	@RequestMapping(value="projectAdd.do", method=RequestMethod.GET)
	public ModelAndView projectAdd(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("project/projectListForm");
		return mav;
	}
	/** 프로젝트-프로젝트생성 데이터*/
	@RequestMapping(value="projectAdd.do", method=RequestMethod.POST)
	public ModelAndView projectInsert(ProjectDTO dto,String[] project_member,String[] level){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("project/projectAdd_d");
		
		//프로젝트 생성 후 project_idx를 반환
		int project_idx= projectDAO.projectInsert(dto);
		dto.setProject_idx(project_idx);
		
		//생성된 프로젝트에 멤버 추가
		if(project_idx>0){
			for(int i=0;i<project_member.length;i++){
				int pm_idx=Integer.parseInt(project_member[i]);
				int pm_level=Integer.parseInt(level[i]);
				
				ProjectMemberDTO pmdto=new ProjectMemberDTO(project_idx, pm_idx, pm_level);
				
				projectDAO.projectMemberInsert(pmdto);
			}
			
			mav.addObject("pdto", dto);
		}else{
			String msg="error";
			mav.addObject("msg", msg);
		}
		
		return mav;
	}
	
	/**등록된친구 리스트*/
	
	
	/**프로젝트-프로젝트 생성-멤버검색*/
	@RequestMapping(value="projectMemberAdd.do", method=RequestMethod.POST)
	public ModelAndView projectMemberAdd(MemberDTO dto){
		
		MyFriendDTO mdto=new MyFriendDTO();
		mdto.setMember_idx(dto.getMember_idx());
		
		ArrayList<MemberDTO> arry_mdto=memberDAO.memberAddSearch(dto);
	    ModelAndView mav = new ModelAndView();
		mav.addObject("arry_mdto", arry_mdto);

		mav.setViewName("project/projectMemberAdd_d");
		return mav;
	}
	
	/**프로젝트-프로젝트 생성-친구리스트*/
	@RequestMapping(value="projectFriendList.do", method=RequestMethod.POST)
	public ModelAndView projectFriendList(MyFriendDTO dto){
		
		ArrayList<MemberDTO> arry_mdto = myFriendDAO.getFriendMemberInfoList(dto);
		
	    ModelAndView mav = new ModelAndView();

		mav.addObject("arry_mdto",arry_mdto);
		mav.setViewName("project/projectMemberAdd_d");
		return mav;
	}
	
	/**프로젝트-프로젝트 수정-친구리스트*/
	@RequestMapping(value="projectFriendList.do", method=RequestMethod.GET)
	public ModelAndView projectUpdateFriendList(MyFriendDTO dto,int project_idx){

	    ModelAndView mav = new ModelAndView();
		mav.setViewName("project/projectMemberAdd_d");
		
		ProjectMemberDTO pmdto=new ProjectMemberDTO(project_idx, dto.getMember_idx(), 0);
		ArrayList<MemberDTO> mdtos=projectDAO.projectUpdateFriend(pmdto);
		
		mav.addObject("arry_mdto", mdtos);
		
		return mav;
	}
	
	/** 프로젝트 - 프로젝트멤버 추가 */
	@RequestMapping(value="projectMemberInsert.do", method=RequestMethod.POST)
	public ModelAndView ProjectMemberInsert(ProjectMemberDTO dto){
		
		
		int count = projectDAO.projectMemberInsert(dto);
		String result = count > 0 ? "true" : "false";
		System.out.println(result);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("myfriend/projectMemberInsert_d");
		mav.addObject("result", result);
		return mav;
	}
	
	/** 프로젝트 - 프로젝트 수정 */
	@RequestMapping(value="projectUpdate.do",  method=RequestMethod.POST)
	public ModelAndView projectUpdate(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("project/projectListForm");
		return mav;
	}
	
	/** 프로젝트 - 프로젝트 삭제 */
	@RequestMapping(value="projectDel.do",  method=RequestMethod.GET)
	public ModelAndView projectDel(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("project/projectListForm");
		return mav;
	}
	
	/** 프로젝트 - 프로젝트 평가 페이지 이동 */
	@RequestMapping(value="projectEvaluation.do",  method=RequestMethod.GET)
	public ModelAndView projectEvaluationForm(ProjectDTO dto, ProjectMemberDTO bdto){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("project/projectEvaluationForm");
		ProjectDTO pdto=projectDAO.projectSearch(dto);
		ArrayList<MemberDTO> arr=tendencyDAO.tendencyList(bdto);
		mav.addObject("pdto",pdto);
		mav.addObject("arr",arr);
		return mav;
	}
	
	/**프로젝트 멤버 평가*/
	@RequestMapping(value="projectEvaluation.do", method=RequestMethod.POST)
	public ModelAndView addTendency(TendencyDTO dto){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("project/projectEvaluation_d");
		
		mav.addObject("tendencyDTO",dto);
		int result=tendencyDAO.addTendency(dto);
		
		int msg=dto.getMember_idx();
		if(result<=0){
			msg=0;
		}
		mav.addObject("msg",msg);
		return mav;
	}
	
	// 멤버
	/** 멤버 -  프로젝트 멤버 리스트 데이터 반환 */
	@RequestMapping(value="projectMemberList.do",  method=RequestMethod.GET)
	public ModelAndView projectMemberList(){

		ModelAndView mav = new ModelAndView();
		mav.setViewName("project/projectMemberList_d");
		return mav;
	}
	
}
