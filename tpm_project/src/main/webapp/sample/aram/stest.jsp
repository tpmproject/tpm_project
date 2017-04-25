<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/tpm_project/js/sockjs.min.js"></script>
<script>
var project_idx=21;
var wsocket;

window.onload=function(){    
    //페이지 시작시 소켓 연결
    connect();
}

function connect() {
	wsocket = new SockJS(
			"http://localhost:9090/tpm_project/project-sockjs.do?project_idx="+project_idx);
	wsocket.onmessage = onMessage; // 서버에서 메세지가 푸시될때 처리
	wsocket.onclose = onClose;
}
function onClose(){
	var temp=window.confirm('연결이 끊겼습니다.\n다시 연결하시겠습니까?');
	if(temp){
		location.reload();
	}else{
		location.href="/tpm_project/projectList.do";
	}
}
function disconnect() {
	wsocket.close();
}
function onMessage(evt) {
	var data = evt.data;
	
	document.getElementById('stest').innerHTML=data;
	
}

function chatSend() {
	var msg=document.socketTest.testInput.value;
	wsocket.send(msg);
}
</script>
</head>
<body>
<div id="stest"></div>
<form name="socketTest" action="javascript:chatSend()">
<input name="testInput" type="text">
<input type="button" value="close Test" onclick="onClose()">
</form>
</body>
</html>