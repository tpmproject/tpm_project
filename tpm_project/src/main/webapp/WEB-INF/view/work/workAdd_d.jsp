<%@page import="tpm.member.model.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="tpm.work.model.WorkMemberDTO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="tpm.work.model.WorkDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String msg=(String)request.getAttribute("msg");

if(msg!=null && msg.equals("error")){
	out.print("{work:{work_idx:0}}");
}else{
	WorkDTO dto=(WorkDTO)request.getAttribute("wdto");
	System.out.print(dto);
	int idx=dto.getWork_idx();
	String title=dto.getWork_title();
	Timestamp start=dto.getWork_start();
	Timestamp end=dto.getWork_end();
	int confirm=dto.getWork_confirm();
	int cidx=dto.getCategory_idx();
	int wstate=dto.getWork_state();
	String member="";

	out.print("{work:{work_idx:"+idx+",work_title:'"+title+"',work_start:'"+start+"',work_end:'"+end+"',work_confirm:'"+confirm+"',category_idx:'"+cidx+"',work_state:'"+wstate+"',w_member:'"+member+"'}}");
}
%>
<%
 try{
	 int msg2=(Integer)request.getAttribute("widx");
	 if(msg2==0){
		
	 } else{
		 out.print(msg2);
	 }
 }catch(Exception e){
 }
 
 %>