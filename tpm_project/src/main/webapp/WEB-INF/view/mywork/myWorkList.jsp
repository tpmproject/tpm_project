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
<%@ include file="/WEB-INF/view/include/import.jsp"%>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script src="/tpm_project/js/ajax_extension.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<!-- <script type="text/javascript" src="js/jquery.timepicker.min.js"></script> -->
<script src="/tpm_project/plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>
<!-- <link type="text/css" href="css/jquery-ui.min.css" rel="stylesheet"> -->
<!-- <link type="text/css" href="css/jquery.timepicker.css" rel="stylesheet"> -->
<link href="/tpm_project/plugins/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
<script src="/tpm_project/js/scroll/jquery.slimscroll.min.js"></script>
<script>
$(function(){
	$('#workdate').daterangepicker({timePicker: false, format: 'YY/MM/DD'});
    $('#scr').slimScroll({
        height: '650px'
    });
    oneClass('workEnd','ing');
    showWorks();
});

//cb에는 체크박스 id, name에는 남길 class이름
function oneClass(cb,name){
	
	var val_toggle=1;
	var hideName=null;
	if(name.startsWith('project')){
		if($('#'+cb).is(':checked')){
			val_toggle=-1;
		}
		hideName=name;
	}else if(!($('#'+cb).is(':checked'))){
		val_toggle=-1;
	}
	
	var mwdiv=document.getElementById('mw_div').firstChild;
	var last=document.getElementById('mw_div').lastChild;
	do{
		if(mwdiv.nodeName=='DIV'){
			var fc=mwdiv.firstChild;
			var className=$(fc).attr('class');
			
			if(className.match(name)==hideName){
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
function min_max(work_idx){
	$('#'+work_idx).toggle('show');
	$('#i'+work_idx).toggleClass('glyphicon-minus glyphicon-plus');
	
}
function workDate(){
	window.alert($('#workDate'.val()));
}
function test(){
	var da=$('#workdate').val();
	window.alert(da);
}
function nonono(){
	
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
			<tbody>
				<tr></tr>
				<tr>
					<th>
						<span>업무 마감 기간</span>
					</th>
				</tr>
				<tr>
					<td>
						<input type="text" name="workdate" id="workdate" size="15px" onkeydown="nonono()"/>
						<span onclick="test()"><i class="glyphicon glyphicon-search"></i></span>
					</td>
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
				<c:if test="${not empty mwdto and not empty pmap }">
				<c:forEach var="i" items="${pmap}">
				<tr>
					<td><input type="checkbox" checked="checked" id="${i.key}" onclick="oneClass('${i.key}','project${i.key}')">${i.value}</td>
				</tr>
				</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
	<div id="scr">
	<div id="mw_div" style="width:80%;max-width: 700px;">
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
	<div><input type="hidden" class="project${i.project_idx} ${in_class} ${i.work_state eq 3?'complete':'ing'} ${now>i.work_end?'over':'nver'}" value="0">
		<span onclick="min_max(${i.work_idx})"><i id="i${i.work_idx}" class="glyphicon glyphicon-minus"></i>${i.project_name}<i class="glyphicon glyphicon-chevron-right"></i>${i.category_name}<i class="glyphicon glyphicon-chevron-right"></i></span>
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
		
		<div id="${i.work_idx}" class="panel ${state}"><c:remove var="state"/>
			<div class="panel-heading">
			<div class="row">
				<div class="col-xs-10"><a href="projectContent.do?project_idx=${i.project_idx}&member_idx=${s_member_idx}">${i.work_title}</a></div>
				<c:if test="${i.work_confirm eq 10}">
					<span class="label label-warning">결재</span>
				</c:if>
			</div>
			</div>
			<div class="panel-body ${i.work_state !=3 and now>i.work_end?'over':'notover'}" >
			<i class="glyphicon glyphicon-calendar"></i><a><f:formatDate value="${i.work_start}" type="both" pattern="yyyy/MM/dd  HH:mm"/>&nbsp;~&nbsp;<f:formatDate value="${i.work_end}" type="both" pattern="yyyy/MM/dd  HH:mm"/></a>
			<c:if test="${i.work_state==3}">
			<span><i class="glyphicon glyphicon-ok" style="color: green;"></i><f:formatDate value="${i.work_complete}" type="both" pattern="yyyy/MM/dd  HH:mm"/></span>
			</c:if>
			</div>
		</div>
	</div>
	</c:forEach>
	
	
	</div>
	</div>
</div>
<%@include file="/WEB-INF/view/footer.jsp"%>

</body>
</html>