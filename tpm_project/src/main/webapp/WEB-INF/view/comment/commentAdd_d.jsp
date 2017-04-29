<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="tpm.comment.model.CommentDTO"%>

<%
	CommentDTO cdto = (CommentDTO)request.getAttribute("comment");
	
	if(cdto!=null){
	%>
	
{
	comments :{
	comment_idx: <%= cdto.getComment_idx() %>,
	work_idx: <%= cdto.getWork_idx() %>,
	member_idx: <%= cdto.getMember_idx() %>,
	comment_content: <%= cdto.getComment_content() %>,
	comment_date: <%= cdto.getComment_date() %>
	}
}
	<%
	}
%>