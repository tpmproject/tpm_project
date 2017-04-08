<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>에코</title>
<script type="text/javascript" src="/tpm_project/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/tpm_project/js/sockjs.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#sendBtn').click(function() { sendMessage(); });
	});
	
	var sock;
	function sendMessage() {
		sock = new SockJS("http://localhost:9090/tpm_project/echo-sockjs.do");
		sock.onmessage = onMessage;
		sock.onclose = onClose;
		sock.onopen = function() {
			sock.send( $("#message").val() );
		};
	}
	function onMessage(evt) {
		var data = evt.data;
		alert("서버에서 데이터 받음: " + data);
		sock.close();
	}
	function onClose(evt) {
		alert("연결 끊김");
	}
</script>
</head>
<body>
    <input type="text" id="message">
    <input type="button" id="sendBtn" value="전송">
</body>
</html>