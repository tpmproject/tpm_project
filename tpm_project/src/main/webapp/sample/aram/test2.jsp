<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>TPM</title>
<script type="text/javascript" src="/tpm_project/js/jquery.js"></script>
<script src="/tpm_project/bootstrap/js/bootstrap.js"></script>
<script>
function test(){
	var testt=$('#ata').position();
	$('#poppop').css('top',testt.top+20+'px');
	$('#poppop').css('left',testt.left+'px');
	$('#poppop').fadeIn();
	
}
function testclose(){
	$('#poppop').fadeOut();
}
</script>
</head>
<body>
<br>
<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;<a id="ata" onmouseover="test()" onmouseout="testclose()">tes12312t</a>
<div id="poppop" style="background: green;position:fixed; display: none; width:400px; height: 400px;">우왕굳</div>
</body>
</html>