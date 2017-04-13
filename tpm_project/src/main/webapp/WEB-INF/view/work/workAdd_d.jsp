<%@page import="tpm.work.model.WorkDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String msg=(String)request.getAttribute("msg");
WorkDTO dto = new WorkDTO();

if(msg==null){
	dto=(WorkDTO)request.getAttribute("dto");
}else if(msg.equals("error")){
	out.print("{p:{project_idx:0}}");
	return;
}
%>