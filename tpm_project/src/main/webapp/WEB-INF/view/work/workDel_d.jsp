<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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