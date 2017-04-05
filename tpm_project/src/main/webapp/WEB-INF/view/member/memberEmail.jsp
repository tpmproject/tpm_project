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
	<script>
		window.alert('${result}');
	</script>
<body>
	<div class="container">
       	<form role="form" name="EmailCheck" action="memberEmailCheck.do" method="post">
            <input type="hidden" name="random_number" value="${random}">
			<input type="hidden" name="email" value="${email}">
           <br>
           	<div class="form-group">
               <div class="input-group">
               	<input type="text" class="form-control" maxlength="6" placeholder="인증번호를 입력해주세요">
                 	<span class="input-group-btn">
                   	<a class="btn btn-success" type="submit"> 인증하기 </a>
                 	</span>
               </div>
         	</div>
        </form>
	</div>
</body>
</html>