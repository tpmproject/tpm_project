<%@page import="tpm.project.model.ProjectDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String msg=(String)request.getAttribute("msg");

ProjectDTO dto=new ProjectDTO();
String member_id="";
if(msg==null){
	dto=(ProjectDTO)request.getAttribute("pdto");
	member_id=(String)request.getAttribute("member_id");
}else if(msg.equals("error")){
	out.print("{pson:{project_idx:0}}");
	return;
}
%>
{
	pson:{
		project_idx:<%=dto.getProject_idx()%>,
		project_name:'<%=dto.getProject_name()%>',
		project_content:'<%=dto.getProject_content()%>',
		project_state:<%=dto.getProject_state()%>,
		project_level:<%=dto.getProject_level()%>,
		member_id:'<%=member_id%>'
	}
}