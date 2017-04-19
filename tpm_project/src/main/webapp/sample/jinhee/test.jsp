<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<style>
	#ViewTimer{
		color:red;
	}
</style>
<script>

var SetTime = 300;		// 최초 설정 시간(기본 : 초)

function msg_time() {	// 1초씩 카운트
	
	function twoDigits(n) {
	    return (n <= 9 ? "0" + n : n);
	  }
	
	time = Math.floor(SetTime / 60) + ":" + twoDigits(SetTime % 60);	// 남은 시간 계산
	
	var msg = time;
	
	document.all.ViewTimer.innerHTML = msg;		// div 영역에 보여줌 
			
	SetTime--;					// 1초씩 감소
	
	if (SetTime < 0) {			// 시간이 종료 되었으면..
		
		clearInterval(tid);		// 타이머 해제
		alert("Time Out");
	}
	
}

window.onload = function TimerStart(){ tid=setInterval('msg_time()',1000) };
</script>
</head>
<body>

<div id="ViewTimer"></div>

</body>
</html>