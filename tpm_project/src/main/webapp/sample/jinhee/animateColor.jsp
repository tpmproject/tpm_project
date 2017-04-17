<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title> animateColor </title>

<!-- jQuery library -->
<script src="../../js/jquery-1.7.2.min.js"></script>
<!-- script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.23/jquery-ui.min.js"></script -->
<script src="../../js/jquery-ui-1.8.23.custom.min.js"></script>

<style>
li {list-style:none; float:left;width:200px; height:60px;}
li a{
    background:#9AB92E;
	width:200px;
	height:60px;
	display:block;
	text-align:center;
	color:black;
	padding:40px 0px 10px;
	font:bold 25px Verdana, Geneva, sans-serif;
	text-decoration: none;
}
</style>

</head>
<body>
	<ul>
	    <li><a href="#" data-bg="#EF4018">Home</a></li>
	    <li><a href="#" data-bg="#00C8C3">About</a></li>
	    <li><a href="#" data-bg="#AA184D">portfolio</a></li>
	    <li><a href="#" data-bg="#05184D">Contact</a></li>
	</ul>
	
<script>
$("li a").hover(	
    function(){
   	   var overColor = $(this).attr("data-bg");
	  // console.log(overColor)
       $(this).stop().animate({"background-color":overColor,
	   							"color":"white"},300);
	}, 
	function(){
 		$(this).stop().animate({"background-color":"#9AB92E",
		                        "color":"black"},300);
	});

</script>
</body>
</html>