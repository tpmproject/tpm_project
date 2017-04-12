<%@page import="tpm.project.model.ProjectDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String msg=(String)request.getAttribute("msg");
ProjectDTO dto=new ProjectDTO();

if(msg==null){
	dto=(ProjectDTO)request.getAttribute("pdto");	
}else if(msg.equals("error")){
	out.print("{p:{project_idx:0}}");
	return;
}
%>
{
	p:{
		project_idx:<%=dto.getProject_idx()%>,
		project_name:'<%=dto.getProject_name()%>',
		project_content:'<%=dto.getProject_content()%>',
		project_state:<%=dto.getProject_state()%>
	}
}