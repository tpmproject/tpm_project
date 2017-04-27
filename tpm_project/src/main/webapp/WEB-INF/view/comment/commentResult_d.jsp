<%@page import="tpm.comment.model.CommentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

${msg}
<%-- <%
try{
	String msg=(String) request.getAttribute("msg");
	if(msg==null||msg.equals("error")||msg.equals("")){
	}else{
		CommentDTO dto=(CommentDTO)request.getAttribute("commentDTO");
		int idx=dto.getComment_idx();
		String content=dto.getComment_content();
		
		out.print("{comment:{comment_idx:"+idx+",comment_content:'"+content+"'}}");
	}
}catch(Exception e2){}
%> --%>