<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:choose>
	<c:when test="${empty sessionScope.s_member_id}">
		<jsp:forward page="memberLogin.do"></jsp:forward>
	</c:when>
	<c:otherwise>
		<jsp:forward page="index.do"></jsp:forward>
	</c:otherwise>
</c:choose>
