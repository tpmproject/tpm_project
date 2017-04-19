<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="f"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<jsp:useBean id="now" class="java.util.Date"/>
<meta charset=UTF-8>
<title>TPM</title>
<!-- <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"
    rel="stylesheet" type="text/css">
    <link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css"   rel="stylesheet" type="text/css"> -->
<!-- <link rel="stylesheet" href="bootstrap-3.3.2-dist/css/bootstrap.min.css"> -->
<%@ include file="/WEB-INF/view/include/import.jsp"%>
<!-- <script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="bootstrap-3.3.2-dist/js/bootstrap.min.js"></script> -->
<script type="text/javascript" src="js/httpRequest.js"></script>
<script src="/tpm_project/js/ajax_extension.js" type="text/javascript"></script>
<!-- <script type="text/javascript" src="js/jquery.js"></script> -->
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/jquery.timepicker.min.js"></script>
<script src="/tpm_project/plugins/daterangepicker/daterangepicker.js"
	type="text/javascript"></script>
<link type="text/css" href="css/jquery-ui.min.css" rel="stylesheet">
<link type="text/css" href="css/jquery.timepicker.css" rel="stylesheet">
<script src="/tpm_project/js/scroll/jquery.slimscroll.min.js"></script>
<script>
$(function(){
    $('#mw_div').slimScroll({
        height: '650px', // 스크롤 처리할 div 의 길이
    });
});
function workEnd(){
	$('.end').toggle('show');
}
function over(){
	$('.notover').toggle('show');
}
</script>
</head>
<body>
<body class="skin-blue">
<%@include file="/WEB-INF/view/header.jsp"%>
<div>
	<div class="col-xs-2">
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
					<td><input type="checkbox" onclick="workEnd()">진행 중 업무</td>
				</tr>
				<tr>
					<td><input type="checkbox" onclick="over()">마감일 지난 업무</td>
				</tr>
				<tr>
					<td><input type="checkbox">이번달까지 업무</td>
				</tr>
				<tr>
					<th>프로젝트</th>
				</tr>
				<c:if test="${not empty mwdto }"></c:if>
				<c:forEach var="i" items="${mwdto}">
				<tr>
					<td><input type="checkbox">${i.project_name}</td>
				</tr>
				</c:forEach>
				<tr>
					<td col="2"><input value="필터 취소" type="reset"></td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<div class="col-xs-8" id="mw_div">
	
	<c:forEach var="i" items="${mwdto}">
	<div class="${i.work_state eq 3?'end':'ing' } ${now>i.work_end?'over':'notover'}">
		<span>${i.project_name}<i class="glyphicon glyphicon-chevron-right"></i>${i.category_name}<i class="glyphicon glyphicon-chevron-right"></i></span>
		
		<c:choose>
		<c:when test="${i.work_state eq 3}">
			<c:set var="state" value="panel-success"></c:set>
		</c:when>
		<c:when test="${now>i.work_end}">
			<c:set var="state" value="panel-danger"></c:set>
		</c:when>
		<c:otherwise>
			<c:set var="state" value="panel-info"></c:set>
		</c:otherwise>
		</c:choose>
		
		<div class="panel ${state}">
			<div class="panel-heading">${i.work_title}</div>
			<div class="panel-body">
			<i class="glyphicon glyphicon-calendar"></i><a><f:formatDate value="${i.work_start}" type="both" pattern="yyyy/MM/dd  hh:mm"/> </a>~<a><f:formatDate value="${i.work_end}" type="both" pattern="yyyy/MM/dd  hh:mm"/></a>
			</div>
		</div>
	</div>
	</c:forEach>
	
	
	</div>
</div>
<%@include file="/WEB-INF/view/footer.jsp"%>

</body>
</html>