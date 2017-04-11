<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String msg=(String)request.getAttribute("msg");
if(msg==null||msg.equals("")){
	msg="프로젝트 생성 성공!";
}
%>
<%=msg%>