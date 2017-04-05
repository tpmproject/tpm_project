<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="bootstrap-3.3.2-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap-3.3.2-dist/css//bootstrap-theme.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript">
$(function(){
    $("#workAdd").click(function(){
        $('div.modal').modal({remote : 'workAdd.do'});
    })
})
</script>
</head>
<body>
<button class="btn btn-default" id="workAdd">설정</button>
<div class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
    	<!-- remote ajax call이 되는영역 -->
    </div>
  </div>
</div>
</body>
</html>