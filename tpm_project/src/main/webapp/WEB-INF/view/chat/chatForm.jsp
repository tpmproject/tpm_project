<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery 2.1.3 -->
<script src="/tpm_project/sample/cho/main/plugins/jQuery/jQuery-2.1.3.min.js"></script>
<style>
#chatArea {
	width: 200px; height: 100px; overflow-y: auto; border: 1px solid black;
}
</style>
<script>
function showChatContent(cpCode, cpValue){
	$.ajax({
		url : 'chatList.do',
		type : 'post',
		data : { chat_cp_code : cpCode,
				 chat_cp_value : cpValue },
		dataType : 'json', // 제이슨 형식으로 넘어온다.
		success : function(json) {
			//window.alert(JSON.stringify(json));
			$('#chatMessageArea').va
		}
	});
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

	<div id="chatMessageArea">
		<c:forEach var="ctdto" items="${arry_ctdto}">
			${ctdto.chat_content}--${ctdto.chat_date}<br>
		</c:forEach>
	</div>
</div>
<br/>
<form action="chatAdd.do" method="post">
	<input type="text" id="message">
	<input type="submit" id="sendBtn" value="전송">
</form>
</body>
</html>
