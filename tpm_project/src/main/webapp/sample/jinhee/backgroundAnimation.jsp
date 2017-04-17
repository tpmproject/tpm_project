<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title> 배경색 애니메이션 변경 </title>
<script type="text/javascript" src="../../js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="../../js/jquery-ui.min.js"></script>
<style>
	body {
		font-family:Verdana, Geneva, sans-serif;
		font-size:13px;
	}
	#colorPicker div{
		float:left;
		width:70px;
		height:70px;
		text-align:center;
		color:#000;
		border:#000 thin solid;
		margin-right:5px;
	}
</style>
</head>

<body>

<div id = "colorPicker">
    <div>red</div>
    <div>maroon</div>
    <div>brown</div>
    <div>orange</div>
    <div>yellow</div>
</div>
      
<script>
$('#colorPicker div').each(function(index, element) {
	$(this).css("background-color", $(this).text());
});
 
$('#colorPicker div').click(function(e) {
	var color = $(this).text();
	$('body').animate({backgroundColor:color},1000);   
});
 
</script>
</body>
</html>
