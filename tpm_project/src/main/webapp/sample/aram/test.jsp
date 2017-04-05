<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>TPM</title>
<script type="text/javascript" src="/tpm_project/js/jquery-3.2.0.js"></script>
<script>
function show(){
	$(mback).show('150');
	$(testm).show('150');
	
}

function closem(){
	$(mback).hide('100');
	$(testm).hide('100');
}
</script>
<style>
#mback{
	position:absolute;
	top:-10%;
	left:-10%;
	width:110%;
	height:110%;
	background: gray;
	opacity: 0.3;
	display: none;
}
#testm{
	display: none;
	background: white;
	position: fixed;
	top:30%;
	left:30%;
	border: solid 10px white;
	border-radius: 15px;
	
}
</style>
</head>
<body>

<form action="/tpm_project/projectContent.do">
프로젝트 idx:<input type="text" name="project_idx">
</form>
<input type="button" value="modal" onclick="show()">

<div id="mback" onclick="closem()"></div>
	<div id="testm">
		<input type="text">
		<input type="button" value="닫기" onclick="closem()">
		<br><br><br><br><br>
	</div>



</body>
</html>