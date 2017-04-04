<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<link type="text/css" href="css/jquery-ui.min.css" rel="stylesheet">
<script type="text/javascript">
var p1=document.getElementById('btnwork');
var p2=document.getElementById('btnwork2');
function next(){
	p1.style.display='none';
	p2.style.display='block';
}
function before(){
	p1.style.display='block';
	p2.style.display='none';
}
</script>
</head>
<body>

<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal">x</button>
	<h4 class="modal-title">업무 추가</h4>
</div>

<div class="modal-body">
	<form name="newWork" action="workAdd.do" method="post">
	<div id="btnwork">
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
			<td><button type="button" class="btn btn-next" id="btn-worknext" onclick="next()">다음</button></td>
		</tr>
	</table>
	</div>
	<div id="btnwork2" style="display:none;">
		<button type="button" class="btn btn-next" id="btn-workbefore" onclick="before()">이전</button>
		<input type="submit" class="btn" value="완료">
	</div>
	</form>
</div>
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