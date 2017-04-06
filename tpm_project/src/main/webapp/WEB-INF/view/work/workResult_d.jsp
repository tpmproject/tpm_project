<%@page import="tpm.member.model.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

ArrayList<MemberDTO> arr=(ArrayList)request.getAttribute("arr");

%>
{
	friends:[

<%
for(int i=0;i<arr.size();i++){
	MemberDTO mdto=arr.get(i);
%>
<%=
	"{name:'"+mdto.getMember_name()+"',img:'"+mdto.getMember_img()+"'}" 
%>
<%
	if(i!=arr.size()-1){
		
	}
}
%>
	]
}
