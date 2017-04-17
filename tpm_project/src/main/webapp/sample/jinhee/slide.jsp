<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"
    rel="stylesheet" type="text/css">
    <link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css"
    rel="stylesheet" type="text/css">
<title>Insert title here</title>
</head>

<script src="../../js/jquery-1.7.2.min.js"></script>

<body>
		<button id="up" style="background-color:transparent;"> slide감추기<i class="fa fa-1x fa-fw fa-angle-up"></i> </button>
		<button id="down" style="background-color:transparent;"> slide보이기<i class="fa fa-1x fa-fw fa-angle-down"></i> </button>
		
	<div style="background-color: skyblue; width: 300px; height: 300px;">
		테스트~
	</div>
	
<script>

$('#up').click(function() {
  $('div').slideUp(1000, function() {
    //alert('지금 상태는'+$(this).css("display")+"입니다.");
  });
});

$('#down').click(function() {
  $('div').slideDown(1000, function() {
    //alert('지금 상태는'+$(this).css("display")+"입니다.");
  });
});

</script>
</body>
</html>