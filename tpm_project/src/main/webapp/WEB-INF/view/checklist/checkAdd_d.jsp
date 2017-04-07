<%@page import="tpm.checklist.model.ChecklistDTO"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ChecklistDTO chdto=(ChecklistDTO)request.getAttribute("checklist");

	if(chdto!=null){
	%>
	


	
{
	checklist:{
	checklist_idx:<%=chdto.getChecklist_idx()%>,
	work_idx:<%=chdto.getWork_idx()%>,
	checklist_content:'<%=chdto.getChecklist_content()%>',
	checklist_state:<%=chdto.getChecklist_state()%>
	}
}

	
	<%	
	}
%>