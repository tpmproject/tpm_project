<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>.change() 메서드</title>
<script type="text/javascript" src="jquery-3.1.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

	      $( "select" ).change(function () {
		    $( "div" ).text( $("option:selected").text() );
		  });
   
	});
</script>
</head>
<body>
<select name="sweets">
  <option>쵸콜릿</option>
  <option>캔디</option>
  <option selected="selected">사탕</option>
  <option>아이스크림</option>
  <option>쿠키</option>
</select>
<div></div>
</body>
</html>