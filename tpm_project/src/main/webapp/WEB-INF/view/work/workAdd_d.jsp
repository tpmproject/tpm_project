<%@page import="java.sql.Timestamp"%>
<%@page import="tpm.work.model.WorkDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String msg=(String)request.getAttribute("msg");

if(msg==null||msg.equals("error")||msg.equals("")){
	out.print("{w:{work_idx:0}}");
}else{
	WorkDTO dto=(WorkDTO)request.getAttribute("workDTO");
	int idx=dto.getWork_idx();
	String title=dto.getWork_title();
	Timestamp start=dto.getWork_start();
	Timestamp end=dto.getWork_end();
	int confirm=dto.getWork_confirm();
	int cidx=dto.getCategory_idx();
	
	out.print("{work:{work_idx:"+idx+",work_title:'"+title+"',work_start:'"+start+"',work_end:'"+end+"',work_confirm:'"+confirm+"',category_idx:'"+cidx+"'}}");
}
%>
