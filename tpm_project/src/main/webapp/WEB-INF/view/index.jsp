<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function dateTest(){
	var date = new Date();
	var d = date.getDate(), m = date.getMonth(), y = date.getFullYear();
	
	window.alert(new Date(y, m, d - 5));
	window.alert(new Date("2017-04-03"));
}


</script>
</head>
<body>
인덱스입.

	<c:if test="${empty sessionScope.s_member_id}">
		<a href="memberLogin.do">로그인</a>
	</c:if>
	<c:if test="${!empty sessionScope.s_member_id}">
		${sessionScope.s_member_name }님 로그인중...|<a href='memberLogOut.do'>로그아웃</a>
	</c:if>
	
<a href="main.do">메인화면</a><br>
<a href="myFriendList.do">친구</a><br>
<a href="calendarList.do">켈린더</a><br>
<a href="javascript:dateTest()">날짜테스트</a><br>
</body>
</html>