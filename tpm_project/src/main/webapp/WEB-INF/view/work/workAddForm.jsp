<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="f"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>TPM</title>

<link rel="stylesheet" href="bootstrap-3.3.2-dist/css/bootstrap.min.css">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<!-- Ionicons -->
<link href="http://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css" rel="stylesheet" type="text/css">
<!-- Morris chart -->
<link href="/tpm_project/sample/cho/main/plugins/morris/morris.css" rel="stylesheet" type="text/css">
<!-- Daterange picker -->
<link href="/tpm_project/sample/cho/main/plugins/daterangepicker/daterangepicker-bs3.css"
	rel="stylesheet" type="text/css">
<!-- Theme style -->
<link href="/tpm_project/sample/cho/main/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css">
<!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of
    downloading all of them to reduce the load. -->
<link href="/tpm_project/sample/cho/main/dist/css/skins/_all-skins.min.css" rel="stylesheet"
	type="text/css">

<!-- <script src="/tpm_project/sample/cho/main/plugins/iCheck/icheck.min.js" type="text/javascript"></script> -->	

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="bootstrap-3.3.2-dist/js/bootstrap.min.js"></script> -->
<script type="text/javascript" src="js/httpRequest.js"></script>
<script src="/tpm_project/js/ajax_extension.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/jquery.timepicker.min.js"></script>
<script src="/tpm_project/plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>
<link type="text/css" href="css/jquery-ui.min.css" rel="stylesheet">
<link type="text/css" href="css/jquery.timepicker.css" rel="stylesheet">
<link rel="stylesheet" href="/tpm_project/sample/aram/jquery.mCustomScrollbar.min.css" />
<link rel="stylesheet" href="/tpm_project/sample/aram/jquery.mCustomScrollbar.css" />
<script src="/tpm_project/sample/aram/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="/tpm_project/sample/aram/jquery.mCustomScrollbar.js"></script>
<script src="/tpm_project/bootstrap/js/bootstrap.js"></script>

