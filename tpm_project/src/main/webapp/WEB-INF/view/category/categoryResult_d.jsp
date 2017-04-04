<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//add category

String msg=(String)request.getAttribute("msg");
if(msg.equals("error")){
	msg="";
}
%>
<%=msg%>