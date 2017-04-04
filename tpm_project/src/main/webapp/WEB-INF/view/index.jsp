<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
인덱스입.

	<c:if test="${empty sessionScope.sid}">
		<a href="memberLogin.do">로그인</a>
	</c:if>
	<c:if test="${!empty sessionScope.sid}">
		${sessionScope.sid }님 로그인중...|<a href='memberLogOut.do'>로그아웃</a>
	</c:if>
	
<a href="main.do">메인화면</a>
</body>
</html>