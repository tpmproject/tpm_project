<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<script>
		window.alert('${result}');
	</script>
<body>
	<form name="EmailCheck" action="memberEmailCheck.do" method="post">
		<input type="text" name="random_number" value="${random}">
		<fieldset>
			<legend>인증번호 입력</legend>
			<input type="text" name="user_number" maxlength="6">
			<input type="submit" value="인증하기">
		</fieldset>
	</form>
</body>
</html>