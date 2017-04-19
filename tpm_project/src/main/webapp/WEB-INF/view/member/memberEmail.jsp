<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="js/httpRequest.js"></script>
<title>Insert title here</title>
	<style>
		#timer{
			color:red;
		}
	</style>
	<script>
		window.alert('${result}');
		
		function reSend(){
			var email = document.emailCheck.email.value;
			//window.alert(email);
			location.href='memberSendEmail.do?email='+email;
		}
	</script>
</head>
	<script>
		var SetTime = 300;		// 최초 설정 시간(기본 : 초)
	
		function msg_time() {
		
		function twoDigits(n) {
		    return (n <= 9 ? "0" + n : n);
		  }
		
		time = Math.floor(SetTime / 60) + ":" + twoDigits(SetTime % 60);
		
		var msg = time;
		
		document.all.timer.innerHTML = msg; 
				
		SetTime--;
		
		if (SetTime < 0) {
			clearInterval(tid);
			alert("Time Out");
			reSend();
			}
		}
	
		window.onload = function TimerStart(){ tid=setInterval('msg_time()',1000) };
	</script>
<body>
	<div class="container">
       	<form role="form" name="emailCheck" action="memberEmailCheck.do" method="post">
            <input type="text" name="random_number" value="${random}">
			<input type="hidden" name="email" value="${email}">
           <br>
           	<div class="form-group">
               <div class="input-group">
               	<input type="text" class="form-control" name="user_number" maxlength="6" placeholder="인증번호를 입력해주세요" size="8">
                 	<span class="input-group-btn">
                   	<button class="btn btn-success" type="submit"> 인증하기 </button>
                   	<button class="btn btn-danger" type="button" onclick="reSend()"> 재발송하기</button>
                 	</span>
               </div>
               <div id="timer"></div>
         	</div>
        </form>
	</div>
	
</body>
</html>