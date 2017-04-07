<%@page import="tpm.member.model.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 결과 페이지에서 수작업을 통하여 JSON 형식의 데이터를 구축하기 -->
<!-- 방법 1. -->
<%
	ArrayList<MemberDTO> arry_mdto2 = (ArrayList) request.getAttribute("arry_mdto");
%>

{
	"members" : [
<%
		for(int i = 0 ; i < arry_mdto2.size() ; i++){
%>
			{"member_idx":<%=arry_mdto2.get(i).getMember_idx()%>,"member_id":"<%=arry_mdto2.get(i).getMember_id()%>","member_name":"<%=arry_mdto2.get(i).getMember_name()%>"}
<%
			if(i != arry_mdto2.size()-1){
%>
			,
<%				
			}
		}
%>
	]
}
<hr>
<hr>
<!-- 방법 2. -->
{
	"members" : [
		<c:if test="${!empty arry_mdto}">
			<c:forEach var="i" begin="0" end="${arry_mdto.size() - 1}" step="1">
				{"member_idx":${arry_mdto.get(i).member_idx},"member_id":"${arry_mdto.get(i).member_id}","member_name":"${arry_mdto.get(i).member_name}"}
				<c:if test="${i != arry_mdto.size() - 1}">
				,
				</c:if>
			</c:forEach>
		</c:if>
	]
	
}



