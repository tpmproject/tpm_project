<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>TPM</title>
<!-- <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"
    rel="stylesheet" type="text/css">
    <link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css"   rel="stylesheet" type="text/css"> -->
<link rel="stylesheet" href="bootstrap-3.3.2-dist/css/bootstrap.min.css">
<%@ include file="/sample/cho/main/import.jsp"%>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script src="/tpm_project/js/ajax_extension.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/jquery.timepicker.min.js"></script>
<script src="/tpm_project/plugins/daterangepicker/daterangepicker.js"
	type="text/javascript"></script>
<link type="text/css" href="css/jquery-ui.min.css" rel="stylesheet">
<link type="text/css" href="css/jquery.timepicker.css" rel="stylesheet">
</head>
<body>
<body class="skin-blue">
<%@include file="/WEB-INF/view/header.jsp"%>
<div class="container-fluid">
	<div id="menutest" class="col-xs-2">
		<table class="table">
			<thead>
				<tr>
					<th>기간</th>
				</tr>
			</thead>
			<tbody>
				<tr></tr>
				<tr>
					<td><select>
							<option>30일</option>
							<option>15일</option>
							<option>7일</option>
							<option>1일</option>
					</select></td>
				</tr>
				<tr>
					<th>필터</th>
				</tr>
				<tr>
					<td><input type="checkbox">결재대기 업무</td>
				</tr>
				<tr>
					<td><input type="checkbox">완료 업무</td>
				</tr>
				<tr>
					<td><input type="checkbox">마감일 지난 업무</td>
				</tr>
				<tr>
					<td><input type="checkbox">이번달까지 업무</td>
				</tr>
				<tr>
					<th>프로젝트</th>
				</tr>
				<tr>
					<td><input type="checkbox">myproject1</td>
				</tr>
				<tr>
					<td><input type="checkbox">myproject2</td>
				</tr>
				<tr>
					<td col="2"><input value="필터 취소" type="reset"></td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<div class="col-xs-9">
	</div>
</div>
<%@include file="/WEB-INF/view/footer.jsp"%>

</body>
</html>