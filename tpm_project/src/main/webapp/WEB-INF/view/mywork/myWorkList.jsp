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
    oneClass('workEnd','ing');
    showWorks();
});
//over notover 업무기한 초과 여부
//complete 완료 no, need, wait _confirm 결재-x, 필요, 대기
function oneClass(cb,name){
	
	var val_toggle=1;
	if(!($('#'+cb).is(':checked'))){
		val_toggle=-1;
	}
	
	var mwdiv=document.getElementById('mw_div').firstChild;
	var last=document.getElementById('mw_div').lastChild;
	do{
		if(mwdiv.nodeName=='DIV'){
			var fc=mwdiv.firstChild;
			var className=$(fc).attr('class');
			
			if(className.match(name)!=name){
				fc.value=parseInt(fc.value)+1*val_toggle;
			}
		}
		
		mwdiv=mwdiv.nextSibling;
	}while(mwdiv!=last);
	showWorks();
}

function showWorks(){
	var mwdiv=document.getElementById('mw_div').firstChild;
	var last=document.getElementById('mw_div').lastChild;
	do{
		if(mwdiv.nodeName=='DIV'){
			var inshow=mwdiv.firstChild;
			if(inshow.value>0){
				$(mwdiv).hide();
			}else{
				$(mwdiv).show();
			}
		}
		
		mwdiv=mwdiv.nextSibling;
	}while(mwdiv!=last);
	
}
function test(){
	var mwdiv=document.getElementById('mw_div').firstChild;
	var last=document.getElementById('mw_div').lastChild;
	do{
		if(mwdiv.nodeName=='DIV'){
			var fc=mwdiv.firstChild;
			var className=$(fc).attr('class');
			
			if(className.match(name)==name){
					
			}
		}
		
		mwdiv=mwdiv.nextSibling;
	}while(mwdiv!=last);
	
}
</script>
<style>
.over a{
	color:red;
}
</style>
</head>
<body>
<body class="skin-blue">
<%@include file="/WEB-INF/view/header.jsp"%>
<div>
	<div class="col-xs-3 col-xs-off-set-1">
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
					<td><input type="checkbox" id="workEnd" checked="checked" onclick="oneClass('workEnd','ing')">진행 중 업무</td>
				</tr>
				<tr>
					<td><input type="checkbox" id="over" onclick="oneClass('over','over')">마감일 지난 업무</td>
				</tr>
				<tr>
					<td><input type="checkbox" id="need" onclick="oneClass('need','need')">결재 미요청 업무</td>
				</tr>
				<tr>
					<td><input type="checkbox" id="wait" onclick="oneClass('wait','wait')">결재 대기 업무</td>
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
	<div style="background: green;" onclick="test()">test</div>
	<div class="col-xs-8" id="mw_div">
	<c:forEach var="i" items="${mwdto}">
		<c:choose>
		<c:when test="${i.work_state+i.work_confirm >= 20}">
			<c:set var="in_class" value="no_confirm"></c:set>
		</c:when>
		<c:when test="${i.work_state+i.work_confirm eq 11}">
			<c:set var="in_class" value="need_confirm"></c:set>
		</c:when>
		<c:when test="${i.work_state+i.work_confirm eq 12}">
			<c:set var="in_class" value="wait_confirm"></c:set>
		</c:when>
		</c:choose>	
	<div><input type="hidden" class="${in_class} ${i.work_state eq 3?'complete':'ing'} ${now>i.work_end?'over':'nver'}" value="0">
		<span>${i.project_name}<i class="glyphicon glyphicon-chevron-right"></i>${i.category_name}<i class="glyphicon glyphicon-chevron-right"></i></span>
		<c:remove var="in_class"/>
		<c:choose>
		<c:when test="${i.work_state eq 3}">
			<c:set var="state" value="panel-success"></c:set>
		</c:when>
		<c:when test="${i.work_state eq 2}">
			<c:set var="state" value="panel-warning"></c:set>
		</c:when>
		<c:when test="${now>i.work_end}">
			<c:set var="state" value="panel-danger"></c:set>
		</c:when>
		<c:otherwise>
			<c:set var="state" value="panel-info"></c:set>
		</c:otherwise>
		</c:choose>
		
		<div class="panel ${state}"><c:remove var="state"/>
			<div class="panel-heading">
			<div class="row">
				<div class="col-xs-10">${i.work_title}</div>
				<c:if test="${i.work_confirm eq 10}">
					<span class="label label-warning">결재</span>
				</c:if>
			</div>
			</div>
			<div class="panel-body ${i.work_state !=3 and now>i.work_end?'over':'notover'}" >
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