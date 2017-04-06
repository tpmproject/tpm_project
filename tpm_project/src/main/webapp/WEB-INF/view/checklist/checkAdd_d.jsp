<%@page import="tpm.checklist.model.ChecklistDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ChecklistDTO chdto=(ChecklistDTO)request.getAttribute("checklist");

	if(chdto!=null){
	%>
	<%="checklist{checklist_idx:"+chdto.getChecklist_idx()+","+chdto.getChecklist_idx()+"}"%>	
	<%	
	}
%>