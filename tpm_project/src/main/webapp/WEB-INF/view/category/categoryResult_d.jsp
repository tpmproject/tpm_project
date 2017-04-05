<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//add category

	String msg = (String) request.getAttribute("msg");
	if (msg.equals("error")) {
		msg = "";
	} else {
%>
<div class="category">
여기에 추가되는 카테고리 쓰면 됨 ㅎ
</div>
<%
	}
%>
