<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="email" action="memberEmailCheck.do" method="post">
		<table>
			<tr> 
				<th colspan="2"> 이메일 인증하기 </th>
			</tr>
			<tr>
				<td> 이메일 주소: </td>
				<td> <input type="text" name="to"></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align:right;"> <input type="submit" value="인증하기"> </td>
			</tr>
		</table>
	</form>
</body>
</html>