<!-- 개인 성향  그래프-->
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/radar.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
<script>
window.onload=function(){
	$('#workdate').daterangepicker({timePicker: true, timePickerIncrement: 30, format: 'YYYY/MM/DD h:mm A'});
	$('[data-toggle="popover"]').popover();
	$(work_modal).hide();
	$(btnwork2).hide();
	$(work_modal2).hide();
	$(btnwork4).hide();
}
//업무추가
function showf(category_idx){
	$(workback).fadeIn('150');
	$(work_modal).fadeIn('150');
	$(w_modal).show();
	$(btnwork2).hide();
	document.newWork.category_idx.value=category_idx;
}
function showf2() {
	$(w_modal2).show();
	$(btnwork4).hide();
}
function workUpdate(work_idx,work_start,work_end,work_confirm){
	$('#workdateup').daterangepicker({timePicker: true, timePickerIncrement: 30, format: 'YYYY/MM/DD h:mm A'});
	$(workback2).fadeIn('150');
	$(work_modal2).fadeIn('150');
	$(w_modal2).show();
	$(btnwork4).hide();
	
	var wdiv=document.getElementById('wdiv'+work_idx);
	var fc=wdiv.firstChild;
	while(fc.nodeName!='SPAN'){
		fc=fc.nextSibling;
	}
	work_title=fc.innerHTML;
	document.changeWork.work_idx.value=work_idx;
	document.changeWork.work_title.value=work_title;
	document.changeWork.workdateup.value=work_start+"-"+work_end;
	if(work_confirm==10){
		document.changeWork.work_confirm.setAttribute('checked','checked');
	}
}
function shows(){
	var wtit=document.newWork.work_title.value;
	var wsta=document.newWork.workdate.value;
	if (wtit == null || wtit == "" || !wsta ) {
		window.alert('업무명과 기한 모두 입력 부탁 드립니다.');
		showf();
		return;
	}
	$(w_modal).fadeOut();
	$(btnwork2).fadeIn();
	var p=${pdto.project_idx};
	sendRequest('workAdd.do?project_idx='+p,null,showsResult,'GET');
	
}
function shows2(){
	var wtit=document.changeWork.work_title.value;
	var wsta=document.changeWork.workdateup.value;
 	if (wtit == null || wtit == "" || !wsta ) {
		window.alert('업무명과 기한 모두 입력 부탁 드립니다.');
		return;
	}
	$(w_modal2).hide();
	$(btnwork4).show();
	var p=${pdto.project_idx};
	var w=document.changeWork.work_idx.value;
	var m= ${s_member_idx}
	sendRequest('workUpdate.do?project_idx='+p+'&work_idx='+w+'&member_idx='+m,null,shows2Result,'GET');
	
}
function showsResult(){
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var result = XHR.responseText;	
			var json = JSON.parse(result);		
			var msg2 = '';
			var members = json.members; // 맵 객체로부터 members 값인 배열을 가져온다.
			for (var i = 0; i < members.length; i++) {
				var member = members[i];
				msg2 += '<div id="work_member'+member.member_idx+'"onmouseover="showTen('+member.member_idx+')" onmouseleave="hideTen('+member.member_idx+')" draggable="true" ondragover="allowDrop(event)" ondragstart="drag(event)">';
				msg2 += '<img height="30" width="30" class="thumb-lg img-circle bx-s" ';
				msg2 += 'src="/tpm_project/img/member/profile/' + member.member_img + '"> ';
				msg2 += member.member_name;
				msg2 += '<p class="text-muted">' + member.member_id	+ '</p> ';
				msg2 += '</div> ';
			}
			var project_m = document.getElementById('project_m');
			project_m.innerHTML = msg2;		
		}
	}
}
function shows2Result(){
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var result = XHR.responseText;
			var json = JSON.parse(result);	
			var w_msg='';
			var p_msg='';
			var msg2 = '';
			var members = json.members; // 맵 객체로부터 members 값인 배열을 가져온다.
			for (var i = 0; i < members.length; i++) {
				var member = members[i];
				msg2 += '<div id="work2_member'+member.member_idx+'" draggable="true" ondragover="allowDrop(event)" ondragstart="drag(event)">';
				msg2 += '<img height="30" width="30" class="thumb-lg img-circle bx-s" ';
				msg2 += 'src="/tpm_project/img/member/profile/' + member.member_img + '"> ';
				msg2 += member.member_name;
				msg2 += '<p class="text-muted">' + member.member_id	+ '</p> ';
				msg2 += '</div> ';
				if(member.pm==1){
					w_msg+=msg2;
				}else{
					p_msg+=msg2;
				}
				msg2='';
			}
			var w_List=document.getElementById('work_m2');
			w_List.innerHTML = w_msg;
			var p_List=document.getElementById('project_m2');
			p_List.innerHTML=p_msg;	
		}
	}
}
function closem() {
	$(workback).fadeOut('100');
	$(workback2).fadeOut('100');
	$(work_modal).fadeOut('100');
	$(work_modal2).fadeOut('100');
	document.newWork.reset();
	document.changeWork.reset();
}
function addWork(){
 	var work_member=document.getElementById('work_m');
	var fch = work_member.firstChild;
	var lch = work_member.lastChild;
	if(document.newWork.work_confirm.checked==true){
		document.newWork.work_confirm.value='10';
	}else{
		document.newWork.work_confirm.value='20';
	}
	var msg='';
	var count=0;
	while(true){
		if(fch.nodeName=='DIV'){
			var idx=fch.getAttribute('id');
			if(count==0){
				msg+=idx.substring(11);
				count++;
			}else{
			msg+=','+idx.substring(11);
			}
		}
		if(fch==lch)break;
		fch=fch.nextSibling;
	}
	var my_idx=${s_member_idx};
	var param = 'category_idx=' + document.newWork.category_idx.value
	+'&work_title=' + document.newWork.work_title.value
	+'&workdate=' + document.newWork.workdate.value 
	+'&work_confirm=' + document.newWork.work_confirm.value
	+'&member_idx=' + msg;
	sendRequest('workAdd.do', param, addWorkResult, 'POST');
}
function addWorkResult(){
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var result = XHR.responseText;
			location.reload();
		}
	}
}
function updateWork(){
 	var work_member=document.getElementById('work_m2');
	var fch = work_member.firstChild;
	var lch = work_member.lastChild;
	if(document.changeWork.work_confirm.checked==true){
		document.changeWork.work_confirm.value='10';
	}else{
		document.changeWork.work_confirm.value='20';
	}
	var msg='';
	var count=0;
	while(true){
		if(fch.nodeName=='DIV'){
			var idx=fch.getAttribute('id');
			if(count==0){
				msg+=idx.substring(12);
				count++;
			}else{
			msg+=','+idx.substring(12);
			}
		}
		if(fch==lch)break;
		fch=fch.nextSibling;
	}
	var my_idx=${s_member_idx};
	var param = 'work_idx=' + document.changeWork.work_idx.value
	+'&work_title=' + document.changeWork.work_title.value
	+'&workdateup=' + document.changeWork.workdateup.value 
	+'&work_confirm=' + document.changeWork.work_confirm.value 
	+'&member_idx=' + msg;
	sendRequest('workUpdate.do', param, updateWorkResult, 'POST');
}
function updateWorkResult(){
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var result = XHR.responseText;	
			location.reload();
		}
	}
}
//ondragstart 드래그할 때 id값 가져오기!
function drag(ev) {
    ev.dataTransfer.setData("text", ev.target.id);
}
//업무 생성 시 멤버 추가 드랍
function drop2(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    if(data.startsWith('work_member')){
    	var comp=document.getElementById(data);
    	document.getElementById('work_m').appendChild(comp);
    }
}
//업무 생성 시 멤버 빼기 드랍
function drop3(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    if(data.startsWith('work_member')){
    	var comp=document.getElementById(data);
	  	document.getElementById('project_m').appendChild(comp);
    }
}
//업무 수정 멤버 추가 드랍
function drop4(ev){
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    if(data.startsWith('work2_member')){
    	var comp=document.getElementById(data);
    	document.getElementById('work_m2').appendChild(comp);
    }
}
//업무 수정 멤버 빼기 드랍
function drop5(ev){
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    if(data.startsWith('work2_member')){
    	var comp=document.getElementById(data);
	  	document.getElementById('project_m2').appendChild(comp);
    }
}
//ondrop =>나 위에 드랍했을 때 일어나는 이벤트 ->data는 드래그 당한 컴포넌트
function workDrop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
}
//추천 목록
function tendencyList(member_idx){
	var param = 'member_idx='+member_idx;
	sendRequest('recommand.do',param,tendencyListResult,'POST');
}
function tendencyListResult(){
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var result = XHR.responseText;
			
			var json = JSON.parse(result);		
			var msg2 = '';
			var members = json.members; // 맵 객체로부터 members 값인 배열을 가져온다.
			for (var i = 0; i < members.length; i++) {
				var member = members[i];
				msg2 += '<div>'+member.member_name+'</div>';
			}
			document.getElementById('tendency_pop').innerHTML(msg2);
		}
	}
}
function showTen(member_idx){
	var tenT=$('#work_member'+member_idx).offset().top;
	var tenL=$('#work_member'+member_idx).offset().left+120;
	$('#tendency_pop').css('top',tenT+'px');
	$('#tendency_pop').css('left',tenL+'px');
	$('#tendency_pop').fadeIn();
	var param = 'member_idx='+member_idx;

	sendRequest('recommand.do',param,tendencyListResult,'POST');
}
function hideTen(){
	$('#tendency_pop').hide();
}
</script>
<style>
#tendency_pop{
	background: green;
	position:fixed;
	display: none;
	width:400px;
	height: 400px;
	z-index: 10;
}
#workback, #workback2 {
	position: fixed;
	z-index:0;
	top: -10%;
	left: -10%;
	width: 110%;
	height: 110%;
	background: gray;
	opacity: 0.7;
	display: none;
}
#work_modal, #work_modal2 {
	display: none;
	background: white;
	position: fixed;
	z-index:5;
	top: 20%;
	left: 35%;
	border: solid 2px #1a2226;
	border-radius: 3px;
	width: 665px;
	height: 480px;
}
.content{
	height:780px;
	overflow:auto;
}
.wdiv {
	width: 200px;
	padding-left: 10px;
}
a {
	color: black;
}
.work_btn{
	display: inline-block;
	height: 26px;
	width: 75px;
	margin-bottom: 8px;
    margin-top: 8px;
    padding-top: 4px;
    text-align: center;
    font-size: large;
}
</style>
</head>
<body class="skin-blue">
	<!-- 업무 설정 modal -->
	<form name="newWork" action="workAdd.do" method="post">
		<div id="workback" onclick="closem()"></div>
		<div id="work_modal">
			<button type="button" class="close" style="padding: 10px; color:white;"onclick="closem()">×</button>
			
			<h4 class="modal-title" style=" background: #222d32;  padding: 10px; border-radius: 0px; color:white;"><i class="glyphicon glyphicon-plus"></i> Add Work</h4>

			<div id="w_modal">
				<div id="btnwork">
					<div style=" padding:10px;">
						<input type="hidden" name="category_idx" value=""> <label>업무명
						</label>&nbsp;&nbsp;<input type="text" name="work_title">
					</div>
					<div class="form-group">
						<div class="input-group">
							<div class="input-group-addon">
								<i class="fa fa-clock-o"></i>
							</div>
							<input type="text" class="form-control pull-right" placeholder="기한을 체크해주세요."
								name="workdate" id="workdate" />
						</div>
						<!-- /.input group -->
					</div>
					<div align="center" style="padding:5px;">
						<input type="checkbox"  name="work_confirm">결재여부
						<button type="button" class="btn btn-next" style="background-color:#1e282c; color:white;"  id="btn-worknext"
							onclick="shows()">다음</button>

					</div>

				</div>
			</div>

			<div id="btnwork2">
				<div class="section">
					<div class="container">
						<div class="row">
							<div class="col-md-3" style="width:330px;">
								<h4 class="text-center">프로젝트 멤버 목록</h4>
								<div id="project_m"
									style="width: 100%; height: 320px; overflow-y: scroll"
									ondrop="drop3(event)" ondragover="allowDrop(event)"
									ondragstart="drag(event)"></div>
							</div>
							<div class="col-md-3" style="width:310px;" ondrop="drop(event)"
								ondragover="allowDrop(event)" ondragstart="drag(event)">
								<h4 class="text-center">업무 담당자</h4>
								<div id="work_m"
									style="width: 100%; height: 320px; overflow-y: scroll"
									ondrop="drop2(event)" ondragover="allowDrop(event)"
									ondragstart="drag(event)"></div>
							</div>
						</div>
					</div>
				</div>
				<div align="center" style="padding:7px;">
					<button type="button" class="btn btn-next" style="background-color:#1e282c; color:white;" id="btn-workbefore"
						onclick="showf()">이전</button>
					<button type="button" class="btn btn-next" style="background-color:#1e282c; color:white;" id="btn-workok"
						onclick="addWork()">완료</button>
				</div>
			</div>
		</div>
	</form>
	<div id="tendency_pop">
		헥사그래프
	</div>
</body>
</html>