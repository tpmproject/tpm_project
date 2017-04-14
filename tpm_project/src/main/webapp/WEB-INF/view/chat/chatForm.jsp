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
	width: 1000px; height: 500px; overflow-y: auto; border: 1px solid black;
}
#message {
	width: 1000px; height: 100px;
}
</style>
<script>
var currCpCode;
var currCpValue;

function showChatContent(cpCode, cpValue){
	
	currCpCode = cpCode;
	currCpValue = cpValue;
	
	$.ajax({
		url : 'chatList.do',
		type : 'post',
		data : { chat_cp_code : cpCode,
				 chat_cp_value : cpValue },
		dataType : 'json', // 제이슨 형식으로 넘어온다.
		success : function(json) {
			window.alert(JSON.stringify(json));
			var msg = '';
			for(var i = 0 ; i < json.length ; i++){
				msg += '<span>' + json[i].mdto.member_name + ' : ' + json[i].chat_content + ' -- ' + json[i].chat_date +'</span><br>';
			}
			$('#chatMessageArea').html(msg);
		}
	});
}

function InsertChatContent() {
	var currInsertChatContent = $('#chat_content').val();

	$.ajax({
		url : 'chatAdd.do',
		type : 'post',
		data : { 
				 chat_cp_code : currCpCode,
				 chat_cp_value : currCpValue,
				 chat_content : currInsertChatContent
		},
		dataType : 'json',
		success : function(json) {
			// 입력 성공시..
			if(json == true){
				// 소켓을 통해 메세지를 전달한다.
			}
		}
	});
}

</script>
</head>
<c:choose>
	<c:when test="${!empty arry_pdto}">
		<body onload="showChatContent('P','${arry_pdto.get(0).project_idx}')">
	</c:when>
	<c:otherwise>
		<c:choose>
			<c:when test="${!empty arry_chdto}">
				<body onload="showChatContent('C','${arry_chdto.get(0).channel_idx}')">
			</c:when>
			<c:otherwise>
				<body>
			</c:otherwise>
		</c:choose>
	</c:otherwise>
</c:choose>
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
		
	</div>
</div>
<br/>
<input type="text" id="chat_content">
<input type="button" value="전송" onclick="InsertChatContent()">
</body>
</html>
