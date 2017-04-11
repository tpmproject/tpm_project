<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//add category

	try{
		String msg = (String) request.getAttribute("msg");
		if (msg==null||msg.equals("error")||msg.equals("")) {
			
		} else {
			%>
			<div class="category">
			여기에 추가되는 카테고리 쓰면 됨 ㅎ
			</div>
			<%
		}
	
	}catch(Exception e2){}

//update,delete category
	try{
		int msg2 = (Integer)request.getAttribute("upd");
		if (msg2 ==0) {
			
		} else {
			out.print(msg2);
		}
	}catch(Exception e){}
%>