<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../../js/jquery-1.7.2.min.js"></script>
<style>
	 div{
	 	 overflow:hidden;
	 	 width:300px;
	 	 display:inline;
	 }
</style>
</head>
<body>
	<div>
		<img src="sample.jpg" alt="" width="300" height="307"/>
	</div>

<button id ="up">slide감추기</button>
<button id ="down">slide보이기</button>

<script>

$('#down').click(function() {
  $('div').animate({width:"300px"},1000);  
});

$('#up').click(function() {
	$('div').animate({width:"0px"},1000);
});

</script>
</body>
</html>