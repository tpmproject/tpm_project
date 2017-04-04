<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<link type="text/css" href="css/jquery-ui.min.css" rel="stylesheet">
</head>
<body>
<form name="fm" action="test33.jsp">
<table>
	<tr>
		<td>업무명</td>
		<td><input type="text" name="work_title"></td>
	</tr>
	<tr>
		<td colspan="2">기한</td>
	</tr>
	<tr>
		<td><input type="text" id="calendar" name="work_start" rel="stylesheet"/></td>
		<td>~<input type="text" id="calendar2" name="work_end" rel="stylesheet"/></td>
	</tr>
	<tr>
		<td><input type="checkbox" name="work_confirm" value="on">결재여부</td>
		<td><input type="submit" value="다음"></td>
	</tr>
</table>
</form>
</body>
<script>
$("#calendar").datepicker({
	changeMonth:true,
	changeYear:true,
	showButtonPanel:true,
	dateFormat:"yy-mm-dd"
});
$("#calendar2").datepicker({
	changeMonth:true,
	changeYear:true,
	showButtonPanel:true,
	dateFormat:"yy-mm-dd"
});
</script>
</html>