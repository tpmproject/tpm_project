<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>.slideToggle() 메서드</title>
<style>
  p {
    width: 400px;
  }
</style>
<script type="text/javascript" src="jquery-3.1.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$( "button" ).click(function() {
		  $( "p" ).slideToggle( "slow" );
	});
});
</script>
</head>
<body>
<button>Toggle</button>
<p>
  죽는 날까지 하늘을 우러러
  한 점 부끄럼이 없기를
  잎새에 이는 바람에도
  나는 괴로워했다. ...
</p>
</body>
</html>