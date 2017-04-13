<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#chatArea {
	width: 200px; height: 100px; overflow-y: auto; border: 1px solid black;
}
</style>
<script>
function showChatContent(cpCode, cpValue){
	
}

</script>
</head>
<body>
<fieldset>
	<legend>프로젝트 리스트</legend>
	<ul>
		<c:forEach var="pdto" items="${arry_pdto}">
			<li><a href="javascript:showChatContent('P','${pdto.project_idx}')">${pdto.project_name},${pdto.project_idx}</a></li>
		</c:forEach>
	</ul>
</fieldset>
<fieldset>
	<legend>채널 리스트</legend>
	<ul>
		<c:forEach var="chdto" items="${arry_chdto}">
			<li><a href="javascript:showChatContent('C','${chdto.channel_idx}')">${chdto.channel_name},${chdto.channel_idx}</a></li>
		</c:forEach>
	</ul>
</fieldset>
<h1>대화 영역</h1>
<div id="chatArea">
	<div id="chatMessageArea"></div>
</div>
<br/>
<input type="text" id="message">
<input type="button" id="sendBtn" value="전송">
</body>
</html>
