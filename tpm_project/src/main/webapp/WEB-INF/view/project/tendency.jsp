<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>TPM</title>
</head>
<body>


<script>
function showTen(member_idx){
	var testt=$('#work_member'+member_idx).position();
	$('#tendency_pop').css('top',testt.top+20+'px');
	$('#tendency_pop').css('left',testt.left+'px');
	$('#tendency_pop').fadeIn();
	
}
function hideTen(){
	$('#tendency_pop').fadeOut();
}
</script>
<style>
#tendency_pop{
	background: green;
	position:fixed;
	display: none;
	width:400px;
	height: 400px;
}
</style>

<div id="tendency_pop" >우왕굳</div>

</body>
</html>