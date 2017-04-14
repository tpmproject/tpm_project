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
	
		<c:redirect url="projectList.do"></c:redirect>
		
		${sessionScope.s_member_name }님 로그인중...|<a href='memberLogOut.do'>로그아웃</a>
	</c:if>
	
<a href="main.do">메인화면</a><br>
<a href="myFriendList.do">친구</a><br>
<a href="calendarList.do">켈린더</a><br>
<a href="chatList.do">채팅</a><br>
<a href="javascript:dateTest()">날짜테스트</a><br>
<a href="fileList.do">파일 리스트</a><br>
<a href="fileUploadForm.do">파일 업로드</a><br>
<a href="popover.do">팝오버 테스트</a><br>
<a href="dtotest.do">DTO안 DTO 테스트</a><br>

<a href="memberInfo.do">개인 정보</a><br>

<a href="mappingtest.c">다중 메핑 테스트</a><br>
<a href="jsontest.do">제이슨에 대하여..</a><br>
<a href="ajaxtest.do">아작스에 대하여..</a><br>
<a href="sockettest.do">소켓에 대하여..</a><br>
<a href="scrollbar.do">스크롤 테스트..</a><br>

<a href="studyList.do">스터디 참고용</a>


<form action="/tpm_project/projectContent.do">
개별 프로젝트 들어가기!!<br> 
프로젝트 idx:<input type="text" name="project_idx">
</form>
<form action="/tpm_project/projectEvaluation.do">
test!!<br> 
<input type="hidden" name="member_idx" value="${sessionScope.s_member_idx}">
test idx:<input type="text" name="project_idx">
</form>

</body>
</html>