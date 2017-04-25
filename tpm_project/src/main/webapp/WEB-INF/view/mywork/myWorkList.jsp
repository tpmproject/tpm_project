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
<!-- ws-->
<script type="text/javascript" src="/tpm_project/js/sockjs.min.js"></script>
<script type="text/javascript" src="js/project/ws_project.js"></script>

<script>
$(function(){
	$('#workdate').daterangepicker({timePicker: false, format: 'YY/MM/DD'});
    $('#scr').slimScroll({
        height: '650px'
    });
    oneClass('workEnd','ing');
    showWorks();

});
//ws 응답시 @overriding
function onMessage(evt) {
	var data = evt.data;
	data=data.split(',');
	if(data[0]=='work'){
		var work_idx=data[1];
		if(data[2]=='work_state'){
			var ws=data[3];
			ws=parseInt(ws);
			
			changeWorkState(work_idx,ws);
		}
	}
}

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
				fc.value=parseInt(fc.value)+val_toggle;
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
				if(inshow.value==100){
					$(mwdiv).show();
				}else{
					$(mwdiv).hide();
				}
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
function searchDate(){
	var da=$('#workdate').val();
	var daa=da.split(' - ');
	
	var mwdiv=document.getElementById('mw_div').firstChild;
	var last=document.getElementById('mw_div').lastChild;
	do{
		if(mwdiv.nodeName=='DIV'){
			var endd=mwdiv.firstChild.nextSibling.nextSibling;
			if(endd.nodeName=='INPUT'){
				endd=endd.value;
				var fc=mwdiv.firstChild;
				if(daa[0]<=endd && endd <=daa[1]){
					
					fc.value=(parseInt(fc.value)%100)+100;
				}else{
					fc.value=parseInt(fc.value)%100+200;
				}
			}
		}
		
		mwdiv=mwdiv.nextSibling;
	}while(mwdiv!=last);
	showWorks();
}
function workDone(work_idx,work_state){
	var param="work_idx="+work_idx+"&work_state="+work_state;
	sendRequest('workUpdate.do', param, updateWorkResult, 'POST');
}

function workDone(project_idx,work_idx,work_state){
	var param="project_idx="+project_idx+"&work_idx="+work_idx+"&work_state="+work_state;
	sendRequest('workUpdate.do', param, updateWorkResult, 'POST');	
}
function updateWorkResult(){
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var result = XHR.responseText;
			var wData=eval('('+result+')');
			var wi=wData.work.work_idx;
			
			if(wi==0){
				window.alert('권한이 없습니다.');
				return;
			}
			
			var ws=wData.work.work_state;
			ws=parseInt(ws);
			
			//ws
			msg=['work',wi,'work_state',ws];
			updateWS(msg);

		}
	}
}

function changeWorkState(wi,ws){
	var firstC=document.getElementById('work_state'+wi).firstChild;
	var lastC=document.getElementById('work_state'+wi).lastChild;
	do{
		if(firstC.nodeName=='I'){
			var wsColor='black';
			
			if(firstC.getAttribute('name')==ws){
				var pclass='';
				switch(ws){
					case 1:wsColor='#367fa9';pclass='panel panel-info';break;
					case 2:wsColor='#f0ad4e';pclass='panel panel-warning';break;
					case 3:wsColor='green';pclass='panel panel-success';				
				}
				
				var temp=firstC.parentNode.parentNode.getAttribute('class');
				if(ws!=3 && temp.match('over')!=null){
					pclass='panel panel-danger';
				}
				
				$('#'+wi).removeClass();
				$('#'+wi).addClass(pclass);	
			}
			firstC.style.color=wsColor;
		}
		firstC=firstC.nextSibling;
	}while(firstC!=lastC);
	
	
}
</script>
<style>
.over a{
	color:red;
}
.work_btn{
	float:right;
    text-align: center;
    font-size: large;
}
.help{
	display: inline-block;
	width: 100px;
	height: 20px;
	border-radius: 5px;
	text-align: center;
}
</style>
</head>
<body class="skin-${sessionScope.s_member_thema}">
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
						<input type="text" name="workdate" id="workdate" size="15px"/>
						<span onclick="searchDate()"><i class="glyphicon glyphicon-search"></i></span>
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
				<!-- ws접속 -->
				<script>connect(${i.key})</script>
				<tr>
					<td><input type="checkbox" checked="checked" id="${i.key}" onclick="oneClass('${i.key}','project${i.key}')">${i.value}</td>
				</tr>
				</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
	<div id="scr">
	<div>
		<div class="help" style="background: #d0e9f5; ">진행 중</div>
		<div class="help" style="background: #fbf5d9;">결재 대기</div>
		<div class="help" style="background: #f0d9d9;">마감일 초과</div>
		<div class="help" style="background: #d7ecce;">완료</div>
	</div>
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
	<div><input id="input${i.work_idx}" type="hidden" class="project${i.project_idx} ${in_class} ${i.work_state eq 3?'complete':'ing'} ${now>i.work_end?'over':'nver'}" value="0">
		
		<c:set var="endDate">
		<f:formatDate value="${i.work_end}" type="both" pattern="yy/MM/dd"/>
		</c:set>
		<input type="hidden" name="endDate" value="${endDate}">
		
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
			<div class="panel-body ${i.work_state !=3 and now>i.work_end?'over':'nver'}" >
			<i class="glyphicon glyphicon-calendar"></i><a><f:formatDate value="${i.work_start}" type="both" pattern="yyyy/MM/dd  HH:mm"/>&nbsp;~&nbsp;<f:formatDate value="${i.work_end}" type="both" pattern="yyyy/MM/dd  HH:mm"/></a>
			
			<span class="work_btn" id="work_state${i.work_idx}">												
				<i name="1" class="glyphicon glyphicon-play-circle" ${i.work_state eq 1?'style="color:#367fa9;"':''} data-toggle="tooltip" data-placement="bottom" title="진행 중" onclick="workDone(${i.project_idx},${i.work_idx},1)"></i>
			<c:if test="${i.work_confirm ==10}">
				<i name="2" class="glyphicon glyphicon-record" ${i.work_state eq 2?'style="color:#f0ad4e;" data-toggle="tooltip" data-placement="bottom" title="결재 대기"':'data-toggle="tooltip" data-placement="bottom" title="결재 요청"'} onclick="workDone(${i.project_idx},${i.work_idx},2)"></i>
			</c:if>
				<i name="3" class="glyphicon glyphicon-ok-circle" ${i.work_state eq 3?'style="color:green;"':''} data-toggle="tooltip" data-placement="bottom" title="완료" onclick="workDone(${i.project_idx},${i.work_idx},3)"></i>
			</span>
			
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