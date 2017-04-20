<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<Html>
<head>
<meta charset='utf-8'>
<title>부트스트랩 – 팝오버</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<style></style>
<script>$(document).ready(function() {
    $('[data-toggle="popover"]').popover({container: "body"});
});</script>
</head>
<body>
<div class="container">
	<h2>팝오버</h2>

	<button type="button" class="btn btn-default" title="Popover title" data-container="body" data-toggle="popover" data-placement="left" data-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus." data-trigger="hover">
		Popover on left
	</button>

	<button type="button" class="btn btn-default" title="Popover title" data-container="body" data-toggle="popover" data-placement="top" data-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus.">
		Popover on top
	</button>

	<button type="button" class="btn btn-default" title="Popover title"data-container="body" data-toggle="popover" data-placement="bottom" data-content="Vivamus
	sagittis lacus vel augue laoreet rutrum faucibus.">
		Popover on bottom
	</button>

	<button type="button" class="btn btn-default" title="Popover title" data-container="body" data-toggle="popover" data-placement="right" data-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus.">
		Popover on right
	</button>


		<a href="#" data-toggle="popover" data-placement="left" data-html="true" title="성향" data-content="<div></div>" data-delay='{ "hide": 500}' data-trigger="hover">you probably</a>


	<div>
		<br />Static text.
	</div>
	<div style="position: fixed;  left:0; top:300px;" id="fixed-div">
		<button type="button" class="btn btn-default" data-container="body" data-toggle="popover" data-placement="bottom" data-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus." id="popover">Popover123</button>
	</div>
</div>
</body>
</html>
