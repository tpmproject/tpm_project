<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function check(){
		var email = document.email.to.value;
		window.open('memberSendEmail.do?email='+email, 'emailcheck','width=350, height=250');
	}
</script>
</head>
<body>
<!-- 인증번호 값 비교 판단 Controller부터 다시 -->
<!-- 인증 결과 값 판단으로 인증하기 / 인증완료 버튼 표시해주기 -->
	<form name="email" method="post">
		<table>
			<tr> 
				<th colspan="2"> 이메일 인증하기 </th>
			</tr>
			<tr>
				<td> 이메일 주소: </td>
				<td> <input type="text" name="to"></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align:right;"> <input type="button" value="인증하기" onclick="check()"> </td>
			</tr>
		</table>
	</form>
</body>
</html>