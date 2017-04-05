<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>TPM</title>
<script>

var b=document.getElementById('mback');
var m=document.getElementById('testm');

function show(){
	b.style.display="block";
	m.style.display="inline-block";
	
}
function close(){
	
	b.style.display='none';
	m.style.display='none';
	
}
</script>
<style>
#mback{
	width:1000px;
	height:1000px;
	background: gray;
	opacity: 0.3;
}
#testm{
	
	background: green;
	position: fixed;
	top:30%;
	left:30%;
}
</style>
</head>
<body>

<form action="/tpm_project/projectContent.do">
프로젝트 idx:<input type="text" name="project_idx">
</form>
<input type="button" value="modal" onclick="show()">
<div id="mback" onclick="close()" style="display: none;"></div>
	<div id="testm" style="display: none;">
		<input type="text">
		<input type="button" value="닫기" onclick="close()">
		<br><br><br><br><br>
	</div>



</body>
</html>